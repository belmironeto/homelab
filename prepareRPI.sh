#!/bin/bash

# Prepare Color Output
RED='\033[0;31m'
ENDCOLOR='\033[0m'
GREEN='\033[1;32m'
GRAY='\033[0;37m'

declare -a snapPackages=("terraform" "kubectl")
generalPackages="vim mlocate git"

function snapInstallPackages () {
  for package in $snapPackages
  do
    echo -e "${GREEN}...::::|| Installing $package ||::::...${ENDCOLOR}"
    sudo snap install $package --classic
  done
}
function installSnap () {
  echo -e "${GRAY}...::::|| Checking pre-requisites ||::::...${ENDCOLOR}"
  dpkg -s snapd
  if [ $? -eq 0 ]; then
    echo -e "${GREEN}...::::|| Installing SNAP Core ||::::...${ENDCOLOR}"
    sudo snap install core
  else
    echo -e "${RED}...::::|| Need to Install SNAP and Reboot ||::::...${ENDCOLOR}"
    sudo apt install snapd -y
    read -p "Snap Installed. Can I reboot now? " -n 1 -r
    if [[ $REPLY =~ ^[Yy]$ ]]; then
      sudo reboot now
    else
      echo -e "${RED}...::::|| Reboot and Continue later ||::::...${ENDCOLOR}"
    fi
  fi
}

function installGeneral () {
  echo -e "${GREEN}...::::|| Installing General Packages ||::::...${ENDCOLOR}"
  sudo apt install -y $generalPackages
  if [[ $? -eq 0 ]]; then
    echo -e "${GREEN}...::::|| Updating mLocate DB ||::::...${ENDCOLOR}"
    sudo updatedb
  fi
}

function prepareGit () {
  git config --global user.name "Belmiro Neto"
  git config --global user.email belmiro.neto@live.com
}

function installArgo () {
  echo -e "${GREEN}...::::|| Installing ArgoCli ||::::...${ENDCOLOR}"
  curl -sSL -o argocd-linux-arm64 https://github.com/argoproj/argo-cd/releases/latest/download/argocd-linux-arm64
  sudo install -m 555 argocd-linux-arm64 /usr/local/bin/argocd
  rm argocd-linux-arm64
}

function installAnsible () {
  echo -e "${GREEN}...::::|| Installing Ansible ||::::...${ENDCOLOR}"
  sudo apt install software-properties-common
  sudo apt-key adv --keyserver keyserver.ubuntu.com --recv-keys 93C4A3FD7BB9C367
  sudo echo "deb [arch=armhf] http://ppa.launchpad.net/ansible/ansible/ubuntu focal main" > /etc/apt/sources.list.d/ansible.list
  sudo apt install ansible -y
}

function execAll() {
  installGeneral
  installSnap
  snapInstallPackages
  installAnsible
  installArgo
  prepareGit
}

execAll
