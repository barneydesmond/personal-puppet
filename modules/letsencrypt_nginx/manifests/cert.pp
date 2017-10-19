# Install support for letsencrypt with nginx
define letsencrypt_nginx::cert(String $certdomain = $name) {
  # XXX: should sanity-check the domain here to ensure it's valid
  if $certdomain !~ /(?i:^[a-z0-9][a-z0-9._-]*[a-z0-9]$)/ {
    fail("${certdomain} doesn't look like a valid domain name")
  }

  $certpath = "/etc/ssl/private/letsencrypt-${certdomain}.pem"
  $keypath = "/etc/ssl/private/letsencrypt-${certdomain}.key"

  exec { "Get certificate for ${certdomain}":
    command   => join([
      shell_join([ "/usr/local/bin/acme-nginx", "--domain", $certdomain, "--domain-private-key", $keypath, "-o", $certpath ]),
      ' | ',
      shell_join(["/usr/bin/tee", "-a", "/var/log/letsencrypt.log"]),
    ]),
    creates   => $certpath,
    logoutput => true,
    require   => Package['acme-nginx'],
  }
}
