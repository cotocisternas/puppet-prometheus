# == Class: prometheus::install::alertmanager
#
# Author: Coto Cisternas <cotocisternas@gmail.com>
class prometheus::install::alertmanager inherits prometheus::alertmanager {

  package { $::prometheus::alertmanager::pkg_name:
    ensure => $::prometheus::alertmanager::pkg_version,
  }

  if $::prometheus::alertmanager::manage_firewall {
    firewall { "${::prometheus::alertmanager::port} accept ALERTMANAGER":
      proto  => 'tcp',
      dport  => $::prometheus::alertmanager::port,
      action => 'accept',
    }
  }
}
