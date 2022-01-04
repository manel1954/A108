#!/bin/bash

# path usuario
usuario=$(awk "NR==1" /home/pi/.config/autostart/usuario)
SCRIPTS_version=$(awk "NR==1" $usuario/.config/autostart/version)
version=`expr substr $SCRIPTS_version 2 2`
AUTOARRANQUE="AUTOARRANQUE"
AUTOARRANQUE=$AUTOARRANQUE$SCRIPTS_version

#Colores
ROJO="\033[1;31m"
VERDE="\033[1;32m"
BLANCO="\033[1;37m"
AMARILLO="\033[1;33m"
CIAN="\033[1;36m"
GRIS="\033[0m"
MARRON="\33[38;5;138m"

                        cd /home/pi/.local
                        git clone http://github.com/ea3eiz/A108
                        sleep 2
                        if [ -d /home/pi/.local/A108 ]
                        then
                        sudo rm -R /home/pi/A108
                        cp -R /home/pi/.local/A108 /home/pi
                        cd /home/pi
                        sudo chmod 777 -R A108
                        cd /home/pi/.local
                        sudo rm -R A108
                        else
                        clear
                        echo "${VERDE}"
                        echo "***********************************"
                        echo -n "${ROJO}"
                        echo "           ERROR DE RED            "
                        echo -n "${VERDE}"
                        echo "***********************************"

                        echo "${GRIS}"
                        sleep 5
                        exit
                        fi

                        # Actualiza AUTORRANQUE_A108
                        cd /home/pi/.local
                        git clone http://github.com/ea3eiz/AUTOARRANQUE_A108
                        sleep 2
                        if [ -d /home/pi/.local/AUTOARRANQUE_A108 ]
                        then
                        sudo rm -R /home/pi/AUTOARRANQUE_A108
                        cp -R /home/pi/.local/AUTOARRANQUE_A108 /home/pi
                        cd /home/pi
                        sudo chmod 777 -R AUTOARRANQUE_A108
                        cd /home/pi/.local
                        sudo rm -R AUTOARRANQUE_A108
                        else
                        echo "Error de red"
                        exit
                        fi

                        #modificación 01-01-2022
                        sed -i "4c Exec=sh -c 'cd /home/pi/A108; ./qt_activar_nextiondriver'" /home/pi/.local/Activar_NextionDriver.desktop
                        sed -i "5c Icon=//home/pi/A108/ICONO_NEXTIONDRIVER_OFF.png" /home/pi/.local/Activar_NextionDriver.desktop

                        sed -i "4c Exec=sh -c 'cd /home/pi/A108; ./qt_desactivar_nextiondriver'" /home/pi/.local/Desactivar_NextionDriver.desktop
                        sed -i "5c Icon=//home/pi/A108/ICONO_NEXTIONDRIVER_ON.png" /home/pi/.local/Desactivar_NextionDriver.desktop

                        sudo sed -i "27c 30 10 * * * sudo sh /home/pi/A108/actualiza_imagen.sh" /var/spool/cron/crontabs/pi

                        # modificacion 26-04-2021
                        #cp /home/pi/A108/pararservicios_hblink.sh /home/pi
                        #cp /home/pi/A108/pararservicios_hblink.desktop /home/pi/.config/autostart
                        #sudo chmod 777 /home/pi/pararservicios_hblink.sh
                        #sudo chmod 777 /home/pi/.config/autostart/pararservicios_hblink.desktop

                        # 14-08-2020 cambio actualizar para que salgan los indicativos en DVSWITCH:
                        #cd /var/lib/mmdvm
                        #sudo curl --fail -o DMRIds.dat -s http://www.pistar.uk/downloads/DMRIds.dat
                        #sudo chmod 777 -R /var/lib/mmdvm

                        # 26-08-2020 actualizar salas DSTAR
                        cd /usr/share/opendv/
                        sudo curl --fail -o DExtra_Hosts.txt -s http://www.pistar.uk/downloads/DExtra_Hosts.txt
                        sleep 1
                        sudo curl --fail -o DCS_Hosts.txt -s http://www.pistar.uk/downloads/DCS_Hosts.txt
                        sleep 1
                        sudo curl --fail -o DPlus_Hosts.txt -s http://www.pistar.uk/downloads/DPlus_Hosts.txt

                        # 26-08-2020 actualizar salas DSTAR
                        cd /usr/local/share/opendv/
                        sudo curl --fail -o DExtra_Hosts.txt -s http://www.pistar.uk/downloads/DExtra_Hosts.txt
                        sleep 1
                        sudo curl --fail -o DCS_Hosts.txt -s http://www.pistar.uk/downloads/DCS_Hosts.txt
                        sleep 1
                        sudo curl --fail -o DPlus_Hosts.txt -s http://www.pistar.uk/downloads/DPlus_Hosts.txt
                        # 26-08-2020 actualizar salas dv4mini
                        sudo cp DExtra_Hosts.txt $usuario/dv4mini/xref.ip

                        #Lee el fichero INFO_RXF para poner los datos en los iconos INFO TXF
                        frecuencia=$(awk "NR==1" $usuario/INFO_RXF)
                        cd $usuario/Desktop/
                        sudo cp RXF_BM.desktop $usuario/
                        sed -i "11c Name=$frecuencia" $usuario/RXF_BM.desktop
                        cd $usuario
                        sudo cp RXF_BM.desktop $usuario/Desktop
                        sudo rm $usuario/RXF_BM.desktop

                        frecuencia=$(awk "NR==2" $usuario/INFO_RXF)
                        cd $usuario/Desktop/
                        sudo cp RXF_DMRPLUS.desktop $usuario/
                        sed -i "11c Name=$frecuencia" $usuario/RXF_DMRPLUS.desktop
                        cd $usuario
                        sudo cp RXF_DMRPLUS.desktop $usuario/Desktop
                        sudo rm $usuario/RXF_DMRPLUS.desktop

                        frecuencia=$(awk "NR==14" $usuario/INFO_RXF)
                        cd $usuario/Desktop/
                        sudo cp RXF_DMR2YSF.desktop $usuario/
                        sed -i "11c Name=$frecuencia" $usuario/RXF_DMR2YSF.desktop
                        cd $usuario
                        sudo cp RXF_DMR2YSF.desktop $usuario/Desktop
                        sudo rm $usuario/RXF_DMR2YSF.desktop

                        frecuencia=$(awk "NR==17" $usuario/INFO_RXF)
                        cd $usuario/Desktop/
                        sudo cp RXF_NXDN.desktop $usuario/
                        sed -i "11c Name=$frecuencia" $usuario/RXF_NXDN.desktop
                        cd $usuario
                        sudo cp RXF_NXDN.desktop $usuario/Desktop
                        sudo rm $usuario/RXF_NXDN.desktop

clear
/home/pi/A108/./qt_imagen_actualizada
