# Enables lingering for a user, which means they can keep a systemd instance
define systemd::linger(
  $enable = true,
  $user   = $name,
) {
  include systemd::base

  if $enable {
    exec { "systemd/linger/enable-linger:${user}":
      command => shell_join([ "/bin/loginctl", "enable-linger", $user ]),
      creates => "/var/lib/systemd/linger/${user}",
      require => User[$user];
    }
  } else {
    exec { "systemd/linger/disable-linger:${user}":
      command => shell_join([ "/bin/loginctl", "disable-linger", $user ]),
      onlyif  => shell_join([ "/bin/test", "-f", "/var/lib/systemd/linger/${user}" ]);
    }
  }
}
