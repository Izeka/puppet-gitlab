class gitlab::install(
 $gitlab_script = 'https://packages.gitlab.com/install/repositories/gitlab/gitlab-ce/script.rpm.sh',
 $repo_directory= "/etc/yum.repo.d",
 $gitlab_repo = "$repo_directory/gitlab_gitlab-ce.repo"
){
    
    package{'gitlab-ce':
        ensure => present,
	allow_virtual => false,
	require => Exec["get repository"]
    }
    package{['deltarpm','crontabs']:
	ensure => present,
	allow_virtual => false,
    }
    exec{'get repository':
	command => "/bin/curl $gitlab_script |  /bin/bash",
	creates => "$gitlab_repo"
    }
}
