#!/bin/bash

echo "🧹 Cleaning up the system..."

echo "Stopping background load processes..."
pkill -f "yes" 2>/dev/null
pkill -f "dd if=/dev/zero" 2>/dev/null
pkill -f "ping 127.0.0.1" 2>/dev/null

echo "Removing temporary test files..."
rm -f /tmp/memload /tmp/diskload

if systemctl is-active --quiet netdata; then
    echo "Stopping Netdata service..."
    sudo systemctl stop netdata
fi

if systemctl is-enabled --quiet netdata; then
    echo "Disabling Netdata from startup..."
    sudo systemctl disable netdata
fi

if [ -x "$(command -v netdata-uninstaller.sh)" ]; then
    echo "Running Netdata uninstaller..."
    sudo /usr/libexec/netdata/netdata-uninstaller.sh --yes || \
    sudo /opt/netdata/usr/libexec/netdata/netdata-uninstaller.sh --yes
else
    echo "Netdata uninstaller not found, trying manual cleanup..."
    sudo rm -rf /etc/netdata /usr/lib/netdata /var/lib/netdata /var/cache/netdata /opt/netdata
fi

echo "Removing leftover Netdata logs..."
sudo rm -rf /var/log/netdata
sudo apt remove --purge netdata -y

echo "✅ Cleanup complete!"
