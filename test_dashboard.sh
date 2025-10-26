#!/bin/bash

echo "Starting system load test..."

echo "Generating CPU load..."
for i in {1..4}; do
  yes > /dev/null &
done

echo "Generating memory load..."
dd if=/dev/zero of=/tmp/memload bs=1M count=500 &

echo "Generating disk load..."
dd if=/dev/zero of=/tmp/diskload bs=1M count=1000 oflag=direct &


echo "Generating network load..."
ping -i 0.2 127.0.0.1 > /dev/null &

echo "Load test started. Check Netdata dashboard at http://localhost:19999"
echo "Press Ctrl+C to stop."

wait
