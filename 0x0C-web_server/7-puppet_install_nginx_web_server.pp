# 7-puppet_install_nginx_web_server.pp

# Install Nginx web server
package { 'nginx':
  ensure => installed,
}

# Configure the Nginx server block
file { '/etc/nginx/sites-available/default':
  ensure  => 'file',
  content => template('nginx_default.conf.erb'),
  require => Package['nginx'],
  notify  => Service['nginx'],
}

# Create the custom index.html file
file { '/var/www/html/index.html':
  ensure  => 'present',
  content => 'Hello World!',
  require => Package['nginx'],
}

# Ensure Nginx service is running
service { 'nginx':
  ensure  => running,
  require => Package['nginx'],
}
