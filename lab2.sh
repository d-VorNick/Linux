#1


#2
sudo blkid /dev/sda3 > UUID_sda3

#3
mkfs.ext4 -b 4096 /dev/sda3

#4
dumpe2fs -h /dev/sda3

#5
tune2fs -i 2m -C 2 /dev/sda3

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
mkfs.ext4 /dev/sda4
umount /dev/sda3
mke2fs -O journal_dev /dev/sda4
mke2fs -O ^has_journal /dev/sda3
mke2fs -t ext4 -J device=/dev/sda4 /dev/sda3
##НЕ ЗАБЫТЬ ИЗМЕНИТЬ UUID В /etc/fstab
reboot
##ДЛЯ ПРОВЕРКИ tune2fs -l /dev/sda3 | grep features
