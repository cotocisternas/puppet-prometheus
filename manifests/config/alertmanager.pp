# == Class: prometheus::config::alertmanager
#
# Author: Coto Cisternas <cotocisternas@gmail.com>
class prometheus::config::alertmanager inherits prometheus::alertmanager {

  $listen_addr    = join([$bind,$port], ':')

  file { $::prometheus::alertmanager::init_file:
    ensure  => present,
    owner   => 'root',
    group   => 'root',
    mode    => '0644',
    content => template($::prometheus::alertmanager::init_template),
    require => Package[$::prometheus::alertmanager::pkg_name]
  }

  file { $::prometheus::alertmanager::config_file:
    ensure  => present,
    owner   => 'root',
    group   => 'root',
    mode    => '0644',
    content => template($::prometheus::alertmanager::config_template),
    require => Package[$::prometheus::alertmanager::pkg_name]
  }
}
