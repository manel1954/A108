#!/bin/bash

SCRIPTS_version=$(awk "NR==1" /home/pi/.config/autostart/version)
cd /home/pi/Desktop
sudo cp Abrir_MMDVMBM.desktop /home/pi
sed -i "4c Exec=sh -c 'cd /home/pi/$SCRIPTS_version;ls'" /home/pi/Abrir_MMDVMBM.desktop
sed -i "5c Icon=/home/pi/$SCRIPTS_version/ICONO_TRANSPARENTE.png" /home/pi/Abrir_MMDVMBM.desktop
sed -i "10c Name[es_ES]=." /home/pi/Abrir_MMDVMBM.desktop

cd /home/pi
sudo cp Abrir_MMDVMBM.desktop /home/pi/Desktop
sudo rm /home/pi/Abrir_MMDVMBM.desktop