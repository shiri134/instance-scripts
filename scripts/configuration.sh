#!/bin/bash
set -e

echo "  ----- install ruby and bundler -----  "
apt-get update
apt-get install -y ruby-full build-essential
gem install --no-rdoc --no-ri bundler

echo "  ----- install mongodb -----  "
apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv EA312927
echo "deb http://repo.mongodb.org/apt/ubuntu xenial/mongodb-org/3.2 multiverse" > /etc/apt/sources.list.d/mongodb-org-3.2.list
apt-get update
apt-get install -y mongodb-org

echo "  ----- start mongodb -----  "
systemctl start mongod
systemctl enable mongod

echo "  ----- copy unit file for application -----  "
wget https://gist.githubusercontent.com/shiri134/dae493bf389aeabc703b942f57fa3437/raw/398d12e0f91689b3acc22f7245040535c9ffc523/raddit.service
mv raddit.service /etc/systemd/system/raddit.service

