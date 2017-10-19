# System and Python pip packages
class letsencrypt_nginx::packages {
	package { [
		'python-openssl',
		'python-crypto',
		'python-setuptools',
		'python-pip',
		]:
	} ->
	package { 'acme-nginx':
		provider => 'pip',
	}
}
