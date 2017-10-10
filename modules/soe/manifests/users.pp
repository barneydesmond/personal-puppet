# Manage users
class soe::users {
  $users = hiera('soe::users')
  soe::user { $users: }
}
