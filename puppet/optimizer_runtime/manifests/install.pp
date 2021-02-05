# Install optimizer-runtime package and run it with optionaly provided knobs.yaml
# if no yaml provided, optimizer-runtime will default to optimizing OS knobs
# and will try to maximize CPU retired instructions.
# On VMs, a yaml must be provided with an alternative target metric, as CPU max retired instructions is not available
#
# supported platforms: 
#  Intel: centos and redhat 7,8, debian 10, ubuntu 20.04, 18.04, 16.04
#  Arm: centos and redhat 7, ubuntu 20.04, 18.04

class optimizer_runtime::install {
  archive { "/tmp/${optimizer_runtime::params::package_file_name}":
    ensure => present,
    source => $optimizer_runtime::params::download_url,
    user   => 0,
    group  => 0,
  }

  package { 'optimizer-runtime':
    ensure   => $optimizer_runtime::package_ensure,
    name     => $optimizer_runtime::package_file_name,
    provider => dpkg,
    source   => "/tmp/${optimizer_runtime::params::package_file_name}",
    require  => Archive["/tmp/${optimizer_runtime::params::package_file_name}"],
    notify   => Class['optimizer_runtime::Service'],
  }
}
