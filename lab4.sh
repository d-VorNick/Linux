#1
yum groupinstall 'Development Tools'

#2
mkdir $HOME/bastet #в Centos
pscp C:\Users\vniki\Downloads\bastet-0.43.tgz  root@Ip:/root/bastet #в Windows
tar -xzvf bastet-0.43.tgz
sudo yum install boost-devel
sudo yum install ncurses-devel
cd $HOME/bastet
make
nano Makefile
  install:
          cp ./bastet /usr/bin
make install


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
C:\Users\vniki\Downloads\checkinstall-1.6.2-3.el6.1.x86_64.rpm  root@192.168.0.110:/root/localrepo
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
yum list available
yum install $HOME/localrepo/checkinstall-1.6.2-3.el6.1.x86_64.rpm

#8
C:\Users\vniki\Downloads\alien_8.95.tar.xz  root@192.168.0.110:/root/alien
sudo dnf install https://dl.fedoraproject.org/pub/epel/epel-release-latest-8.noarch.rpm
sudo rpm -ql epel-release
sudo dnf repolist -v
sudo dnf repository-packages epel list
rpm --import http://li.nux.ro/download/nux/RPM-GPG-KEY-nux.ro
rpm -Uvh http://li.nux.ro/download/nux/dextop/el7/x86_64/nux-dextop-release-0-5.el7.nux.noarch.rpm
dnf install perl
perl Makefile.PL; make; make install
alien --to-rpm --scripts fortunes-ru_1.52-2_all.deb
dnf install rpmrebuild
rpmrebuild -pe fortunes-ru-1.52-3.noarch.rpm
# прокрутите вниз до раздела %files и удалите строки (dd) для любых каталогов-нарушителей (в моем случае каталог " / "), сохраните(:w) и завершите работу (:q),
# нажмите "y" и отметьте местоположение результата. В моем случае оно было /root/rpmbuild/RPMS/noarch/fortunes-ru-1.52-3.noarch.rpm
yum install /root/rpmbuild/RPMS/noarch/fortunes-ru-1.52-3.noarch.rpm

#9
yum remove nano
C:\Users\vniki\Downloads\nano-2.9.8-1.el8.x86_64.rpm  root@192.168.0.110:/root/

dnf install perl-Text-Unidecode
dnf install perl-libintl-perl
pscp C:\Users\vniki\Downloads\perl-Unicode-EastAsianWidth-1.33-13.el8.noarch.rpm root@192.168.0.110:/root
su -c 'rpm -Uvh perl-Unicode-EastAsianWidth-1.33-13.el8.noarch.rpm'
pscp C:\Users\vniki\Downloads\file-devel-5.33-16.el8_3.1.i686.rpm root@192.168.0.110:/root
pscp C:\Users\vniki\Downloads\texinfo-6.5-6.el8.x86_64.rpm root@192.168.0.110:/root
su -c 'rpm -Uvh texinfo-6.5-6.el8.x86_64.rpm'
su -c 'rpm -Uvh file-devel-5.33-16.el8_3.1.i686.rpm'

yumdownloader --source nano
rpm -iv nano-2.9.8-1.el8.x86_64.rpm
cd rpmbuild/SPECS
vim nano.spec 
     # сюда надо добавить строки ln -s "nano" "/usr/bin/newnano"
     rm -f /usr/bin/newnano
rpmbuild -bb nano.spec 
cd $HOME/rpmbuild/RPMS
yum localinstall nano-2.9.8-1.el8.x86_64.rpm

# ДРУГОЙ СПОСОБ

rpmrebuild -pe nano-2.9.8-1.el8.x86_64.rpm
    #меняем Name на newnano
    ln -s "nano" "/usr/bin/newnano"
    rm -f /usr/bin/newnano
cd /root/rpmbuild/RPMS/x86_64
yum localinstall newnano-2.9.8-1.el8.x86_64.rpm




desktop-file-utils >= 0.2.93 is needed by vim-2:8.0.1763-15.el8.x86_64
        gpm-devel is needed by vim-2:8.0.1763-15.el8.x86_64
        gtk3-devel is needed by vim-2:8.0.1763-15.el8.x86_64
        libICE-devel is needed by vim-2:8.0.1763-15.el8.x86_64
        libSM-devel is needed by vim-2:8.0.1763-15.el8.x86_64
        libX11-devel is needed by vim-2:8.0.1763-15.el8.x86_64
        libXpm-devel is needed by vim-2:8.0.1763-15.el8.x86_64
        libXt-devel is needed by vim-2:8.0.1763-15.el8.x86_64
        libacl-devel is needed by vim-2:8.0.1763-15.el8.x86_64
        libappstream-glib is needed by vim-2:8.0.1763-15.el8.x86_64
        libselinux-devel is needed by vim-2:8.0.1763-15.el8.x86_64
        lua-devel is needed by vim-2:8.0.1763-15.el8.x86_64
        python2-devel is needed by vim-2:8.0.1763-15.el8.x86_64
        python3-devel is needed by vim-2:8.0.1763-15.el8.x86_64
        ruby is needed by vim-2:8.0.1763-15.el8.x86_64
        ruby-devel is needed by vim-2:8.0.1763-15.el8.x86_64
[root@localhost SPECS]# yum install desktop-file-utils

