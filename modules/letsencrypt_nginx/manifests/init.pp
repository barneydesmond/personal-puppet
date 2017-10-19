# Install support for letsencrypt with nginx
class letsencrypt_nginx {
  class { 'letsencrypt_nginx::packages': }
}
