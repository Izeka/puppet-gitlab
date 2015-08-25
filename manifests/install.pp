class gitlab::install{
    
    package{'gitlab-ce':
        ensure => present,
	allow_virtual => false,
	require => Exec["get repository"]
    }
    package{'deltarpm','crontabs':
	ensure => present,
	allow_virtual => false,
    }
    exec{'get repository':
	command => '/bin/curl https://packages.gitlab.com/install/repositories/gitlab/gitlab-ce/script.rpm.sh |  /bin/bash',
    }
}
