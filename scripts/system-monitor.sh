#!/bin/bash
# DevOps System Monitor

echo "=== System Monitor ==="
echo "Timestamp: $(date)"
echo "CPU Usage: $(top -bn1 | grep "Cpu(s)" | awk '{print $2}')%"
echo "Memory: $(free -h | awk '/^Mem:/ {print $3 " / " $2}')"
echo "Disk: $(df -h / | awk 'NR==2 {print $3 " / " $2}')"
echo "Uptime: $(uptime -p)"
echo "======================"
