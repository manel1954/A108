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
                        if [ -f /home/pi/.local/A108/aviso ]
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

                        # Modificacion 25-06-2022
                        if [ -f /home/pi/.local/nextion_dmrgateway ]
                        then
                        echo ""
                        else
                        cd /home/pi/A108
                        cp nextion_dmrgateway /home/pi/.local
                        fi

                        # Modificacion 26-07-2022
                        TGLIST=$(awk "NR==25" /home/pi/DMR2YSF/TG-YSFList.txt)
                        if [ $TGLIST == 25 ]
                        then
                        echo ""
                        else
                        cd /home/pi/A108
                        sudo cp TG-YSFList.txt /home/pi/DMR2YSF
                        sudo chmod 755 /home/pi/DMR2YSF/TG-YSFList.txt
                        fi

                        sala=$(awk "NR==25" /home/pi/.local)
                        if [ $sala == 25 ]
                        then
                        echo ""
                        else
                        cd /home/pi/A108
                        sudo cp sala.txt /home/pi/.local
                        sudo chmod 755 /home/pi/.local/sala.txt
                        fi
                        #==========================================


                        if [ -f /home/pi/.local/oled_dmrgateway ]
                        then
                        echo ""
                        else
                        cd /home/pi/A108
                        cp oled_dmrgateway /home/pi/.local
                        fi
sed -i '97c Enable=0' /home/pi/MMDVMHost/MMDVMDMRGateway.ini
sed -i '127c Enable=0' /home/pi/MMDVMHost/MMDVMDMRGateway.ini
sed -i '135c Enable=0' /home/pi/MMDVMHost/MMDVMDMRGateway.ini
sed -i '144c Enable=0' /home/pi/MMDVMHost/MMDVMDMRGateway.ini
sed -i '152c Enable=0' /home/pi/MMDVMHost/MMDVMDMRGateway.ini
sed -i '159c Enable=0' /home/pi/MMDVMHost/MMDVMDMRGateway.ini
sed -i '163c Enable=0' /home/pi/MMDVMHost/MMDVMDMRGateway.ini
sed -i '209c Enable=0' /home/pi/MMDVMHost/MMDVMDMRGateway.ini


                        # Actualiza AUTORRANQUE_A108
                        #cd /home/pi/.local
                        #git clone http://github.com/ea3eiz/AUTOARRANQUE_A108
                        #sleep 2
                        #if [ -d /home/pi/.local/AUTOARRANQUE_A108 ]
                        #then
                        #sudo rm -R /home/pi/AUTOARRANQUE_A108
                        #cp -R /home/pi/.local/AUTOARRANQUE_A108 /home/pi
                        #cd /home/pi
                        #sudo chmod 777 -R AUTOARRANQUE_A108
                        #cd /home/pi/.local
                        #sudo rm -R AUTOARRANQUE_A108
                        #else
                        #echo "Error de red"
                        #exit
                        #fi

                        #modificación 01-01-2022
                        sed -i "4c Exec=sh -c 'cd /home/pi/A108; ./qt_activar_nextiondriver'" /home/pi/.local/Activar_NextionDriver.desktop
                        sed -i "5c Icon=//home/pi/A108/ICONO_NEXTIONDRIVER_OFF.png" /home/pi/.local/Activar_NextionDriver.desktop

                        sed -i "4c Exec=sh -c 'cd /home/pi/A108; ./qt_desactivar_nextiondriver'" /home/pi/.local/Desactivar_NextionDriver.desktop
                        sed -i "5c Icon=//home/pi/A108/ICONO_NEXTIONDRIVER_ON.png" /home/pi/.local/Desactivar_NextionDriver.desktop

                        sudo sed -i "27c 30 10 * * * sudo sh /home/pi/A108/actualiza_imagen.sh" /var/spool/cron/crontabs/pi

                        sed -i "4c Exec=sh -c 'cd /home/pi/A108; ./qt_indicativo'" /home/pi/.config/autostart/indicativo.desktop

                        # modificacion 17-01-2022
                        sudo sed -i "1c 01-01-2022" /home/pi/.config/autostart/actualizacion


                        # modificacion 17-01-2022
                        #cd /home/pi/A108
                        #cp index_template.html_00 /opt/HBmonitor
                        #cp index_template.html_01 /opt/HBmonitor
                        #cp index_template.html_02 /opt/HBmonitor
                        #cp index_template.html_03 /opt/HBmonitor
                        #cp index_template.html_04 /opt/HBmonitor
                        #cp monitor.py_00 /opt/HBmonitor
                        #cp monitor.py_01 /opt/HBmonitor
                        #cp monitor.py_02 /opt/HBmonitor
                        #cp monitor.py_03 /opt/HBmonitor
                        #cp monitor.py_04 /opt/HBmonitor

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
