# install core on disk

## 准备工作
* 下载 ultraiso : https://www.ezbsystems.com/ultraiso/download.htm
* 下载 coreos iso : https://coreos.com/os/docs/latest/booting-with-iso.html
* 下载 coreos image : http://stable.release.core-os.net/amd64-usr/835.11.0/coreos_production_image.bin.bz2
* 下载 coreos image.sig : http://stable.release.core-os.net/amd64-usr/835.11.0/coreos_production_image.bin.bz2.sig
* 双击 coreos iso , 自动运行 ultraiso , 点击菜单: 启动->写入硬盘映像->选择硬盘驱动为U盘->写入
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
