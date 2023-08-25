# File: create_school_file.pp
# Description: This Puppet manifest creates a file in /tmp
# with specific permissions, owner, group, and content

file {'/tmp/school':
ensure  => file,
mode    => '0744',
owner   => 'www-data',
group   => 'www-data',
content => 'I love Puppet\n',
}
