node arkroyal {
	class { 'soe': }

	package { [
		'irssi',
		]: ensure => present
	}

	systemd::instance { 'furinkan': }

	class { 'nginx': }
}

node default {
	class { 'soe': }
}
