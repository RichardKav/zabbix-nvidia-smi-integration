# Zabbix Nvidia-SMI integration

This repository is a Zabbix template for monitoring Nvidia graphics cards, in particular:

* GPU Utilisation
* GPU Power Consumption
* GPU Memory (Used, Free, Total)
* GPU Temperature
* GPU Fan Speed

The information on how to configure the Zabbix agent is below. The template should be added to the server and Nvidia-SMI should be installed on the node that is to be monitored.

The following parameters need to be added in the configuration file of the agent, in `/etc/zabbix/zabbix_agentd.conf`:

```
UserParameter=gpu.temp,nvidia-smi --query-gpu=temperature.gpu --format=csv,noheader,nounits -i 0
UserParameter=gpu.memtotal,nvidia-smi --query-gpu=memory.total --format=csv,noheader,nounits -i 0
UserParameter=gpu.used,nvidia-smi --query-gpu=memory.used --format=csv,noheader,nounits -i 0
UserParameter=gpu.free,nvidia-smi --query-gpu=memory.free --format=csv,noheader,nounits -i 0
UserParameter=gpu.fanspeed,nvidia-smi --query-gpu=fan.speed --format=csv,noheader,nounits -i 0
UserParameter=gpu.utilisation,nvidia-smi --query-gpu=utilization.gpu --format=csv,noheader,nounits -i 0
UserParameter=gpu.power,nvidia-smi --query-gpu=power.draw --format=csv,noheader,nounits -i 0
```

## Credits

This Zabbix template was developed from https://gist.github.com/bhcopeland/b54d3c678a0cb6e87119 and further refined to avoid the need to directly parse output from nvidia smi with grep and cut.

Alongside the template monitorgraphics.sh is an alternative monitoring script that outputs nvidia-smi information to disk. This is not needed for the Zabbix template but it remains useful for monitoring NVidia GPUs.

It is possible to use this Zabbix template within a Docker container. Please see the following [repository](https://github.com/wangmuy/zabbix-agent-nvidia) for how this can be accomplished.

## License

Copyright (C) 2014-2021 [Benjamin Copeland](https://gist.github.com/bhcopeland), [Richard Kavanagh](https://github.com/RichardKav) and contributors

This program is free software: you can redistribute it and/or modify it under the terms of the GNU General Public License as published by the Free Software Foundation, either version 2 of the License, or (at your option) any later version.

This program is distributed in the hope that it will be useful, but WITHOUT ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.
See the GNU General Public License for more details.

You should have received a copy of the GNU General Public License along with this program.
If not, see <https://www.gnu.org/licenses/>.

### Zabbix license

This is a template for Zabbix. Zabbix itself is released under the GNU General Public License (GPL) version 2. The formal terms of the GPL can be found at http://www.fsf.org/licenses/.

You can redistribute it and/or modify it under the terms of the GNU GPL as published by the Free Software Foundation; either version 2 of the License, or (at your option) any later version.
