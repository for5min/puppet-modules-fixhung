class fixhung::params {
   $max_age   = '120'
   $pid_path  = '/var/lib/puppet/state/agent_catalog_run.lock'
   $command_path = '/usr/local/bin/fix_hung.sh'
   $cron_ensure  = 'present'
   $owner_name   = 'root'
   $group_name   = 'root'
   $mode         = '755'
   $cron_mins    = '0'
   $cron_hour    = '0'
}
