define mv_rails_app::config::app_repo (	
	$app_path,
	$owner			= 'ubuntu',
	$group 			= 'deploy',
) 
{
	#require('mv_rails_app')
	#require('mv_rails_app::packages')

	file { "${app_path}": 
		ensure 	=> 'directory',
		owner 	=> $owner,
		group 	=> $group,			
	}
	
	file { "${app_path}/current": 
		owner 	=> $owner,
		group 	=> $group,		
		require => Exec['fix_missing_public_folder_before_deploy'],	
	}
	
	# create a temp symlink allowing to setup apache even if app is not deployed yet
	exec { 'fix_missing_public_folder_before_deploy':
		command => "/bin/ln -s /tmp ${app_path}/current",
		unless	=> "/usr/bin/test -d ${app_path}/releases"
	}
		
}