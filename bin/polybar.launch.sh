#!/usr/bin/env sh
#Terminate polybar if running
pkill polybar
# wait until polybar is shutdown
while pgrep -x polybar >/dev/null;do sleep 1; done
# Launch polubar
polybar &
