node arkroyal {
	class { 'soe': }

	package { [
		'irssi',
		]: ensure => present
	}

	systemd::instance { 'furinkan': }

	class { 'nginx': }

	# Nadeko bot
	file { '/opt/nadeko':
		ensure => directory,
	}
}

node default {
	class { 'soe': }
}
