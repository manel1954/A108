#!/bin/bash

#Lee en el fichero INFO_RXF para poner los datos en el icono INFO TXF
frecuencia=$(awk "NR==3" /home/pi/INFO_RXF)

onoff=$(awk "NR==5" /home/pi/status.ini)
if [ $onoff = MMDVM=ON ]
then
# Botón  Abrir Radio ON
SCRIPTS_version=$(awk "NR==1" /home/pi/.config/autostart/version)
cd /home/pi/Desktop
sudo cp Abrir_Radio.desktop /home/pi

sed -i "4c Exec=sh -c 'cd /home/pi/$SCRIPTS_version; lxterminal --geometry=77x18 --title=RADIO -e sudo sh cerrar_radio.sh'" /home/pi/Abrir_Radio.desktop
sed -i "5c Icon=/home/pi/$SCRIPTS_version/ICONO_RADIO_ON.png" /home/pi/Abrir_Radio.desktop
sed -i "10c Name[es_ES]=Cerrar RADIO" /home/pi/Abrir_Radio.desktop
cd /home/pi

sudo cp Abrir_Radio.desktop /home/pi/Desktop

sudo rm /home/pi/Abrir_Radio.desktop

else
# Botón  Abrir Radio OFF
SCRIPTS_version=$(awk "NR==1" /home/pi/.config/autostart/version)
cd /home/pi/Desktop
sudo cp Abrir_Radio.desktop /home/pi

sed -i "4cExec=sh -c 'cd /home/pi/$SCRIPTS_version; lxterminal --geometry=77x18 --title=DMRPLUS -e sudo sh ejecutar_radio.sh'" /home/pi/Abrir_Radio.desktop
sed -i "5c Icon=/home/pi/$SCRIPTS_version/ICONO_RADIO_OFF.png" /home/pi/Abrir_Radio.desktop
sed -i "10c Name[es_ES]=Abrir RADIO" /home/pi/Abrir_Radio.desktop
cd /home/pi

sudo cp Abrir_Radio.desktop /home/pi/Desktop

sudo rm /home/pi/Abrir_Radio.desktop
fi



# Elegir icono Editar Radio
cd /home/pi/Desktop
sudo cp Editar_DMRPLUS.desktop /home/pi
sed -i "4c Exec=sh -c 'cd /home/pi/$SCRIPTS_version;./qt_editor_dmrplus'" /home/pi/Editar_DMRPLUS.desktop
sed -i "5c Icon=/home/pi/$SCRIPTS_version/ICONO_EDITAR_DMRPLUS.png" /home/pi/Editar_DMRPLUS.desktop
sed -i "11c Name[es_ES]=Editar DMR+" /home/pi/Editar_DMRPLUS.desktop

cd /home/pi
sudo cp Editar_DMRPLUS.desktop /home/pi/Desktop
sudo rm /home/pi/Editar_DMRPLUS.desktop

# Elegir icono Editar info Radio
cd /home/pi/Desktop
sudo cp RXF_DMRPLUS.desktop /home/pi
sed -i "4c Exec=sh -c 'cd /home/pi/$SCRIPTS_version;./qt_info_dmrplus_new'" /home/pi/RXF_DMRPLUS.desktop
sed -i "5c Icon=/home/pi/$SCRIPTS_version/ICONO_INFO.png" /home/pi/RXF_DMRPLUS.desktop
sed -i "6c Type=Application" /home/pi/RXF_DMRPLUS.desktop
sed -i "11c Name[es_ES]=$frecuencia" /home/pi/RXF_DMRPLUS.desktop

cd /home/pi
sudo cp RXF_DMRPLUS.desktop /home/pi/Desktop
sudo rm /home/pi/RXF_DMRPLUS.desktop

