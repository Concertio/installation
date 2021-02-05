node default {
  class { 'optimizer_runtime':
    # optional params: 
    # config_path => '/home/myapp/knobs.yaml',
    # license_key => 'ABCD-EFGHI-JKLMNO-PQRSTU-VWXYZ',
    # package_ensure => 'installed'  #default. can change to 'purge' or 'absent'
  }
}
