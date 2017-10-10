# arkroyal is a shell host, mostly running irssi in a screen session
class soe::furinkan {
  soe::user { 'furinkan': }

  File {
    require => User['furinkan'],
    owner   => 'furinkan',
    group   => 'users',
    mode    => '0644',
  }
  file {
    '/home/furinkan/.bashrc':
      source => 'puppet:///modules/soe/home/furinkan/bashrc';
    '/home/furinkan/.screenrc':
      source => 'puppet:///modules/soe/home/furinkan/screenrc';
    '/home/furinkan/.vimrc':
      source => 'puppet:///modules/soe/home/furinkan/vimrc';
    '/home/furinkan/.toprc':
      source => 'puppet:///modules/soe/home/furinkan/toprc';
    '/home/furinkan/.gitconfig':
      source => 'puppet:///modules/soe/home/furinkan/gitconfig';
    '/home/furinkan/.gitignore':
      source => 'puppet:///modules/soe/home/furinkan/gitignore';
  }
}
