# optimizer-runtime runs a daemon systemd service

class optimizer_runtime::service {

  service { 'optimizer-runtime':
    ensure     => 'running',
    enable     => true,
    name       => 'optimizer-runtime',
    provider   => undef,
    hasstatus  => true,
    hasrestart => true,
  }
}
