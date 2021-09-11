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
/dev/sda3 /mnt/newdisk ext4 noexec,noatime 0 0
