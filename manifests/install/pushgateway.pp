# == Class: prometheus::install::pushgateway
#
# Author: Coto Cisternas <cotocisternas@gmail.com>
class prometheus::install::pushgateway inherits prometheus::pushgateway {

  package { "${::prometheus::pushgateway::pkg_name}":
    ensure => $::prometheus::pushgateway::pkg_version,
  }

  if $::prometheus::pushgateway::manage_firewall {
    firewall { "${::prometheus::pushgateway::port} accept PUSHGATEWAY":
      proto  => 'tcp',
      dport  => $::prometheus::pushgateway::port,
      action => 'accept',
    }
  }
}
