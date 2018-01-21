# == Class: prometheus::service::alertmanager
#
# Author: Coto Cisternas <cotocisternas@gmail.com>
class prometheus::service::alertmanager inherits prometheus::alertmanager {

  service { $::prometheus::alertmanager::service_name:
    ensure      => $::prometheus::alertmanager::service_ensure,
    enable      => $::prometheus::alertmanager::service_enable,
    name        => $::prometheus::alertmanager::service_name,
    provider    => $::prometheus::alertmanager::service_provider,
    hasstatus   => true,
    hasrestart  => true,
  }

}
