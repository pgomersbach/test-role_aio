# == Class: role_aio
#
# Full description of class role_aio here.
#
# === Parameters
#
# [*sample_parameter*]
#   Explanation of what this parameter affects and what it defaults to.
#
class role_aio
{
  # a role includes one or more profiles and at least a 'base' profile
  contain ::profile_base
  # include rspec monitor to make rspec acceptance test available to monitor system
  contain ::profile_base::rspec_monitor
  contain ::profile_jenkins
  contain ::profile_jenkins::rspec_monitor
  contain ::profile_puppetmaster
  contain ::profile_puppetmaster::rspec_monitor

  Class['::profile_base'] -> Class['::profile_jenkins'] -> Class['::profile_puppetmaster']
}
