## install coreos

```
sudo mkdir -p /data0/
cd /data0/
mkdir data
git clone https://github.com/ivories/coreos-vagrant.git coreos
cd coreos
```
## first run
####if Virtual box:
```
vagrant up
```

####if VMware Fusion:
```
vagrant plugin install vagrant-vmware-fusion
vagrant up --provider vmware_fusion
```

####if VMware Workstation:
```
vagrant plugin install vagrant-vmware-workstation
vagrant up --provider vmware_workstation
```

####ssh coreos
```
vagrant ssh
```

## suspend coreos

You must edit /data0/coreos/coreclose.sh first

change your login username

su - YourLoginUsername -c "export PATH=\"/Applications/VirtualBox.app/Contents/MacOS:$PATH\" && cd /data0/coreos-vagrant && /usr/local/bin/vagrant suspend"

example:

su - ivories -c "export PATH=\"/Applications/VirtualBox.app/Contents/MacOS:$PATH\" && cd /data0/coreos-vagrant && /usr/local/bin/vagrant suspend"

```
sudo defaults write com.apple.loginwindow LogoutHook /data0/coreos/coreclose.sh

```

## resume coreos

```
cp -rfp /data0/coreos/coreopen.sh /usr/local/bin/web
web
```

## ERROR handle

1) VM must be created before running this command. Run `vagrant up` first.

!!!do not run vagrant up. you will destroy your old image.

You must backup ~/VirtualBox\ VMs/  old vbox file
When you vagrant up new virtual box then copy the old file to new file

2) Error response from daemon: Cannot start container 51a467bd304689d86fed163f59731dc873c97858bc28674996be076be5b0b6b3: iptables failed: iptables --wait -t nat -A DOCKER -p tcp -d 0/0 --dport 9003 -j DNAT --to-destination 172.18.0.195:9003 ! -i docker0: iptables: No chain/target/match by that name.

This error will happen in reboot or vagrant up. I didn't find the right solution, so i shutdown the coreos and reboot again.