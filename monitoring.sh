#!/bin/sh
architecture=$(uname -a)
physical_cpu=$(cat /proc/cpuinfo | grep "physical id" | sort | uniq | wc -l)
virtual_cpu=$(cat /proc/cpuinfo | grep "^processor" | wc -l)
ram_mem_used_pct=$(free | grep "Mem" | awk '{printf("%.2f%%"),$3/$2*100}')
ram_mem_used=$(free -m | grep "Mem" | awk '{print$3}')
ram_mem_total=$(free -m | grep "Mem" | awk '{printf("%dMB"),$2}')
total_mem=$(free -m | awk '{sum+=$2} END {printf("%dMB"),sum}')
total_mem_used=$(free -m | awk '{sum+=$3} END {print sum}')
total_mem_used_pct=$(free -m | awk '{sum_used+=$3} {sum_total+=$2} END {printf("%.2f%%"),sum_used/sum_total*100}')
disk_used=$(df | awk '{sum+=$3} END {printf("%d"), sum/1024}')
disk_used_total=$(df | awk '{sum+=$2} END {printf("%dMB"),sum/1024}')
disk_used_pct=$(df | awk '{sum_used+=$3} {sum_total+=$2} END {printf("%.2f%%"), sum_used/sum_total*100}')
cpu_usage=$(mpstat | awk '{sum+=$13} END {printf("%.2f%%"),100-sum}')
last_reboot=$(who -b | awk '{print $3" "$4}')
active_conections=$(netstat -napt | grep "LISTEN" | wc -l)
active_users=$(who | wc -l)
ip=$(hostname -I)
mac_address=$(/usr/sbin/ifconfig -a | grep "ether" | awk '{printf("%s"),$2}')
sudo_command=$(cat /var/log/sudo/sudo.log | grep -a "COMMAND" | wc -l)
wall -n "
	#Architecture: $architecture
	#CPU physical: $physical_cpu
	#vCPU: $virtual_cpu
	#RAM Usage: $ram_mem_used/$ram_mem_total ($ram_mem_used_pct)
	#Memory Usage: $total_mem_used/$total_mem ($total_mem_used_pct)
	#Disk Usage: $disk_used/$disk_used_total ($disk_used_pct)
	#CPU Usage: $cpu_usage
	#Last Reboot: $last_reboot
	`if /usr/sbin/lvdisplay | grep "LV Status" | grep -q "available"; then
		echo "#LVM use: Yes";
	else
		echo "#LVM use: No";
	fi`
	#Active Conections: $active_conections
	#Active Users: $active_users
	#IP: $ip #MAC Address: $mac_address
	#Sudo Commands: $sudo_command
"