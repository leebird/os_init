#! /bin/bash

# make folders
mkdir sshfs
mkdir download
mkdir local

# update repo
sudo apt-get update

# common softwares
sudo apt-get -y -q install gcc g++ emacs23 git wget sshfs parallel python-setuptools htop screen swig

# pip
sudo easy_install pip

## nltk
sudo pip install -U nltk
# download sentence splitter punkt
python -m nltk.downloader punkt

## charniak parser
# dependency
sudo apt-get -y -q install python-twisted-web python2.7-dev
#parser
sudo pip install bllipparser

# download charniak parser biomedical model
wget http://bllip.cs.brown.edu/download/bioparsingmodel-rel1.tar.gz -O download/biomedical.tar.gz
tar -zxvf download/biomedical.tar.gz -C local/

# java 7
sudo su -
echo "deb http://ppa.launchpad.net/webupd8team/java/ubuntu precise main" | tee /etc/apt/sources.list.d/webupd8team-java.list
echo "deb-src http://ppa.launchpad.net/webupd8team/java/ubuntu precise main" | tee -a /etc/apt/sources.list.d/webupd8team-java.list
apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys EEA14886
apt-get update
apt-get install oracle-java7-installer

# fix sshfs permission issue
sudo chgrp fuse /dev/fuse
sudo chmod 660 /dev/fuse
sudo usermod -a -G fuse $USER

# connect sshfs
sshfs leebird@68.80.91.56:/home/leebird/amazon/sshfs ~/sshfs