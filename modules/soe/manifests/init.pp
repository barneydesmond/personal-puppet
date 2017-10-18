# Manage users
class soe {
  class { 'soe::packages': }
  class { 'soe::users': }

  file {
    '/etc/ssl/Makefile':
      source => 'puppet:///modules/soe/etc/ssl/Makefile';
  }

  # Do sshd later
}
