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
  include ::profile_base
  # include rspec monitor to make rspec acceptance test available to monitor system
  include ::profile_base::rspec_monitor
}
