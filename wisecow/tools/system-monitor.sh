#!/bin/bash
LOG=system-report.log

echo "----- System Report -----" >> $LOG
echo "CPU Usage:" >> $LOG
top -bn1 | grep "Cpu(s)" >> $LOG

echo "Memory Usage:" >> $LOG
free -h >> $LOG

echo "Disk Usage:" >> $LOG
df -h >> $LOG

echo "Top Processes:" >> $LOG
ps aux --sort=-%cpu | head >> $LOG
