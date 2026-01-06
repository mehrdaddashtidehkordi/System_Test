# اسکریپت جدید با پشتیبانی از همه OSها
cat > scripts/system-monitor.sh << 'EOF'
#!/bin/bash
# Cross-Platform System Monitor

echo "=== System Monitor ==="
echo "Timestamp: $(date)"

# Detect OS
OS="$(uname -s)"
case "${OS}" in
    Linux*)     PLATFORM="Linux" ;;
    Darwin*)    PLATFORM="Mac" ;;
    CYGWIN*|MINGW*|MSYS*) PLATFORM="Windows" ;;
    *)          PLATFORM="Unknown" ;;
esac

echo "Platform: $PLATFORM"

# CPU Usage (platform-specific)
if [[ "$PLATFORM" == "Linux" ]]; then
    CPU=$(top -bn1 | grep "Cpu(s)" | awk '{print $2}')
    echo "CPU Usage: ${CPU}%"
elif [[ "$PLATFORM" == "Mac" ]]; then
    CPU=$(top -l 1 | grep "CPU usage" | awk '{print $3}')
    echo "CPU Usage: ${CPU}"
elif [[ "$PLATFORM" == "Windows" ]]; then
    echo "CPU Usage: [Use Task Manager on Windows]"
else
    echo "CPU Usage: N/A"
fi

# Memory (platform-specific)
if [[ "$PLATFORM" == "Linux" ]]; then
    echo "Memory: $(free -h | awk '/^Mem:/ {print $3 " / " $2}')"
elif [[ "$PLATFORM" == "Mac" ]]; then
    echo "Memory: $(top -l 1 | grep "PhysMem" | awk '{print $2 " / " $8}')"
elif [[ "$PLATFORM" == "Windows" ]]; then
    echo "Memory: [Use Task Manager on Windows]"
else
    echo "Memory: N/A"
fi

# Disk (works on Windows Git Bash)
echo "Disk: $(df -h / 2>/dev/null | awk 'NR==2 {print $3 " / " $2}')"

# Uptime
if command -v uptime &> /dev/null; then
    echo "Uptime: $(uptime -p 2>/dev/null || uptime)"
else