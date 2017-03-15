# == Class: prometheus::service
#
# Author: Coto Cisternas <cotocisternas@gmail.com>
class prometheus::service inherits prometheus {

  service { "${::prometheus::service_name}":
    ensure      => $::prometheus::service_ensure,
    enable      => $::prometheus::service_enable,
    name        => $::prometheus::service_name,
    provider    => $::prometheus::service_provider,
    hasstatus   => true,
    hasrestart  => true,
  }

}
