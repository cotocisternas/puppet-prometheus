# == Class: prometheus::config::node_exporter
#
# Author: Coto Cisternas <cotocisternas@gmail.com>
class prometheus::config::node_exporter inherits prometheus::node_exporter {

  $collectors_str = join($collectors, ',')
  $listen_addr    = join([$bind,$port], ':')

  file { $::prometheus::node_exporter::init_file:
    ensure  => present,
    owner   => 'root',
    group   => 'root',
    mode    => '0644',
    content => template($::prometheus::node_exporter::init_template),
    require => Package[$::prometheus::node_exporter::pkg_name]
  }
}
