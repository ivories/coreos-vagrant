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