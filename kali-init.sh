#! /bin/bash

cd

# for 5.2.9-2kali1 (2019-08-22)

## initial setup
# upload packages information
sudo dpkg --add-architecture i386
sudo apt-get -y update

# auto pass interactive installer
sudo export DEBIAN_FRONTEND=noninteractive

## installing packages
# installing applications
sudo apt-get -y install \
        telegram-desktop \
        gnome-screenshot \
        openvas \
        virtualbox \
        virtualbox-guest-x11 \
        vagrant \
        brasero \
        gobuster \
        seclists \
        wine32 \
        flake8 \
        python-pip \
        ibus-anthy \
        shellcheck

## uninstalling packages
sudo apt-get -y remove chromium

## Other configurations
# set case ignore
cat << EOF > ~/.inputrc
set completion-ignore-case on
EOF

# git configuration
git config --global user.name "inar1"
git config --global user.email inar1@protonmail.com
git config --global core.editor vim

# setup aliases
echo "alias vim='vim -b'" > ~/.bash_aliases

# update bash configuration
. ~/.bashrc


## Finishing setup
# remove unneed packages
sudo apt autoremove -y

echo -e "\n\n===== Don't forget reboot!! ====="
