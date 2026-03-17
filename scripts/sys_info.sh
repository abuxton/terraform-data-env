#!/bin/sh
# scripts/sys_info.sh
# Ensure variables have values to avoid jq errors with null

OS_INFO=$(cat /etc/os-release 2>/dev/null | grep PRETTY_NAME | cut -d= -f2 | tr -d '"')
[ -n "$OS_INFO" ] || OS_INFO="Unknown OS"
KERNEL=$(uname -a || echo "Unknown Kernel")
USER=$(whoami || echo "Unknown User")
IP=$(ip addr 2>/dev/null | grep -v 127.0.0.1 | grep inet | head -n1 | awk '{print $2}')
[ -n "$IP" ] || IP="Unknown IP"
DISK_USAGE=$(df -h / 2>/dev/null | tail -n1 | awk '{print $5}')
[ -n "$DISK_USAGE" ] || DISK_USAGE="Unknown Disk"
TOOLS=$(git --version 2>/dev/null | awk '{print $1,$3}'; terraform --version 2>/dev/null | head -n1; jq --version 2>/dev/null)

# JSON output
jq -n \
  --arg os "$OS_INFO" \
  --arg kernel "$KERNEL" \
  --arg user "$USER" \
  --arg ip "$IP" \
  --arg disk "$DISK_USAGE" \
  --arg tools "$TOOLS" \
  '{
    "os_release": $os,
    "kernel_version": $kernel,
    "current_user": $user,
    "ip_address": $ip,
    "disk_usage_root": $disk,
    "installed_tools": $tools
  }'
