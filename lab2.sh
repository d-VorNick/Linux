#1


#2
sudo blkid /dev/sda3 > UUID_sda3

#3
mkfs.ext4 -b 4096 /dev/sda3

#4
dumpe2fs -h /dev/sda3

#5
tune2fs -i 2m -c 2 /dev/sda3

#6
mkdir /mnt/newdisk
mount -t ext4 /dev/sda3 /mnt/newdisk

#7
ln -s /mnt/newdisk $HOME/newdisk_slink

#8
mkdir $HOME/newdisk_slink/catalog

#9
sudo nano /etc/fstab
UUID=24c1ccbf-7de2-4573-abbf-edccfd3a7923 /mnt/newdisk ext4 noexec,noatime 0 0
sudo reboot

#10
umount /dev/sda3
reboot
resize2fs /dev/sda3
df -h

#11
fsck -n /dev/sda3

#12
fdisk /dev/sda
n
p
4
Default
+12Mib
w 
mkfs.ext4 /dev/sda4
umount /dev/sda3
mke2fs -O journal_dev /dev/sda4
mke2fs -O ^has_journal /dev/sda3
mke2fs -t ext4 -J device=/dev/sda4 /dev/sda3
##НЕ ЗАБЫТЬ ИЗМЕНИТЬ UUID В /etc/fstab
reboot
##ДЛЯ ПРОВЕРКИ tune2fs -l /dev/sda3 | grep features

#13
## удалить из файла /etc/fstab добавленную нами строку
umount /dev/sda3
umount /dev/sda4
fdisk /dev/sda
d
3
d
4
n
e
3
default
+500M
n
l
5
default
+100M
n
l
6
default
+100M

reboot
#14
pvcreate /dev/sda3 /dev/sda4
vgcreate vg01 /dev/sda3 /dev/sda4
lvcreate -L190 -n lv01 vg01
mkfs.ext4 /dev/vg01/lv01
mkdir /mnt/supernewdisk
mount /dev/vg01/lv01 /mnt/supernewdisk

#15
#создаем на хостовой машине папку lab2, открываем сетевой доступ к ней для всех пользователей
#Ip получаем командой ipconfig. Нужный нам ip находится в блоке Адаптер Ethernet Ethernet:
mkdir /mnt/share
sudo yum install cifs-utils
mount.cifs \\\\Ip\\lab2 /mnt/share -o user=vnikita2000@gmail.com password=********

#16
nano /etc/fstab
\\\\192.168.0.106\\lab2 /mnt/share cifs user=vnikita2000@gmail.com, password=*******, rw, iocharset=utf8 0 0
