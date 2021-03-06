## site.pp ##

# This file (/etc/puppetlabs/puppet/manifests/site.pp) is the main entry point
# used when an agent connects to a master and asks for an updated configuration.
#
# Global objects like filebuckets and resource defaults should go in this file,
# as should the default node definition. (The default node can be omitted
# if you use the console and don't define any other nodes in site.pp. See
# http://docs.puppetlabs.com/guides/language_guide.html#nodes for more on
# node definitions.)

## Active Configurations ##

# PRIMARY FILEBUCKET
# This configures puppet agent and puppet inspect to back up file contents when
# they run. The Puppet Enterprise console needs this to display file contents
# and differences.

# Disable filebucket by default for all File resources:
File { backup => false }

# Randomize enforcement order to help understand relationships
ini_setting { 'random ordering':
  ensure  => present,
  path    => "${settings::confdir}/puppet.conf",
  section => 'agent',
  setting => 'ordering',
  value   => 'title-hash',
}

# DEFAULT NODE
# Node definitions in this file are merged with node data from the console. See
# http://docs.puppetlabs.com/guides/language_guide.html#nodes for more on
# node definitions.

# The default node definition matches any node lacking a more specific node
# definition. If there are no other nodes in this file, classes declared here
# will be included in every node's catalog, *in addition* to any classes
# specified in the console for that node.

package {'ntp':
  ensure => present,
}
file { '/etc/motd':
  ensure => file,
  mode => '0664',
  owner => 'root',
  content => "test file\n",
}
exec {'command cowsay':
  path => '/usr/local/bin',
  command => "cowsay 'Welcome to ${::fqdn}!' > /etc/hello",
  creates => "/etc/hello",
  }
  
host {'prajwaln22.puppetlabs.vm':
  name => 'prajwaln22.puppetlabs.vm',
  ip  => '172.17.0.7',
  host_aliases => 'prajwaln22',
  }
  
node default {
  # This is where you can declare classes for all nodes.
  # Example:
  #   class { 'my_class': }
  notify { "Hello, my name is ${::hostname} and I work in Intel": }
  if $::virtual != 'pysical'{
    $vname= capitalize($::virtual)
    notify {" this is $vname VM":}
  }
  include nginx
  include aliases
  
  $mymessage = hiera('mymessage')
  $host_name = hiera('host_name')
  $dummy_value = hiera('dummy_value')
  notify { "$mymessage  and hostname is $host_name and dummy value is $dummy_value":}
}
