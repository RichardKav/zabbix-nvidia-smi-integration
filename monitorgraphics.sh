#!/bin/bash

# Note: using the parameter -f ./GPU-stats.csv forces the script to run in the foreground. Redirecting standard out i.e. >> ./GPU-stats.csv does not have this limitation.
nvidia-smi --query-gpu=timestamp,index,name,uuid,serial,utilization.gpu,utilization.memory,memory.total,memory.free,memory.used,power.draw,power.limit,fan.speed,temperature.gpu,compute_mode,clocks.current.graphics,clocks.current.sm,clocks.current.memory,clocks.current.video,gpu_operation_mode.current,pstate,clocks_throttle_reasons.active,clocks_throttle_reasons.gpu_idle,clocks_throttle_reasons.applications_clocks_setting,clocks_throttle_reasons.sw_power_cap,clocks_throttle_reasons.hw_slowdown,clocks_throttle_reasons.sync_boost,clocks_throttle_reasons.unknown --format=csv,nounits -l 1 >> ./$HOSTNAME-GPU-stats.csv



