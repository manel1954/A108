#!/bin/bash

# Ejecuta Solo D-STAR
cd /home/pi/MMDVMHost
#/home/pi/A108/./qt_info_solodstar & sudo ircddbgateway -gui & sudo ./MMDVMDSTAR MMDVMDSTAR.ini 
sudo ./MMDVMHost MMDVM.ini
sleep 15
sudo ircddbgateway -gui &






