class motd::params {
  case $::lsbdistcodename {
    'squeeze': {
      $file   = '/etc/init.d/bootlogs'
      $source = "puppet:///modules/motd/${::lsbdistcodename}/etc/init.d/bootlogs"
    }
    default: {
      fail("Module ${module_name} does not support ${::lsbdistcodename}")
    }
  }
}
