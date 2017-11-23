wget https://raw.githubusercontent.com/ivories/coreos-vagrant/master/cinstall
wget https://raw.githubusercontent.com/ivories/coreos-vagrant/master/cloud-config.yaml
wget http://stable.release.core-os.net/amd64-usr/1298.6.0/coreos_production_image.bin.bz2
wget http://stable.release.core-os.net/amd64-usr/1298.6.0/coreos_production_image.bin.bz2.sig

chmod -R 777 cinstall

sudo mkdir /mnt/udisk
sudo cp -rfp * /mnt/udisk

sudo /mnt/udisk/cinstall
sudo reboot
