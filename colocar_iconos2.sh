#!/bin/bash
sudo chmod 777 -R /home/pi/Desktop
cp /home/pi/A108/Desktop/*.* /home/pi/Desktop

sudo chmod 777 /home/pi/.config/xfce4/desktop/icons.screen0-1904x1023.rc
sudo chmod 777 /home/pi/icons.screen0-1904x1023.rc
cp /home/pi/A108/skin2_icons.screen0-1904x1023.rc /home/pi/icons.screen0-1904x1023.rc

sudo cp /home/pi/A108/SKIN2_FONDO_ADER_A108.jpg /home/pi/A108/FONDO_ADER_A108.jpg
sudo chmod 777 /home/pi/A108/skin2_icons.screen0-1904x1023.rc
cp /home/pi/A108/skin2_icons.screen0-1904x1023.rc /home/pi/.config/xfce4/desktop/icons.screen0-1904x1023.rc

xfdesktop --reload




                                