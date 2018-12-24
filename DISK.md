# install core on disk

## 准备工作

### 制作启动U盘
* 下载 ultraiso : https://www.ezbsystems.com/ultraiso/download.htm
* 下载 coreos iso : https://stable.release.core-os.net/amd64-usr/current/coreos_production_iso_image.iso
* 双击 coreos iso , 自动运行 ultraiso , 点击菜单: 启动->写入硬盘映像->选择硬盘驱动为U盘->写入

### 复制四个文件进入U盘
* 下载 coreos cinstall : https://raw.githubusercontent.com/ivories/coreos-vagrant/master/cinstall
* 下载 coreos cinstall : https://raw.githubusercontent.com/ivories/coreos-vagrant/master/cloud-config.yaml
* 下载 coreos image : http://stable.release.core-os.net/amd64-usr/1298.6.0/coreos_production_image.bin.bz2
* 下载 coreos image.sig : http://stable.release.core-os.net/amd64-usr/1298.6.0/coreos_production_image.bin.bz2.sig
* cinstall cloud-config.yaml coreos_production_image.bin.bz2 coreos_production_image.bin.bz2.sig 四个文件复制到U盘

## 服务器要操作的内容

* 开机U盘启动,进入COREOS,输入以下命令

```
fdisk -l
```

* 上面的命令输入完,下面显示了我的U盘名字,对应的名字是/dev/sdb3
```
Device     Boot Start      End  Sectors  Size Id Type
/dev/sdb3  *      256 15730687 15730432  7.5G  b W95 FAT32
```

* 我要加载的U盘输入的命令就是 sudo mount -t vfat /dev/sdb3 /mnt/udisk
* 接下来是实际命令操作
```
sudo mkdir /mnt/udisk
sudo mount -t vfat /dev/sdb3 /mnt/udisk
cd /mnt/udisk
sudo ./cinstall
sudo reboot
```


# install on efi notebook

- I simply used the ubuntu-iso image (booted from usb) using the live-mode.
- following the instructions from https://coreos.com/os/docs/latest/installing-to-disk.html
- download https://raw.githubusercontent.com/coreos/init/master/bin/coreos-install
- installed gawk on ubuntu: sudo apt-get install gawk
- executed: coreos-install -d /dev/mmcblk1 -C alpha
- executed efibootmgr to add uefi boot-option: sudo efibootmgr --create --disk /dev/mmcblk1 --part 1 --label "COREOS" --loader \\EFI\\boot\\grub.efi
- rebooted into COREOS
