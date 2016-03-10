#!/bin/bash
wget -O ~/ip.out -q icanhazip.com
V_IP=$(
echo $V_IP
sendemail -f nick1994209@gmail.com  -t nick1994209@yandex.ru  -u "my ip" -s smtp.gmail.com:587 -o tls=yes -xu nick1994209@gmail.com -xp password -m "$V_IP "

