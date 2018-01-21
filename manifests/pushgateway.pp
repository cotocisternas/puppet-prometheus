# == Class: prometheus::pushgateway
#
# Author: Coto Cisternas <cotocisternas@gmail.com>
class prometheus::pushgateway (
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
  String $persistence_file,
  String $persistence_interval,
  String $local_assets,
  String $telemetry_path,
  Array $required_labels,
  ) {

  contain ::prometheus::install::pushgateway
  contain ::prometheus::config::pushgateway
  contain ::prometheus::service::pushgateway

  Class['::prometheus::install::pushgateway']
  -> Class['::prometheus::config::pushgateway']
  ~> Class['::prometheus::service::pushgateway']
}
