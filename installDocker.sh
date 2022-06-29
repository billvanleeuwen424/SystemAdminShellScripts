#! /bin/bash

# October 2021
# This is a script I've wrote after having to install Docker on a Pi more than once
# I'm sure there is an easier way, but this is what I have at this time

#update repositories,update apps
sudo apt update
sudo apt upgrade

#Next, install a few prerequisite packages which let apt use packages over HTTPS:
sudo apt install apt-transport-https ca-certificates curl software-properties-common

#docker GPG key
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -

#install docker
sudo apt install docker.io

#cache sudo privilieges for docker
sudo usermod -aG docker ${USER}
su - ${USER}
sudo gpasswd -a $USER docker
