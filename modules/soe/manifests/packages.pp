class soe::packages {
  package { [
    'ack',
    'git',
    'mlocate',
    'rsync',
    'screen',
    'strace',
  ]: }

  case $osfamily {
    'RedHat': {
    }
    'Debian': {
      package { [
        'build-essential',
      ]: }
    }
    default:  { fail("Your osfamily ${osfamily} is not supported") }
  }
}
