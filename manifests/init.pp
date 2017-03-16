# == Class: prometheus
#
# Author: Coto Cisternas <cotocisternas@gmail.com>
class prometheus (
  String $pkg_version,
  String $pkg_name,
  String $config_dir,
  Boolean $manage_service,
  String $service_name,
  String $service_ensure,
  Boolean $service_enable,
  Optional[String] $service_provider,
  Optional[Hash] $options,
  ) {

  contain ::prometheus::install
  contain ::prometheus::config
  contain ::prometheus::service

  Class['::prometheus::install'] ->
  Class['::prometheus::config'] ~>
  Class['::prometheus::service']


}
