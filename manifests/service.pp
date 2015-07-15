# == Class role_aio::service
#
# This class is meant to be called from role_aio.
# It ensure the service is running.
#
class role_aio::service {

  service { $::role_aio::service_name:
    ensure     => running,
    enable     => true,
    hasstatus  => true,
    hasrestart => true,
  }
}
