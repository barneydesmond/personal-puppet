class soe::packages {
  package { [
    'ack',
    'git',
    'mlocate',
    'rsync',
    'screen',
    'strace',
    'tcpdump',
  ]: }

  case $osfamily {
    'RedHat': {
      package { [
        'bash-completion-extras',
      ]: }
    }
    'Debian': {
      package { [
        'build-essential',
      ]: }
    }
    default:  { fail("Your osfamily ${osfamily} is not supported") }
  }
}
