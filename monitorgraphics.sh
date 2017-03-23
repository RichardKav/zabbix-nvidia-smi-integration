#!/bin/bash

# Note: using the parameter -f ./GPU-stats.csv forces the script to run in the foreground. Redirecting standard out i.e. >> ./GPU-stats.csv does not have this limitation.
nvidia-smi --query-gpu=timestamp,utilization.gpu,utilization.memory,memory.total,memory.free,memory.used,power.draw,power.limit,fan.speed,temperature.gpu,compute_mode,clocks.current.graphics,clocks.current.sm,clocks.current.memory,clocks.current.video --format=csv,nounits --gpu=0 -l 1 >> ./GPU-stats.csv



