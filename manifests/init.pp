# == Class: consul
#
# Installs, configures and manages consul
#
# === Parameters
#
# [*acls*]
#   Hash of consul_acl resources to create.
#
# [*arch*]
#   Architecture of consul binary to download.
#
# [*archive_path*]
#   Path used when installing consul via the url.
#
# [*bin_dir*]
#   Directory to create the symlink to the consul binary in.
#
# [*checks*]
#   Hash of consul::check resources to create.
#
# [*config_defaults*]
#   Configuration defaults hash. Gets merged with config_hash.
#
# [*config_dir*]
#   Directory to place consul configuration files in.
#
# [*config_hash*]
#   Use this to populate the JSON config file for consul.
#
# [*config_mode*]
#   Use this to set the JSON config file mode for consul.
#
# [*docker_image*]
#   Only valid when the install_method == docker. Defaults to `consul`.
#
# [*download_extension*]
#   The extension of the archive file containing the consul binary to download.
#
# [*download_url*]
#   Fully qualified url to the location of the archive file containing the consul binary.
#
# [*download_url_base*]
#   Base url to the location of the archive file containing the consul binary.
#
# [*extra_groups*]
#   Extra groups to add the consul system user to.
#
# [*extra_options*]
#   Extra arguments to be passed to the consul agent
#
# [*group*]
#   Name of the group that should own the consul configuration files.
#
# [*init_style*]
#   What style of init system your system uses. Set to 'unmanaged' to disable
#   managing init system files for the consul service entirely.
#   This is ignored when install_method == 'docker'
#
# [*install_method*]
#   Valid strings: `docker`  - install via docker container
#                  `package` - install via system package
#                  `url`     - download and extract from a url. Defaults to `url`.
#                  `none`    - disable install.
#
# [*join_wan*]
#   Whether to join the wan on service start.
#
# [*manage_group*]
#   Whether to create/manage the group that should own the consul configuration files.
#
# [*manage_service*]
#   Whether to manage the consul service.
#
# [*manage_user*]
#   Whether to create/manage the user that should own consul's configuration files.
#
# [*os*]
#   OS component in the name of the archive file containing the consul binary.
#
# [*package_ensure*]
#   Only valid when the install_method == package. Defaults to `latest`.
#
# [*package_name*]
#   Only valid when the install_method == package. Defaults to `consul`.
#
# [*pretty_config*]
#   Generates a human readable JSON config file. Defaults to `false`.
#
# [*pretty_config_indent*]
#   Toggle indentation for human readable JSON file. Defaults to `4`.
#
# [*proxy_server*]
#   Specify a proxy server, with port number if needed. ie: https://example.com:8080.
#
# [*purge_config_dir*]
#   Purge config files no longer generated by Puppet
#
# [*restart_on_change*]
#   Determines whether to restart consul agent on $config_hash changes.
#   This will not affect reloads when service, check or watch configs change.
#   Defaults to `true`.
#
# [*service_enable*]
#   Whether to enable the consul service to start at boot.
#
# [*service_ensure*]
#   Whether the consul service should be running or not.
#
# [*services*]
#   Hash of consul::service resources to create.
#
# [*ui_download_extension*]
#   The extension of the archive file containing the consul ui to download.
#
# [*ui_download_url*]
#   Fully qualified url to the location of the archive file containing the consul ui.
#
# [*ui_download_url_base*]
#   Base url to the location of the archive file containing the consul ui.
#
# [*ui_package_ensure*]
#   Only valid when the install_method == package. Defaults to `latest`.
#
# [*ui_package_name*]
#   Only valid when the install_method == package. Defaults to `consul_ui`.
#
# [*user*]
#   Name of the user that should own the consul configuration files.
#
# [*version*]
#   Specify version of consul binary to download.
#
# [*watches*]
#   Hash of consul::watch resources to create.
#
# === Examples
#
#  @example
#    class { '::consul':
#      config_hash => {
#        'datacenter'   => 'east-aws',
#        'node_name'    => $::fqdn,
#        'pretty_config => true,
#        'retry-join'   => ['172.16.0.1'],
#      },
#    }
#
class consul (
  $acls                  = $::consul::params::acls,
  $arch                  = $::consul::params::arch,
  $archive_path          = $::consul::params::archive_path,
  $bin_dir               = $::consul::params::bin_dir,
  $checks                = $::consul::params::checks,
  $config_defaults       = $::consul::params::config_defaults,
  $config_dir            = $::consul::params::config_dir,
  $config_hash           = $::consul::params::config_hash,
  $config_mode           = $::consul::params::config_mode,
  $docker_image          = $::consul::params::docker_image,
  $download_extension    = $::consul::params::download_extension,
  $download_url          = $::consul::params::download_url,
  $download_url_base     = $::consul::params::download_url_base,
  $extra_groups          = $::consul::params::extra_groups,
  $extra_options         = $::consul::params::extra_options,
  $group                 = $::consul::params::group,
  $log_file              = $::consul::params::log_file,
  $init_style            = $::consul::params::init_style,
  $install_method        = $::consul::params::install_method,
  $join_wan              = $::consul::params::join_wan,
  $manage_group          = $::consul::params::manage_group,
  $manage_service        = $::consul::params::manage_service,
  $manage_user           = $::consul::params::manage_user,
  $os                    = $::consul::params::os,
  $package_ensure        = $::consul::params::package_ensure,
  $package_name          = $::consul::params::package_name,
  $pretty_config         = $::consul::params::pretty_config,
  $pretty_config_indent  = $::consul::params::pretty_config_indent,
  $proxy_server          = $::consul::params::proxy_server,
  $purge_config_dir      = $::consul::params::purge_config_dir,
  $restart_on_change     = $::consul::params::restart_on_change,
  $service_enable        = $::consul::params::service_enable,
  $service_ensure        = $::consul::params::service_ensure,
  $services              = $::consul::params::services,
  $ui_download_extension = $::consul::params::ui_download_extension,
  $ui_download_url       = $::consul::params::ui_download_url,
  $ui_download_url_base  = $::consul::params::ui_download_url_base,
  $ui_package_ensure     = $::consul::params::ui_package_ensure,
  $ui_package_name       = $::consul::params::ui_package_name,
  $user                  = $::consul::params::user,
  $version               = $::consul::params::version,
  $watches               = $::consul::params::watches,
) inherits consul::params {

  # lint:ignore:140chars
  $real_download_url    = pick($download_url, "${download_url_base}${version}/${package_name}_${version}_${os}_${arch}.${download_extension}")
  $real_ui_download_url = pick($ui_download_url, "${ui_download_url_base}${version}/${package_name}_${version}_web_ui.${ui_download_extension}")
  # lint:endignore

  validate_bool($purge_config_dir)
  validate_bool($manage_user)
  validate_array($extra_groups)
  validate_bool($manage_service)
  validate_bool($restart_on_change)
  validate_hash($config_hash)
  validate_hash($config_defaults)
  validate_bool($pretty_config)
  validate_integer($pretty_config_indent)
  validate_hash($services)
  validate_hash($watches)
  validate_hash($checks)
  validate_hash($acls)

  $config_hash_real = deep_merge($config_defaults, $config_hash)

  if $config_hash_real['data_dir'] {
    $data_dir = $config_hash_real['data_dir']
  } else {
    $data_dir = undef
  }

  if $config_hash_real['ui_dir'] {
    $ui_dir = $config_hash_real['ui_dir']
  } else {
    $ui_dir = undef
  }

  if ($ui_dir and ! $data_dir) {
    warning('data_dir must be set to install consul web ui')
  }

  if ($config_hash_real['ports'] and $config_hash_real['ports']['http']) {
    $http_port = $config_hash_real['ports']['http']
  } else {
    $http_port = 8500
  }

  if ($config_hash_real['addresses'] and $config_hash_real['addresses']['http']) {
    $http_addr = $config_hash_real['addresses']['http']
  } elsif ($config_hash_real['client_addr']) {
    $http_addr = $config_hash_real['client_addr']
  } else {
    $http_addr = $::ipaddress_lo
  }

  if $services {
    create_resources(consul::service, $services)
  }

  if $watches {
    create_resources(consul::watch, $watches)
  }

  if $checks {
    create_resources(consul::check, $checks)
  }

  if $acls {
    create_resources(consul_acl, $acls)
  }

  $notify_service = $restart_on_change ? {
    true    => Class['consul::run_service'],
    default => undef,
  }

  anchor {'consul_first': }
  -> class { 'consul::install': }
  -> class { 'consul::config':
    config_hash             => $config_hash_real,
    purge                   => $purge_config_dir,
    notify                  => $notify_service,
  }
  -> class { 'consul::run_service': }
  -> class { 'consul::reload_service': }
  -> anchor {'consul_last': }
}
