# arkroyal is a shell host, mostly running irssi in a screen session
class perhost::arkroyal {
  package { [
    'irssi',
    ]: ensure => present
  }

  File {
    require => User['furinkan'],
    owner   => 'furinkan',
    group   => 'users',
    mode    => '0644',
  }
  file {
    '/home/furinkan/.bashrc':
      source => 'puppet:///modules/perhost/home/furinkan/bashrc';
    '/home/furinkan/.screenrc':
      source => 'puppet:///modules/perhost/home/furinkan/screenrc';
    '/home/furinkan/.vimrc':
      source => 'puppet:///modules/perhost/home/furinkan/vimrc';
    '/home/furinkan/.toprc':
      source => 'puppet:///modules/perhost/home/furinkan/toprc';
    '/home/furinkan/.gitconfig':
      source => 'puppet:///modules/perhost/home/furinkan/gitconfig';
    '/home/furinkan/.gitignore':
      source => 'puppet:///modules/perhost/home/furinkan/gitignore';
  }

  systemd::instance { 'furinkan': }

  class { 'nginx': }
}
