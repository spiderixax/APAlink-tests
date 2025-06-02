#!/bin/sh

IFACE="wlan0"
LAST_RATE=0
SET_BITRATE=1000

get_signal_dBm() {
    iw dev "$IFACE" station dump 2>/dev/null | grep 'signal:' | awk '{print $2}'
}

while true; do
    CURRENT_SIGNAL=$(get_signal_dBm)
    
    if [ "$CURRENT_SIGNAL" -lt -70 ]; then
        SET_BITRATE=1000
    elif [ "$CURRENT_SIGNAL" -lt -60 ]; then
        SET_BITRATE=5000
    elif [ "$CURRENT_SIGNAL" -lt -50 ]; then
        SET_BITRATE=10000
    else
        SET_BITRATE=20000
    fi
    if [ "$SET_BITRATE" -ne "$LAST_RATE" ]; then
        curl -s "http://localhost/api/v1/set?video0.bitrate=$SET_BITRATE"
    fi
    LAST_RATE=$SET_BITRATE
    sleep 0.1
done
