#!/bin/bash
cd /home/pi/release/build/

sudo xterm -geometry 61x10+249+97 -bg black -fg white -fa 'Serif' -fs 9x -T RADIO_TERMINAL -e sudo ambed 192.168.1.34 &