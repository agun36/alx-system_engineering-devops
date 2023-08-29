# install_nginx.pp

package {'nginx':
  ensure => 'present',
}

exec {'install':
  command  => 'sudo apt-get update && sudo apt-get -y install nginx', # Use && instead of ;
  path     => '/usr/bin', # Specify the path for the command
  provider => shell,
  require  => Package['nginx'], # Make sure the package is installed first
}

file {'/var/www/html/index.html':
  ensure  => 'present',
  content => 'Hello World!',
  require => Exec['install'], # Make sure the file is created after installation
}

file_line {'redirect_rule':
  ensure  => 'present',
  path    => '/etc/nginx/sites-available/default',
  line    => 'location /redirect_me { return 301 https://www.youtube.com/watch?v=QH2-TGUlwu4; }',
  require => Exec['install'], # Make sure the file is modified after installation
  notify  => Service['nginx'], # Notify Nginx to reload after modifying the file
}

service {'nginx':
  ensure  => running,
  require => Exec['install'], # Make sure the service is started after installation
}
