# Manage users
class soe::users {
  $users = hiera('soe::users')
  soe::user { $users: }

  # root is special and is always handled
  file {
    '/root/.bashrc':
      source => 'puppet:///modules/soe/root/bashrc';
    '/root/.screenrc':
      source => 'puppet:///modules/soe/root/screenrc';
    '/root/.vimrc':
      source => 'puppet:///modules/soe/root/vimrc';
    '/root/.toprc':
      source => 'puppet:///modules/soe/root/toprc';
    '/root/.gitconfig':
      source => 'puppet:///modules/soe/root/gitconfig';
    '/root/.gitignore':
      source => 'puppet:///modules/soe/root/gitignore';
  }
}
