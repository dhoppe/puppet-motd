class motd {
	if $::lsbdistcodename == "lenny" {
		file { "/etc/init.d/bootmisc.sh":
			owner   => root,
			group   => root,
			mode    => 0755,
			source  => "puppet:///modules/motd/$::lsbdistcodename/etc/init.d/bootmisc.sh",
			require => Package["cowsay"],
		}
	} elsif $::lsbdistcodename == "squeeze" {
		file { "/etc/init.d/bootlogs":
			owner   => root,
			group   => root,
			mode    => 0755,
			source  => "puppet:///modules/motd/$::lsbdistcodename/etc/init.d/bootlogs",
			require => Package["cowsay"],
		}
	} else {
		file { "/etc/update-motd.d":
			recurse => true,
			owner   => root,
			group   => root,
			mode    => 0755,
			source  => "puppet:///modules/motd/$::lsbdistcodename/etc/update-motd.d",
			require => Package["cowsay"],
		}
	}

	file { "/etc/motd.tail":
		owner   => root,
		group   => root,
		mode    => 0644,
		content => template("motd/common/etc/motd.tail.erb"),
		require => Package["cowsay"],
	}

	package { "cowsay":
		ensure => present,
	}
}

# vim: tabstop=3