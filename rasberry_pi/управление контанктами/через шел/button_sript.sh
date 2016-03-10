#!/bin/bash #
echo Exporting pin $1. #
echo $1 > /sys/class/gpio/export #
echo Setting direcrtion to out.
echo out > /sys/class/gpio/gpio$1/direction #
echo Setting pin high.
echo 1 > /sys/class/gpio/gpio$1/value

#sudo chmod +x button_sript.sh  не забыть
#  ./скрипт_для_кнопки.sh 25 
