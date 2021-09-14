#!/bin/bash

#1
echo "Users:" > $HOME/lab3/work3.log
awk -F : '{print "user " $1 " has id " $3}' /etc/passwd >> $HOME/lab3/work3.log

#2
echo "Root's password expires:" >> $HOME/lab3/work3.log
chage -l root | grep "Password expires" | cut -d : -f 2 >> $HOME/lab3/work3.log

#3
echo "Groups:" >> $HOME/lab3/work3.log
cat /etc/group | cut -d : -f 1 | tr -s '\n' ',' >> $HOME/lab3/work3.log

#4
echo "Be careful!" > /etc/skel/readme.txt

#5
sudo useradd -p 12345678 u1

#6
sudo groupadd g1

#7
sudo usermod -a -G g1 u1

#8
echo "u1 groups:" >> $HOME/lab3/work3.log
id u1 >> $HOME/lab3/work3.log

#9
sudo usermod -a -G g1 user

#10
echo "Group g1 members:" >> $HOME/lab3/work3.log
cat /etc/group | grep g1 | cut -d : -f 4 >> $HOME/lab3/work3.log

#11
sudo usermod -s /usr/bin/mc u1

#12
sudo useradd -p 87654321 u2

#13
mkdir /home/test13
cp $HOME/lab3/work3.log /home/test13/work3-1.log
cp $HOME/lab3/work3.log /home/test13/work3-2.log

#14
chown -R u1:u2 /home/test13
chmod -R u+rw- /home/test13
chmod -R g+r-- /home/test13
chmod -R o-rwx /home/test13

#15
mkdir /home/test14
chgrp -R u1 /home/test14
chmod +t /home/test14
chmod -R o-rwx /home/test14

