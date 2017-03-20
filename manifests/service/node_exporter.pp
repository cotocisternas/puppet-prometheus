# == Class: prometheus::service::node_exporter
#
# Author: Coto Cisternas <cotocisternas@gmail.com>
class prometheus::service::node_exporter inherits prometheus::node_exporter {

  service { "${::prometheus::node_exporter::service_name}":
    ensure      => $::prometheus::node_exporter::service_ensure,
    enable      => $::prometheus::node_exporter::service_enable,
    name        => $::prometheus::node_exporter::service_name,
    provider    => $::prometheus::node_exporter::service_provider,
    hasstatus   => true,
    hasrestart  => true,
  }

}
