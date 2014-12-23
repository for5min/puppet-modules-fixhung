# == Class: module-fixhung
class fixhung  (
  $max_age      = $fixhung::params::max_age,
  $pid_path     = $fixhung::params::pid_path,
  $command_path = $fixhung::params::command_path,
) inherits fixhung::params {

  file { 'fix_hung.sh' :
    ensure  => file,
    path    => $command_path,
    content => template('fixhung/fix_hung.erb'),
    owner   => $owner_name,
    group   => $group_name,
    mode    => $mode,
  }

  cron { 'fix_hung' :
    ensure  => $cron_ensure,
    command => "${command_path} > /dev/null",
    user    => $owner_name,
    hour    => $cron_hour,
    minute  => $cron_mins,
  }
}
