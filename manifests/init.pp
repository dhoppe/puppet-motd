class motd (
  $file   = $motd::params::file,
  $source = $motd::params::source
) inherits motd::params {

  file { $file:
    recurse => true,
    owner   => 'root',
    group   => 'root',
    mode    => '0755',
    source  => $source,
    require => Package['cowsay'],
  }

  file { '/etc/motd.tail':
    owner   => 'root',
    group   => 'root',
    mode    => '0644',
    content => template('motd/common/etc/motd.tail.erb'),
    require => Package['cowsay'],
  }

  package { 'cowsay':
    ensure => present,
  }
}