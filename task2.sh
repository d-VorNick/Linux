
echo "u4:x:1021:1021::/home/u4:/bin/bash" >> /etc/passwd
echo "u4:x:1021:" >> /etc/group
mkdir /home/u4
cp /etc/skel/readme.txt /home/u4
