#!/bin/bash

max_age=120
State_dir="/var/lib/puppet/state"

age() {
  age_in_seconds=$(echo "$(date +%s) -$(stat -c %X /proc/$PID)" | bc)
  if [[ "$age_in_seconds" -ge "$max_age" ]];then
    kill -9 $PID
  fi
}
if [[ -f "$State_dir/agent_catalog_run.lock" ]];then
      PID=`cat $State_dir/agent_catalog_run.lock`
      age
fi
