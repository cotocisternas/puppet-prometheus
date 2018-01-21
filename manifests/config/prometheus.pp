# == Class: prometheus::config::prometheus
#
# Author: Coto Cisternas <cotocisternas@gmail.com>
class prometheus::config::prometheus inherits prometheus {

  $listen_addr    = join([$::prometheus::bind,$::prometheus::port], ':')
  $conf_file      = join([$::prometheus::config_dir,$::prometheus::config_file], '/')

  contain ::prometheus::config::alerts

  file { $::prometheus::config_dir:
    ensure  => 'directory',
    owner   => 'prometheus',
    group   => 'prometheus',
    purge   => $::prometheus::purge,
    recurse => $::prometheus::purge,
    require => Package[$::prometheus::pkg_name],
    notify  => Service[$::prometheus::service_name]
  }

  file { "${prometheus::config_dir}/${prometheus::config_file}":
    ensure  => present,
    owner   => 'prometheus',
    group   => 'prometheus',
    mode    => $::prometheus::config_mode,
    content => template($::prometheus::config_template),
    require => File[$::prometheus::config_dir]
  }

  file { $::prometheus::init_file:
    ensure  => present,
    owner   => 'root',
    group   => 'root',
    mode    => '0644',
    content => template($::prometheus::init_template),
    require => Package[$::prometheus::pkg_name]
  }
}
