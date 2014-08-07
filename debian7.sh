#! /bin/bash

# update repo
sudo apt-get update

# common softwares
sudo apt-get -y -q install gcc g++ emacs23 git wget sshfs parallel python-setuptools

# fix sshfs permission issue
sudo chgrp fuse /dev/fuse
sudo chmod 660 /dev/fuse
sudo usermod -a -G fuse $USER

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
# make folders
mkdir sshfs
mkdir download
mkdir local
# download charniak parser biomedical model
wget http://bllip.cs.brown.edu/download/bioparsingmodel-rel1.tar.gz -O download/biomedical.tar.gz
tar -zxvf download/biomedical.tar.gz -C local/

# connect sshfs
sshfs leebird@68.80.91.56:/home/leebird/amazon/sshfs ~/sshfs