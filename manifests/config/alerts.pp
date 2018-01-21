# == Class: prometheus::config::alerts
#
# Author: Coto Cisternas <cotocisternas@gmail.com>
class prometheus::config::alerts inherits prometheus {

    if $::prometheus::alerts != undef {
      file {"${::prometheus::config_dir}/${::prometheus::alertfile_name}":
        ensure  => present,
        owner   => 'prometheus',
        group   => 'prometheus',
        mode    => $::prometheus::config_mode,
        content => epp('prometheus/alerts.epp')
      }
    }


}
