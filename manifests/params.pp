class motd::params {
  case $::lsbdistcodename {
    'squeeze': {
      $file   = '/etc/init.d/bootlogs'
      $source = "puppet:///modules/motd/${::lsbdistcodename}/etc/init.d/bootlogs"
    }
    'natty': {
      $file   = '/etc/update-motd.d'
      $source = "puppet:///modules/motd/${::lsbdistcodename}/etc/update-motd.d"
    }
    default: {
      fail("Module ${module_name} does not support ${::lsbdistcodename}")
    }
  }
}
