define mv_rails_app::config::settings (	
	$shared_path,
	$settings 		= {},
) 
{
	#require('mv_rails_app')
	#require('mv_rails_app::packages')

  file { "${shared_path}/config": 
		ensure 	=> directory,
    mode 		=> "0664",
    owner 	=> 'ubuntu',
    group 	=> 'deploy',
	}
	
  file { "${shared_path}/config/application.yml": 
		ensure	=> file,
    mode 		=> "0640",
    owner 	=> 'ubuntu',
    group 	=> 'deploy',
		content => template("mv_rails_app/application.yml.erb")
	}
	
		
}