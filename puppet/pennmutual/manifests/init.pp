class pennmutual(
  String $pennmutual_package,
  String $pennmutual_service,
) {

  package { $pennmutual_package:
    ensure => installed,
  }

  file { '/etc/pennmutual':
    ensure  => file,
    owner   => 'root',
    group   => 'root',
    mode    => '0640',
    content => epp('pennmutual_config.epp'),
    notify  => Service[$pennmutual_service],
    require => Package[$pennmutual_package],
  }

  service { $pennmutual_service:
    ensure  => running,
    enable  => true,
    require => File['/etc/pennmutual'],
  }
}
