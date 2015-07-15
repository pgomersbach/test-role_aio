# == Class role_aio::params
#
# This class is meant to be called from role_aio.
# It sets variables according to platform.
#
class role_aio::params {
  case $::osfamily {
    'Debian': {
      $package_name = 'role_aio'
      $service_name = 'role_aio'
    }
    'RedHat', 'Amazon': {
      $package_name = 'role_aio'
      $service_name = 'role_aio'
    }
    default: {
      fail("${::operatingsystem} not supported")
    }
  }
}
