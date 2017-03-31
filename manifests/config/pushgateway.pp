# == Class: prometheus::config::pushgateway
#
# Author: Coto Cisternas <cotocisternas@gmail.com>
class prometheus::config::pushgateway inherits prometheus::pushgateway {

  $listen_addr    = join([$bind,$port], ':')

  file { $::prometheus::pushgateway::config_file:
    ensure  => present,
    owner   => 'root',
    group   => 'root',
    mode    => '0644',
    content => template($::prometheus::pushgateway::config_template),
    require => Package[$::prometheus::pushgateway::pkg_name]
  }
}
