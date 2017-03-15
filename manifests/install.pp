# == Class: prometheus::install
#
# Author: Coto Cisternas <cotocisternas@gmail.com>
class prometheus::install inherits prometheus {

  package { "${::prometheus::pkg_name}":
    ensure => $::prometheus::pkg_version,
  }
}
