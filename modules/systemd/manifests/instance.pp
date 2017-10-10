# For giving a user their own systemd, assumes that systemwide systemd is
# already good to go.
define systemd::instance(
  $user  = $name,
  $home  = undef,
  $group = 'users',
) {
  include systemd::base

  if $user == 'root' {
    fail "Systemd::Instance[${name}]: user ${user} may not have a systemd user instance"
  }

  $home_ = pick($home, "/home/${user}")

  anchor {
    "systemd/roots-created:${user}": ;
    "systemd/dropin-dirs-created:${user}": require => Anchor["systemd/roots-created:${user}"];
    "systemd/units-configured:${user}":    require => Anchor["systemd/dropin-dirs-created:${user}"];
    "systemd/daemon-reloaded:${user}":
      require => [
        Anchor["systemd/units-configured:*"],
        Anchor["systemd/units-configured:${user}"],
      ];
    "systemd/units-actioned:${user}":      require => Anchor["systemd/daemon-reloaded:${user}"];
  }



  systemd::linger { $name:
    enable => true,
    user   => $user;
  }


  file { [
    "${home_}/.config",
    "${home_}/.config/systemd",
    "${home_}/.config/systemd/user",
    "${home_}/.config/systemd/user/multi-user.target.wants",
  ]:
    ensure => directory,
    mode   => '0700',
    owner  => $user,
    group  => $group,
    before => Anchor["systemd/roots-created"];
  }

  # Fix up the default "runlevel" (target) for the systemd instance
  file { "${home_}/.config/systemd/user/default.target.wants":
    ensure => link,
    target => "${home_}/.config/systemd/user/multi-user.target.wants",
    owner  => $user,
    group  => $group,
  }

  exec { "systemd/daemon-reload:${user}":
    command     => shell_join([ "/bin/systemctl", "--user", "daemon-reload" ]),
    refreshonly => true,
    user        => $user,
    require     => Exec["systemd/linger/enable-linger:${user}"],
    subscribe   => [
      Anchor["systemd/units-configured:*"],
      Anchor["systemd/units-configured:${user}"],
    ],
    notify      => Anchor["systemd/daemon-reloaded:${user}"];
  }






}
