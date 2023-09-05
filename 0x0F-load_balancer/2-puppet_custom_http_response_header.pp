# Update package lists
exec { 'apt-update':
  command     => '/usr/bin/apt-get update',
  path        => '/usr/bin',
  refreshonly => true,
}

# Install Nginx
package { 'nginx':
  ensure  => 'installed',
  require => Exec['apt-update'],
}

# Create a custom HTTP header configuration file
file { '/etc/nginx/conf.d/custom_headers.conf':
  ensure  => 'file',
  content => "add_header X-Served-By $hostname;\n",
  require => Package['nginx'],
  notify  => Service['nginx'],
}

# Configure Nginx to include the custom HTTP header configuration
file { '/etc/nginx/sites-available/default':
  ensure  => 'file',
  content => template('path/to/your/nginx/config/template.erb'), # Replace with your actual template path
  require => File['/etc/nginx/conf.d/custom_headers.conf'],
  notify  => Service['nginx'],
}

# Start the Nginx service
service { 'nginx':
  ensure  => 'running',
  enable  => true,
  require => Package['nginx'],
}
