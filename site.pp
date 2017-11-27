# All my nodes
node arkroyal {
	class { 'soe': }

	package { [
		'irssi',
		]: ensure => present
	}

	systemd::instance { 'furinkan': }

	file {
		'/home/furinkan/public_html':
			ensure  => 'directory',
			owner   => 'furinkan',
			group   => 'users',
			mode    => '0755',
			require => User['furinkan'];
	}

	class { 'nginx': } ->
	class { 'letsencrypt_nginx': }
	letsencrypt_nginx::cert { '765.agency': }
	letsencrypt_nginx::cert { 'arkroyal.meidokon.net': }
	letsencrypt_nginx::cert { 'j.furinkan.meidokon.net': }
}

node nadeko {
	class { 'soe': }

	# Nadeko bot
	file {
		'/opt/nadeko':      ensure => directory;
		'/opt/nadeko/conf': ensure => directory;
	}
}

node default {
	class { 'soe': }
}
