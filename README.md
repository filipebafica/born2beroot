# born2beroot
A Linux server monitoring script.

## 🗂 Table of Contents
* [About](#-about)
* [Getting Started](#-getting-started)
* [Scheduling a job with Cron](#-scheduling-a-job-with-cron)
* [Demonstration](#-demonstration)
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

This project is part of 42 École/ 42 SP curriculum.\
Topics such as system administration was addressed.

## 🏁 Getting Started
A Linux OS is needed.\
Clone the repo in the desired folder in your server.
```
$ git clone https://github.com/filipebafica/born2beroot.git
```

## 📅 Scheduling a job with Cron
Cron is a tool where users can schedule tasks to be executed at a specific time.

#### ⚙️ Installing
```
$ sudo apt-get update
$ sudo apt-get install cron
```

#### 🎈 setting a new job
Run:
```
$ sudo crontab -e
```
If you were asked to choose a text editor, pick one of your preference.\
Add to the end of the file the following line
```
*\10 * * * * /scripts/born2beroot/monitoring.sh
```
Each `*` corresponds to a time parameter, and `\10` indicates that the script will be executed every 10 minutes.\
Meaning of each field:
```
[Minute] [hour] [Day_of_the_Month] [Month_of_the_Year] [Day_of_the_Week]
```
Save and exit the text editor.

## 📺 Demonstration
The script will be displayed every 10 minutes to all logged users as bellow:
![monitoring2](https://user-images.githubusercontent.com/31427890/128940369-5a478208-a1bb-4c1c-9cc6-5e4fcfac9d1a.png)

## 🏫 42 École | 42 São Paulo
42 École is a network of tech schools spread around the world where anyone can learn how to code for free.\
At 42 there are no teachers or classrooms, each student learns from and works with each other (peer-to-peer learning).\
To see more go to https://www.42.fr/ and https://www.42sp.org.br/.
