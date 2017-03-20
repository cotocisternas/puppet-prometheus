# == Class: prometheus::install::prometheus
#
# Author: Coto Cisternas <cotocisternas@gmail.com>
class prometheus::install::prometheus inherits prometheus {

  package { "${::prometheus::pkg_name}":
    ensure => $::prometheus::pkg_version,
  }

  if $::prometheus::manage_firewall {
    firewall { "${::prometheus::port} accept PROMETHEUS":
      proto  => 'tcp',
      dport  => $::prometheus::port,
      action => 'accept',
    }
  }
}
