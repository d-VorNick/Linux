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
yum list installed > lab4/task3.log

#4
yum deplist gcc > lab4/task4_1.log
yum provides libgcc > lab4/task4_2.log

#5
mkdir -p $HOME/localrepo
yum install createrepo yum-utils
createrepo -v $HOME/localrepo
nano /etc/yum.repos.d/localrepo.repo
  [localrepo]
  name=localrepo
  baseurl=file://root/localrepo/
  enabled=1
  gpgcheck=0

#6
yum repolist all > lab4/task6.log

#7
rename .repo .nerepo *
rename localrepo.nerepo localrepo.repo *


