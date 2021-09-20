#!/bin/sh

echo "u4:x:1021:1021::/home/u4:/bin/bash" >> /etc/passwd
echo "u4:x:1021:" >> /etc/group
mkdir /home/u4
cp /etc/skel/readme.txt /home/u4
#получаем пароль 
perl -e 'print crypt($ARGV[0], "password")' 123
echo "u4:paN8aiEIonqJE:18884:0:99999:7:::" >> /etc/shadow

chown -R u4 .
chmod -R go=u,go-w .
chmod -R go=u,go-w .
chmod go= .
