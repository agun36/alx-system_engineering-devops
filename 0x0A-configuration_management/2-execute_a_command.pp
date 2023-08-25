# File: 2-execute_a_command.pp
# Description: Kill a process named killmenow using exec resource

exec { 'killmenow':
command => 'pkill -f killmenow',
onlyif  => 'pgrep -f killmenow',
path    => '/usr/bin:/bin',
}
