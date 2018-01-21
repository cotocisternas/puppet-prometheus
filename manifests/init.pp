# == Class: prometheus
#
# Author: Coto Cisternas <cotocisternas@gmail.com>
class prometheus (
  String $pkg_version,
  String $pkg_name,
  String $bind,
  String $port,
  Stdlib::Absolutepath $config_dir,
  String $config_file,
  String $config_template,
  String $alertfile_name,
  Stdlib::Absolutepath $init_file,
  String $init_template,
  String $config_mode,
  Boolean $manage_service,
  Boolean $manage_firewall,
  Boolean $purge,
  String $service_name,
  Boolean $service_enable,
  String $service_ensure,
  Hash $options,
  Hash $defaults,
  Optional[Array] $alerts,
  ) {

  contain ::prometheus::install::prometheus
  contain ::prometheus::config::prometheus
  contain ::prometheus::service::prometheus

  Class['::prometheus::install::prometheus']
  -> Class['::prometheus::config::prometheus']
  ~> Class['::prometheus::service::prometheus']

}
