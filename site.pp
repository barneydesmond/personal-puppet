node default {
	$_classes = hiera_array('classes')
	class { $_classes: }

	class { "perhost::${::hostname}": }
}
