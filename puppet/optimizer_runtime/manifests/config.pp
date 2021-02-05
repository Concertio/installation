# Concertio Optimizer-Runtime configuration file(s)

class optimizer_runtime::config {

  # if user provided path to custom knobs.yaml
  if $optimizer_runtime::config_path != $optimizer_runtime::params::config_path {
    file { $optimizer_runtime::config_path:
      ensure  => file,
      path    => $optimizer_runtime::config_path,
      owner   => 0,
      group   => 0,
      mode    => '0400',
      require => Class['optimizer_runtime::install'],
    }
  }
  # include our built in knobs.yaml just in case...
  file { $optimizer_runtime::params::config_path:
    ensure  => file,
    path    => $optimizer_runtime::params::config_path,
    content => file('optimizer_runtime/knobs.yaml'),
    owner   => 0,
    group   => 0,
    mode    => '0400',
    require => Class['optimizer_runtime::install'],
  }
}
