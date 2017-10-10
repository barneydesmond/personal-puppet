# Manage users
class soe {
  class { 'soe::packages': }
  class { 'soe::users': }

  # Do sshd later
}
