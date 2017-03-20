# == Class: prometheus::node_exporter
#
# Author: Coto Cisternas <cotocisternas@gmail.com>
class prometheus::node_exporter (
  String $pkg_version,
  String $pkg_name,
  String $bind,
  String $port,
  Stdlib::Absolutepath $config_file,
  String $config_template,
  Boolean $manage_service,
  Boolean $manage_firewall,
  String $service_name,
  Boolean $service_enable,
  String $service_ensure,
  Optional[String] $service_provider,
  Array $collectors,
  String $diskstats_ignored_devices,
  String $filesystem_ignored_mounts,
  String $megacli_path,
  String $netdev_ignored_dev,
  Integer $ntp_protocol,
  String $ntp_server,
  String $procfs,
  String $sysfs,
  Stdlib::Httpurl $supervisord_url,
  Stdlib::Absolutepath $textfile_dir,
  String $log_format,
  String $log_level,
  String $telemetry_path,
  ) {

  contain ::prometheus::install::node_exporter
  contain ::prometheus::config::node_exporter
  contain ::prometheus::service::node_exporter

  Class['::prometheus::install::node_exporter'] ->
  Class['::prometheus::config::node_exporter'] ~>
  Class['::prometheus::service::node_exporter']
}
