# born2beroot
A Linux server monitoring script

## 🗂 Table of Contents
* [About](#-about)
* [Getting Started](#-getting-started)
* [Scheduling a job with Cron](#-scheduling-a-job-with-cron)
* [42 École | 42 São Paulo](#-42-école--42-são-paulo)

## 🧐 About
This is a script to get system information as follow:
* The system architecture.
* The number of physical processors.
* The number of virtual processors.
* The current available RAM.
* The current available memory (RAM + Swap).
* The current disk usage.
* The current utilization rate of the processor.
* The date and time of the last reboot.
* Whether LVM is active or not.
* The number of active connections.
* The number of users using the server.
* The IP address of the server and its MAC address.
* The number of commands executed with the sudo program.

## 🏁 Getting Started
Clone the repo in the desired folder in your server.
```
$ git clone https://github.com/filipebafica/born2beroot.git
```

## 🗓️ Scheduling a job with Cron
Cron is a tool where users can schedule tasks to be executed at a specific time.

#### ⚙️ Installing
`$ sudo apt-get update`
`$ sudo apt-get install cron`

### 🎈 Scheduling a job
`$ sudo crontab -e`
If you are asked to choose a text editor, pick one of your preference.
Add to the end of the file the following line
`*\10 * * * * /scripts/born2beroot/monitoring.sh`
Each `*` corresponds to a time parameter: 
`[Minute] [hour] [Day_of_the_Month] [Month_of_the_Year] [Day_of_the_Week]`
The `\10` indicates that the script will be executed every 10 minutes.
Exit and save the text editor.