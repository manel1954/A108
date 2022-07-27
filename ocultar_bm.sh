#!/bin/bash

# Ocultar icono Abrir BM
SCRIPTS_version=$(awk "NR==1" /home/pi/.config/autostart/version)
cd /home/pi/Desktop
sudo cp Abrir_MMDVMBM.desktop /home/pi
sed -i "4c Exec=sh -c 'cd /home/pi/$SCRIPTS_version;ls'" /home/pi/Abrir_MMDVMBM.desktop
sed -i "5c Icon=/home/pi/$SCRIPTS_version/ICONO_TRANSPARENTE.png" /home/pi/Abrir_MMDVMBM.desktop
sed -i "10c Name[es_ES]=." /home/pi/Abrir_MMDVMBM.desktop

cd /home/pi
sudo cp Abrir_MMDVMBM.desktop /home/pi/Desktop
sudo rm /home/pi/Abrir_MMDVMBM.desktop

# Ocultar icono Editar BM
cd /home/pi/Desktop
sudo cp Editar_MMDVMBM.desktop /home/pi
sed -i "4c Exec=sh -c 'cd /home/pi/$SCRIPTS_version;ls'" /home/pi/Editar_MMDVMBM.desktop
sed -i "5c Icon=/home/pi/$SCRIPTS_version/ICONO_TRANSPARENTE.png" /home/pi/Editar_MMDVMBM.desktop
sed -i "11c Name[es_ES]=." /home/pi/Editar_MMDVMBM.desktop

cd /home/pi
sudo cp Editar_MMDVMBM.desktop /home/pi/Desktop
sudo rm /home/pi/Editar_MMDVMBM.desktop

# Ocultar icono Editar info BM
cd /home/pi/Desktop
sudo cp RXF_BM.desktop /home/pi
sed -i "5c Exec=sh -c 'cd /home/pi/$SCRIPTS_version;ls'" /home/pi/RXF_BM.desktop
sed -i "6c Icon=/home/pi/$SCRIPTS_version/ICONO_TRANSPARENTE.png" /home/pi/RXF_BM.desktop
sed -i "12c Name[es_ES]=." /home/pi/RXF_BM.desktop

cd /home/pi
sudo cp RXF_BM.desktop /home/pi/Desktop
sudo rm /home/pi/RXF_BM.desktop