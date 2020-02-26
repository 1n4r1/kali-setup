#! /bin/bash

cd

# for 5.2.9-2kali1 (2019-08-22)

# checking permission
if [ ${EUID:-${UID}} != 0 ]; then
    echo 'exec as root user!'
    exit 1
fi

## initial setup
# upload packages information
dpkg --add-architecture i386
apt-get -y update

# auto pass interactive installer
export DEBIAN_FRONTEND=noninteractive

## installing packages
# installing applications
apt-get -y install \
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
        ibus-anthy

# audio configuration
apt-get -y install alsa-tools \
                   alsa-tools-gui \
                   alsa-utils \
                   alsa-oss \
                   alsamixergui \
                   libalsaplayer0 \
                   kmix \
                   pulseaudio \
                   gnome-core

## uninstalling packages
apt-get -y remove chromium

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
apt autoremove -y

echo -e "\n\n===== Don't forget reboot!! ====="
