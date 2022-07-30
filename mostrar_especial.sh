#!/bin/bash

#Lee en el fichero INFO_RXF para poner los datos en el icono INFO TXF
frecuencia=$(awk "NR==3" /home/pi/INFO_RXF)

onoff=$(awk "NR==10" /home/pi/status.ini)
if [ $onoff = MMDVMESPECIAL=ON ]
then
# Botón  Abrir ESPECIAL ON
SCRIPTS_version=$(awk "NR==1" /home/pi/.config/autostart/version)
cd /home/pi/Desktop
sudo cp Abrir_ESPECIAL.desktop /home/pi

sed -i "4c Exec=sh -c 'cd /home/pi/$SCRIPTS_version; lxterminal --geometry=77x18 --title=ESPECIAL -e sudo sh cerrar_ESPECIAL.sh'" /home/pi/Abrir_ESPECIAL.desktop
sed -i "5c Icon=/home/pi/$SCRIPTS_version/ICONO_ESPECIAL_ON.png" /home/pi/Abrir_ESPECIAL.desktop
sed -i "10c Name[es_ES]=Cerrar ESPECIAL" /home/pi/Abrir_ESPECIAL.desktop
cd /home/pi

sudo cp Abrir_ESPECIAL.desktop /home/pi/Desktop

sudo rm /home/pi/Abrir_ESPECIAL.desktop

else
# Botón  Abrir ESPECIAL+ OFF
cd /home/pi/Desktop
sudo cp Abrir_ESPECIAL.desktop /home/pi

sed -i "4cExec=sh -c 'cd /home/pi/$SCRIPTS_version; lxterminal --geometry=77x18 --title=ESPECIAL -e sudo sh ejecutar_ESPECIAL.sh'" /home/pi/Abrir_ESPECIAL.desktop
sed -i "5c Icon=/home/pi/$SCRIPTS_version/ICONO_ESPECIAL_OFF.png" /home/pi/Abrir_ESPECIAL.desktop
sed -i "10c Name[es_ES]=Abrir ESPECIAL" /home/pi/Abrir_ESPECIAL.desktop
cd /home/pi

sudo cp Abrir_ESPECIAL.desktop /home/pi/Desktop

sudo rm /home/pi/Abrir_ESPECIAL.desktop
fi



# Elegir icono Editar ESPECIAL
cd /home/pi/Desktop
sudo cp Editar_ESPECIAL.desktop /home/pi
sed -i "4c Exec=sh -c 'cd /home/pi/$SCRIPTS_version;./qt_editor_especial'" /home/pi/Editar_ESPECIAL.desktop
sed -i "5c Icon=/home/pi/$SCRIPTS_version/ICONO_EDITAR_DMR2YSF.png" /home/pi/Editar_ESPECIAL.desktop
sed -i "11c Name[es_ES]=Editar ESPECIAL" /home/pi/Editar_ESPECIAL.desktop

cd /home/pi
sudo cp Editar_ESPECIAL.desktop /home/pi/Desktop
sudo rm /home/pi/Editar_ESPECIAL.desktop

# Elegir icono Editar info ESPECIAL
cd /home/pi/Desktop
sudo cp RXF_ESPECIAL.desktop /home/pi
sed -i "4c Exec=sh -c 'cd /home/pi/$SCRIPTS_version;./qt_info_especial'" /home/pi/RXF_ESPECIAL.desktop
sed -i "5c Icon=/home/pi/$SCRIPTS_version/ICONO_INFO.png" /home/pi/RXF_ESPECIAL.desktop
sed -i "6c Type=Application" /home/pi/RXF_ESPECIAL.desktop
sed -i "11c Name[es_ES]=$frecuencia" /home/pi/RXF_ESPECIAL.desktop

cd /home/pi
sudo cp RXF_ESPECIAL.desktop /home/pi/Desktop
sudo rm /home/pi/RXF_ESPECIAL.desktop

