#! /bin/bash
su - YouUserName -c "export PATH=\"/Applications/VirtualBox.app/Contents/MacOS:$PATH\" && cd /data0/coreos && /usr/local/bin/vagrant suspend"
