#!/bin/bash
                    cd /home/pi
                    #sudo cp -R MMDVMHost /home/pi/.local/ 
                    sudo rm -r /home/pi/.local/MMDVMHost
                    sudo apt-get install build-essential git-core libi2c-dev i2c-tools lm-sensors
                    git clone https://github.com/g4klx/MMDVMHost
                    cd MMDVMHost
                    git clone https://github.com/hallard/ArduiPi_OLED
                    cd ArduiPi_OLED
                    sudo make clean
                    sudo make
                                    
                    cd /home/pi/.local/MMDVMHost

                    HOY=$(date +%Y%m%d)
                    FIJA="const char* VERSION = "\"
                    PI="ADER108"\"
                    HOY1=$HOY$PI
                    PUNTO=";"   
                    
                    sed -i "22c $FIJA$HOY1$PUNTO" /home/pi/.local/MMDVMHost/Version.h

                    make clean
                    make -f Makefile.Pi.OLED

                    #Instala la secion [NextionDriver] en todos los .ini y todas sus memorias
                    cd /home/pi/NextionDriverInstaller
                    sudo ./NextionDriver_ConvertConfig /home/pi/.local/MMDVMHost/MMDVM.ini
                    sleep 2                  
                    
                    sed -i "5c Duplex=0" /home/pi/.local/MMDVMHost/MMDVM.ini
                    sed -i "52c # UARTSpeed=460800" /home/pi/.local/MMDVMHost/MMDVM.ini
                    sed -i "229c Type=Direct" /home/pi/.local/MMDVMHost/MMDVM.ini
                    sed -i "231c # LocalPort=62032" /home/pi/.local/MMDVMHost/MMDVM.ini
                    sed -i "234c Password=PASSWORD" /home/pi/.local/MMDVMHost/MMDVM.ini

                    # Crea los ejecutables para estas aplicaciones 
                    cd /home/pi/.local/MMDVMHost
                    cp MMDVMHost MMDVMBM
                    cp MMDVMHost MMDVMPLUS
                    cp MMDVMHost MMDVMDSTAR
                    cp MMDVMHost MMDVMFUSION
                    cp MMDVMHost DMR2NXDN
                    cp MMDVMHost DMR2YSF
                    cp MMDVMHost MMDVMDMR2M17
                    cp MMDVMHost MMDVMNXDN
                    cp MMDVMHost MMDVMESPECIAL
                    cp MMDVMHost MMDVMDMRGATEWAY                 
                    
                    # Crea el fichero para que arranque NextionDriver ==================
                    cp MMDVM.ini MMDVM.ini_NextionDriver

                    # Crea los ficheros .ini y Memorias ==================
                    cp MMDVM.ini MMDVM.ini_original
                    cp MMDVM.ini MMDVM.ini_copia
                    cp MMDVM.ini MMDVM.ini_copia2
                    cp MMDVM.ini MMDVM.ini_copia3

                    cp MMDVM.ini MMDVMBM.ini
                    cp MMDVM.ini MMDVMBM.ini_copia
                    cp MMDVM.ini MMDVMBM.ini_copia2
                    cp MMDVM.ini MMDVMBM.ini_copia3

                    cp MMDVM.ini MMDVMPLUS.ini
                    cp MMDVM.ini MMDVMPLUS.ini_copia
                    cp MMDVM.ini MMDVMPLUS.ini_copia2
                    cp MMDVM.ini MMDVMPLUS.ini_copia3

                    cp MMDVM.ini MMDVMDSTAR.ini
                    cp MMDVM.ini MMDVMDSTAR.ini_copia
                    cp MMDVM.ini MMDVMDSTAR.ini_copia2
                    cp MMDVM.ini MMDVMDSTAR.ini_copia3

                    cp MMDVM.ini MMDVMFUSION.ini
                    cp MMDVM.ini MMDVMFUSION.ini_copia
                    cp MMDVM.ini MMDVMFUSION.ini_copia2
                    cp MMDVM.ini MMDVMFUSION.ini_copia3  

                    cp MMDVM.ini MMDVMESPECIAL.ini
                    cp MMDVM.ini MMDVMESPECIAL.ini_copia
                    cp MMDVM.ini MMDVMESPECIAL.ini_copia2
                    cp MMDVM.ini MMDVMESPECIAL.ini_copia3                

                    cp MMDVM.ini MMDVMNXDN.ini
                    
                    cp MMDVM.ini TODOS_LOS_INIS.ini

                    cp MMDVM.ini MMDVMDMR2YSF.ini
                    
                    cp MMDVM.ini MMDVMDMR2NXDN.ini

                    cp MMDVM.ini MMDVMDMR2M17.ini
                  
                    cp MMDVM.ini MMDVMDMRGateway.ini 
                    
                    sed -i "52c # UARTSpeed=460800" /home/pi/.local/MMDVMHost/MMDVMDMRGateway.ini
                    sed -i "229c Type=Gateway" /home/pi/.local/MMDVMHost/MMDVMDMRGateway.ini
                    sed -i "231c LocalPort=62032" /home/pi/.local/MMDVMHost/MMDVMDMRGateway.ini
                    
                    sed -i "52c # UARTSpeed=460800" /home/pi/.local/MMDVMHost/MMDVMDMR2YSF.ini
                    sed -i "231c LocalPort=62032" /home/pi/.local/MMDVMHost/MMDVMDMR2YSF.ini
                    sed -i "231c LocalPort=62032" /home/pi/.local/MMDVMHost/MMDVMDMR2NXDN.ini
                    sed -i "231c LocalPort=62037" /home/pi/.local/MMDVMHost/MMDVMDMR2M17.ini

                    sudo chmod 777 -R /home/pi/.local/MMDVMHost
                
                    exit;
