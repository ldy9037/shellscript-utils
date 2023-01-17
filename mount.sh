#!/bin/bash

# ex)
# sh ./mount.sh sdb /mnt/dir

# Disk mount 용 shellscript 
sudo mkfs.ext4 -m 0 -E lazy_itable_init=0,lazy_journal_init=0,discard /dev/$1
sudo mkdir -p $2
sudo mount -o discard,defaults /dev/$1 $2
sudo chmod a+w $2
sudo cp /etc/fstab /etc/fstab.backup

echo "`sudo blkid /dev/sdb | awk -F ' ' '{print $2}' | sed 's/\"//g'` `$2` ext4 discard,defaults,nofail 0 2" | sudo tee -a /etc/fstab