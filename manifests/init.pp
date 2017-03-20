# == Class: prometheus
#
# Author: Coto Cisternas <cotocisternas@gmail.com>
class prometheus (
  String $pkg_version,
  String $pkg_name,
  String $config_dir,
  String $config_mode,
  String $port,
  String $config_template,
  Boolean $manage_service,
  Boolean $manage_firewall,
  Boolean $purge,
  String $service_name,
  Boolean $service_enable,
  String $service_ensure,
  Optional[String] $service_provider,
  Hash $options,
  ) {

  contain ::prometheus::install::prometheus
  contain ::prometheus::config::prometheus
  contain ::prometheus::service::prometheus

  Class['::prometheus::install::prometheus'] ->
  Class['::prometheus::config::prometheus'] ~>
  Class['::prometheus::service::prometheus']


}
