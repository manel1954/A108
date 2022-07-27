#!/bin/bash

#Lee en el fichero INFO_RXF para poner los datos en el icono INFO TXF
frecuencia=$(awk "NR==2" /home/pi/INFO_RXF)

onoff=$(awk "NR==6" /home/pi/status.ini)
if [ $onoff = MMDVMPLUS=ON ]
then
# Botón  Abrir DMR+ ON
SCRIPTS_version=$(awk "NR==1" /home/pi/.config/autostart/version)
cd /home/pi/Desktop
sudo cp Abrir_MMDVMPLUS.desktop /home/pi

sed -i "4c Exec=sh -c 'cd /home/pi/$SCRIPTS_version; lxterminal --geometry=77x18 --title=DMRPLUS -e sudo sh cerrar_DMRPLUS.sh'" /home/pi/Abrir_MMDVMPLUS.desktop
sed -i "5c Icon=/home/pi/$SCRIPTS_version/ICONO_DMRPLUS_ON.png" /home/pi/Abrir_MMDVMPLUS.desktop
sed -i "10c Name[es_ES]=Cerrar DMR+" /home/pi/Abrir_MMDVMPLUS.desktop
cd /home/pi

sudo cp Abrir_MMDVMPLUS.desktop /home/pi/Desktop

sudo rm /home/pi/Abrir_MMDVMPLUS.desktop

else
# Botón  Abrir DMR+ OFF
SCRIPTS_version=$(awk "NR==1" /home/pi/.config/autostart/version)
cd /home/pi/Desktop
sudo cp Abrir_MMDVMPLUS.desktop /home/pi

sed -i "4cExec=sh -c 'cd /home/pi/$SCRIPTS_version; lxterminal --geometry=77x18 --title=DMRPLUS -e sudo sh ejecutar_DMRPLUS.sh'" /home/pi/Abrir_MMDVMPLUS.desktop
sed -i "5c Icon=/home/pi/$SCRIPTS_version/ICONO_DMRPLUS_OFF.png" /home/pi/Abrir_MMDVMPLUS.desktop
sed -i "10c Name[es_ES]=Abrir DMR+" /home/pi/Abrir_MMDVMPLUS.desktop
cd /home/pi

sudo cp Abrir_MMDVMPLUS.desktop /home/pi/Desktop

sudo rm /home/pi/Abrir_MMDVMPLUS.desktop
fi



# Elegir icono Editar DMR+
cd /home/pi/Desktop
sudo cp Editar_DMRPLUS.desktop /home/pi
sed -i "4c Exec=sh -c 'cd /home/pi/$SCRIPTS_version;./qt_editor_dmrplus'" /home/pi/Editar_DMRPLUS.desktop
sed -i "5c Icon=/home/pi/$SCRIPTS_version/ICONO_EDITAR_DMRPLUS.png" /home/pi/Editar_DMRPLUS.desktop
sed -i "11c Name[es_ES]=Editar DMR+" /home/pi/Editar_DMRPLUS.desktop

cd /home/pi
sudo cp Editar_DMRPLUS.desktop /home/pi/Desktop
sudo rm /home/pi/Editar_DMRPLUS.desktop

# Elegir icono Editar info DMR+
cd /home/pi/Desktop
sudo cp RXF_DMRPLUS.desktop /home/pi
sed -i "4c Exec=sh -c 'cd /home/pi/$SCRIPTS_version;./qt_info_dmrplus_new'" /home/pi/RXF_DMRPLUS.desktop
sed -i "5c Icon=/home/pi/$SCRIPTS_version/ICONO_INFO.png" /home/pi/RXF_DMRPLUS.desktop
sed -i "6c Type=Application" /home/pi/RXF_DMRPLUS.desktop
sed -i "11c Name[es_ES]=$frecuencia" /home/pi/RXF_DMRPLUS.desktop

cd /home/pi
sudo cp RXF_DMRPLUS.desktop /home/pi/Desktop
sudo rm /home/pi/RXF_DMRPLUS.desktop

