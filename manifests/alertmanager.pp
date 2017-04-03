# == Class: prometheus::alertmanager
#
# Author: Coto Cisternas <cotocisternas@gmail.com>
class prometheus::alertmanager (
  String $pkg_version,
  String $pkg_name,
  String $bind,
  String $port,
  Stdlib::Absolutepath $init_file,
  String $init_template,
  Boolean $manage_service,
  Boolean $manage_firewall,
  String $service_name,
  Boolean $service_enable,
  String $service_ensure,
  Optional[String] $service_provider,
  String $config_file,
  String $config_template,
  String $log_level,
  String $storage_path,
  String $external_url,
  String $local_assets,
  Hash $options,
  ) {

  contain ::prometheus::install::alertmanager
  contain ::prometheus::config::alertmanager
  contain ::prometheus::service::alertmanager

  Class['::prometheus::install::alertmanager'] ->
  Class['::prometheus::config::alertmanager'] ~>
  Class['::prometheus::service::alertmanager']
}
