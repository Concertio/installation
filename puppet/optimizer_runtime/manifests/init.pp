# Concertio optimizer-Runtime Installation Module
#
# @param license_key
#   Concertio optimizer-runtime License Key - required for optimizer-runtime to start for non-community features
#
# @param config
#   path to customized knobs.yaml file for optimizer knobs and metrics to set and collect

class optimizer_runtime (
  Optional[Stdlib::Absolutepath] $config_path = $optimizer_runtime::params::config_path,
  String $license_key = $optimizer_runtime::params::license_key,
  $package_ensure = $optimizer_runtime::params::package_ensure,
) inherits ::optimizer_runtime::params {

  contain optimizer_runtime::install
  contain optimizer_runtime::config
  contain optimizer_runtime::service

  Class['optimizer_runtime::install']
  -> Class['optimizer_runtime::config']
  ~> Class['optimizer_runtime::service']
}
