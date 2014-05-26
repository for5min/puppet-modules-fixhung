# == Class: module-fixhung
class fixhung (
  $max_age = 'USE_DEFAULTS',
  $pid_path = 'USE_DEFAULTS',
  $command_path = '/usr/local/bin/fix_hung.sh',
  $status = 'present',
  $owner  = 'root',
  $group  = 'root',
  $mode   = '755',
  $cron_mins = '0',
  $cron_hour = '0',
){
  
  if $max_age == 'USE_DEFAULTS' {
     $max_age_real = '120'
  } else {
     $max_age_real = $max_age
  }

  if $pid_path == 'USE_DEFAULTS' {
     $pid_path_real = '/var/lib/puppet/state/agent_catalog_run.lock'
  } else {
     $pid_path_real = $pid_path
  }

  file { 'fix_hung.sh' :
    ensure => file,
    path   => $command_path,
    content => template('fixhung/fix_hung.erb'),
    owner  => $owner,
    group  => $group,
    mode   => $mode,
  }
 
  cron { 'fix_hung' :
    ensure  => $status,
    command => "${command_path} > /dev/null",
    user    => $owner,
    hour    => $cron_hour,
    minute  => $cron_mins,
  }
}
