# Manage users
class soe::users {
  # furinkan is on every box
  class { 'soe::furinkan': }

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
