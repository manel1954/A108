#!/bin/bash

# Ocultar icono Abrir_Radio
SCRIPTS_version=$(awk "NR==1" /home/pi/.config/autostart/version)
cd /home/pi/Desktop
sudo cp Abrir_Radio.desktop /home/pi
sed -i "4c Exec=sh -c 'cd /home/pi/$SCRIPTS_version;ls'" /home/pi/Abrir_Radio.desktop
sed -i "5c Icon=/home/pi/$SCRIPTS_version/ICONO_TRANSPARENTE.png" /home/pi/Abrir_Radio.desktop
sed -i "10c Name[es_ES]=." /home/pi/Abrir_Radio.desktop

cd /home/pi
sudo cp Abrir_Radio.desktop /home/pi/Desktop
sudo rm /home/pi/Abrir_Radio.desktop

# Ocultar icono Editar RADIO
cd /home/pi/Desktop
sudo cp Editar_Radio.desktop /home/pi
sed -i "4c Exec=sh -c 'cd /home/pi/$SCRIPTS_version;ls'" /home/pi/Editar_Radio.desktop
sed -i "5c Icon=/home/pi/$SCRIPTS_version/ICONO_TRANSPARENTE.png" /home/pi/Editar_Radio.desktop
sed -i "11c Name[es_ES]=." /home/pi/Editar_Radio.desktop

cd /home/pi
sudo cp Editar_Radio.desktop /home/pi/Desktop
sudo rm /home/pi/Editar_Radio.desktop

# Ocultar icono Editar info RADIO
cd /home/pi/Desktop
sudo cp RXF_RADIO.desktop /home/pi
sed -i "4c Exec=sh -c 'cd /home/pi/$SCRIPTS_version;ls'" /home/pi/RXF_RADIO.desktop
sed -i "5c Icon=/home/pi/$SCRIPTS_version/ICONO_TRANSPARENTE.png" /home/pi/RXF_RADIO.desktop
sed -i "11c Name[es_ES]=." /home/pi/RXF_RADIO.desktop

cd /home/pi
sudo cp RXF_RADIO.desktop /home/pi/Desktop
sudo rm /home/pi/RXF_RADIO.desktop