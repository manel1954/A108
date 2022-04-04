#!/bin/bash
#cierra ircDDBGateway
sudo killall ircddbgateway
#cierra remotecontrol
sudo killall remotecontrol

SCRIPTS_version=$(awk "NR==1" /home/pi/.config/autostart/version)
#cierra Abrir_ircDDBGateway.desktop y quita icono verde de "cerrar ircDDB" 
cd /home/pi/Desktop
sudo cp Abrir_ircDDB.desktop /home/pi

sed -i "4cExec=sh -c 'cd /home/pi/$SCRIPTS_version;sudo sh Open_ejecutar_ircDDB.sh'" /home/pi/Abrir_ircDDB.desktop
sed -i "5c Icon=/home/pi/$SCRIPTS_version/ICONO_IRCDDB_OFF.png" /home/pi/Abrir_ircDDB.desktop
sed -i "10c Name[es_ES]=Abrir ircDDB" /home/pi/Abrir_ircDDB.desktop
sed -i "1c D-STAR=OFF" /home/pi/status.ini

cd /home/pi
sudo cp Abrir_ircDDB.desktop /home/pi/Desktop

sudo rm /home/pi/Abrir_ircDDB.desktop

