#1
yum groupinstall 'Development Tools'

#2
mkdir $HOME/bastet #в Centos
pscp C:\Users\vniki\Downloads\bastet-0.43.tgz  root@Ip:/root/bastet #в Windows
tar -xzvf bastet-0.43.tgz
sudo yum install boost-devel
sudo yum install ncurses-devel
cd $HOME/bastet
cp bastet /usr/local/bin
chgrp games /usr/local/bin/bastet
chmod g+s /usr/local/bin/bastet
touch /var/games/bastet.scores2
chgrp games /var/games/bastet.scores2
chmod 664 /var/games/bastet.scores2

#3
