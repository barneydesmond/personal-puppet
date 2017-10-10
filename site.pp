node arkroyal {
	class { 'soe': }
	class { "perhost::${::hostname}": }
}

node default {
	class { 'soe': }
}
