# This class manages Concertio Optimizer-Runtime parameters
#
class optimizer_runtime::params {
  $config_path = '/opt/concertio-optimizer/runtime/knobs.yaml'
  $license_key = null
  $package_ensure = 'installed'

  #  "os": {
  #      "architecture": "amd64",
  #      "distro": {
  #        "codename": "focal",
  #        "description": "Ubuntu 20.04.1 LTS",
  #        "id": "Ubuntu",
  #        "release": {
  #          "full": "20.04",
  #          "major": "20.04"
  #        }
  #      },
  #      "family": "Debian",
  #      "hardware": "x86_64",
  #      "name": "Ubuntu",
  #      "release": {
  #        "full": "20.04",
  #        "major": "20.04"
  #      },
  #      "selinux": {
  #        "enabled": false
  #      }
  #  }

  #$package_file_name = null

  if $::os['family'] == 'redhat' or $::os['family'] == 'centos' {
    $package_file_name = "concertio-optimizer-runtime_centos${::os['distro']['release']['major']}_${::os['hardware']}.rpm"
  } elsif $::os['family'] == 'Debian' or $::os['family'] == 'Ubuntu' {
      $package_file_name = "concertio-optimizer-runtime_${::os['distro']['codename']}_${::os['hardware']}.deb"
  }
  $download_url = "https://www.concertio.com/packages/${package_file_name}"
}
