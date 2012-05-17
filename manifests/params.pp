class motd::params {
  case $::lsbdistcodename {
    'lenny': {
      $file   = '/etc/init.d/bootmisc.sh'
      $source = "puppet:///modules/motd/${::lsbdistcodename}/etc/init.d/bootmisc.sh"
    }
    'squeeze': {
      $file   = '/etc/init.d/bootlogs'
      $source = "puppet:///modules/motd/${::lsbdistcodename}/etc/init.d/bootlogs"
    }
    'maverick', 'natty': {
      $file   = '/etc/update-motd.d'
      $source = "puppet:///modules/motd/${::lsbdistcodename}/etc/update-motd.d"
    }
    default: {
      fail("Module ${module_name} does not support ${::lsbdistcodename}")
    }
  }
}