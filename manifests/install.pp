# == Class role_aio::install
#
# This class is called from role_aio for install.
#
class role_aio::install {

  package { $::role_aio::package_name:
    ensure => present,
  }
}
