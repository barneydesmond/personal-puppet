class soe::packages {
  $packages = hiera('soe::packages')
  package { $packages: }
}
