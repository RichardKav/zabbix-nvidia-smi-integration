# zabbix-nvidia-smi-integration
This repository has a Zabbix template for monitoring Nvidia graphics cards and information on how to configure the Zabbix agent below.

The template should be added to the server and Nvidia-SMI should be installed on the node that is to be monitored.

The following parameters need adding to the configuration file for the agent /etc/zabbix/zabbix_agentd.conf:

UserParameter=gpu.temp,nvidia-smi --query-gpu=temperature.gpu --format=csv,noheader,nounits --gpu=0
UserParameter=gpu.memtotal,nvidia-smi --query-gpu=memory.total --format=csv,noheader,nounits --gpu=0
UserParameter=gpu.used,nvidia-smi --query-gpu=memory.used --format=csv,noheader,nounits --gpu=0
UserParameter=gpu.free,nvidia-smi --query-gpu=memory.free --format=csv,noheader,nounits --gpu=0
UserParameter=gpu.fanspeed,nvidia-smi --query-gpu=fan.speed --format=csv,noheader,nounits --gpu=0
UserParameter=gpu.utilisation,nvidia-smi --query-gpu=utilization.gpu --format=csv,noheader,nounits --gpu=0
UserParameter=gpu.power,nvidia-smi --query-gpu=power.draw --format=csv,noheader,nounits --gpu=0
