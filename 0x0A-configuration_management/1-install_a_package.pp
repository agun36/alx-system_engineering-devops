# File: 1-install_a_package.pp
# Description: Install Flask package using pip3

package { 'Flask':
ensure   => '2.1.0',
provider => 'pip3',
}
