class soe::packages {
  package { [
    'ack',
    'git',
    'mlocate',
    'nmap',
    'rsync',
    'screen',
    'strace',
    'tcpdump',
    'whois',
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
