#!/bin/bash
cp -a /etc/apt/sources.list /etc/apt/sources.list.bak
sed -i "s@http://.*archive.ubuntu.com@http://repo.huaweicloud.com@g" /etc/apt/sources.list
sed -i "s@http://.*security.ubuntu.com@http://repo.huaweicloud.com@g" /etc/apt/sources.list

apt-get update
apt-get -y install xz-utils 
apt-get -y install python3.8
apt-get -y install python3-pip
apt-get -y install make 
apt-get -y install gcc 
rm /usr/bin/python
ln -s python3.8 /usr/bin/python
apt-get install scons -y
pip3 install -r requirements.txt

tar -xvf gn.1523.tar -C ~/
tar -xvf ninja.1.9.0.tar -C ~/
tar -xvf gcc_riscv32-linux-7.3.0.tar.gz -C ~/
tar -xvf node-v14.15.1-linux-x64.tar.xz -C ~/

cat >>~/.bashrc<<EOF
export PATH=~/gn:~/gcc_riscv32/bin:~/ninja:$PATH
EOF

source ~/.bashrc
rm -rf /usr/bin/npm
rm -rf /usr/bin/node
rm -rf /usr/bin/hpm
ln -s ~/node-v14.15.1-linux-x64/bin/npm /usr/bin/
ln -s ~/node-v14.15.1-linux-x64/bin/node /usr/bin/
# npm config set registry https://registry.npm.taobao.org
npm config set registry https://repo.huaweicloud.com/repository/npm/

npm config set unsafe-perm true
npm install -g @ohos/hpm-cli
ln -s ~/node-v14.15.1-linux-x64/bin/hpm /usr/bin/


# hpm init -t default && hpm install @bearpi/bearpi_hm_nano && hpm dist
