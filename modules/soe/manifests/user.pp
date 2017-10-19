# Manage users
define soe::user {
  user { $name:
    comment        => 'shell user',
    gid            => 'users',
    shell          => '/bin/bash',
    home           => "/home/${name}",
    managehome     => true,
    password       => "!!",
    purge_ssh_keys => true,
  }

  file {
    "/home/${name}":
      ensure => directory,
      mode   => '0701';
    "/home/${name}/.ssh":
      ensure => directory,
      owner  => $name,
      group  => 'users',
      mode   => '0700';
  }

  $ssh_authorized_keys = hiera_hash('ssh_authorized_keys', undef)
  if $ssh_authorized_keys {
    create_resources('ssh_authorized_key', $ssh_authorized_keys)
  }
}
