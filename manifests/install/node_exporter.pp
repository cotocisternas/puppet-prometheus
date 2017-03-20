# == Class: prometheus::install::node_exporter
#
# Author: Coto Cisternas <cotocisternas@gmail.com>
class prometheus::install::node_exporter inherits prometheus::node_exporter {

  package { "${::prometheus::node_exporter::pkg_name}":
    ensure => $::prometheus::node_exporter::pkg_version,
  }

  if $::prometheus::node_exporter::manage_firewall {
    firewall { "${::prometheus::node_exporter::port} accept NODE-EXPORTER":
      proto  => 'tcp',
      dport  => $::prometheus::node_exporter::port,
      action => 'accept',
    }
  }
}
