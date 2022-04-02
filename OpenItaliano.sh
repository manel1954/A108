#!/bin/bash
cd /home/pi/dmr_bridge/

sudo xterm -geometry 61x10+249+97 -bg black -fg white -fa 'Serif' -fs 9x -T RADIO_TERMINAL -e python3 /home/pi/dmr_bridge/dmr_bridge.py /home/pi/dmr_bridge/dmr_bridge.ini &