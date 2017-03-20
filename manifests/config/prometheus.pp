# == Class: prometheus::config::prometheus
#
# Author: Coto Cisternas <cotocisternas@gmail.com>
class prometheus::config::prometheus inherits prometheus {

  file { $::prometheus::config_dir:
    ensure  => 'directory',
    owner   => 'prometheus',
    group   => 'prometheus',
    purge   => $prometheus::purge,
    recurse => $prometheus::purge,
    require => Package[$::prometheus::pkg_name],
    notify  => Service[$::prometheus::service_name]
  }

  file { "${::prometheus::config_dir}/prometheus.yml":
    ensure  => present,
    owner   => 'prometheus',
    group   => 'prometheus',
    mode    => $::prometheus::config_mode,
    content => template($::prometheus::config_template),
    require => File[$::prometheus::config_dir]
  }
}
