# == Class: prometheus::service::pushgateway
#
# Author: Coto Cisternas <cotocisternas@gmail.com>
class prometheus::service::pushgateway inherits prometheus::pushgateway {

  service { $::prometheus::pushgateway::service_name:
    ensure      => $::prometheus::pushgateway::service_ensure,
    enable      => $::prometheus::pushgateway::service_enable,
    name        => $::prometheus::pushgateway::service_name,
    provider    => $::prometheus::pushgateway::service_provider,
    hasstatus   => true,
    hasrestart  => true,
  }

}
