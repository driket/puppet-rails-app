define mv_rails_app::config::database (	
	$shared_path,
  $adapter 			= 'mysql2',
  $database,
  $username			= 'root',
  $password,
  $host					= 'localhost',
  $socket 			= '/var/run/mysqld/mysqld.sock',
	$owner				= 'ubuntu',
	$group 				= 'deploy',
) 
{
	#require('mv_rails_app')
	#require('mv_rails_app::packages')

  file { "${shared_path}": 
		ensure 	=> directory,
    mode 		=> "0664",
    owner 	=> $owner,
    group 	=> $group,
	}

  file { "${shared_path}/db": 
		ensure 	=> directory,
    mode 		=> "0664",
    owner 	=> $owner,
    group 	=> $group,
	}
	
  file { "${shared_path}/db/database.yml": 
		ensure	=> file,
    mode 		=> "0664",
    owner 	=> $owner,
    group 	=> $group,
		content => template("mv_rails_app/database.yml.erb")
	}
		
}