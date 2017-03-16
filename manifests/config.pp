# == Class: prometheus::config
#
# Author: Coto Cisternas <cotocisternas@gmail.com>
class prometheus::config inherits prometheus {

  file { 'prometheus.yml':
    ensure  => present,
    path    => '/etc/prometheus/prometheus.yml',
    owner   => 'root',
    group   => 'root',
    mode    => '0644',
    content => template('prometheus/prometheus.yaml.erb')
  }

}
