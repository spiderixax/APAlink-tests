# APAlink-tests
Testing an adaptive bitrate system for OpenIPC APFPV.

HOW IT WORKS

The script runs the command "iw dev wlan0 station dump" and extracts signal strength. Based on the signal strength, it adjusts the camera's video streaming bitrate. The threshold values most likely need more tweaking and the optimal values may or may not depend on hardware used.

HOW TO INSTALL
  1. Place the file in /etc directory on the drone's IP camera running OpenIPC APFPV.
  2. Run this command on the IP camera:
     "chmod +x /etc/ap_alink_signal_strength.sh"
  4. Edit the file /etc/rc.local and add a this line fefore "exit 0":
     /etc/ap_alink_signal_strength.sh &
