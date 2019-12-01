#! /bin/bash

cd

# updated for Linux kali 5.3.0-kali2-amd64

# checking permission
if [ ${EUID:-${UID}} != 0 ]; then
    echo 'exec as root user!'
    exit 1
fi

## initial setup
# installing repositories
echo 'deb https://packagecloud.io/slacktechnologies/slack/debian/ jessie main' > /etc/apt/sources.list.d/slack.list
echo 'deb [arch=amd64] http://dl.google.com/linux/chrome/deb/ stable main' > /etc/apt/sources.list.d/google-chrome.list
echo 'deb [arch=amd64] https://repo.skype.com/deb stable main' > /etc/apt/sources.list.d/skype-stable.list

# upload packages information
dpkg --add-architecture i386
apt-get -y update
apt-get -y upgrade

# auto pass interactive installer
export DEBIAN_FRONTEND=noninteractive

## installing packages
# installing applications
apt-get -y install \
        task-japanese \
        task-japanese-desktop \
        telegram-desktop \
        gnome-screenshot \
        openvas \
        git \
        virtualbox \
        virtualbox-guest-x11 \
        vagrant \
        brasero \
        gobuster \
        seclists \
        wine32 \
        flake8 \
        python-pip \
        fcitx-mozc \
        slack-desktop \
        google-chrome-stable \
        skypeforlinux

# installing libraries
apt-get -y install \
        libelf-dev \
        gconf-service \
        gconf2-common \
        libgconf-2-4 \
        fontconfig-config \
        libappindicator1 \
        libappindicator3-1 \
        apt-transport-https \
        libsqlite3-dev \
        libncurses5-dev \
        php-curl \
        gconf2 \
        gvfs-bin \
        pepperflashplugin-nonfree  # flash player

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
apt-get -y remove chromium \
                  anthy

## Other configurations
# set case ignore
cat << EOF > ~/.inputrc
set completion-ignore-case on
EOF

# git configuration
git config --global user.name "inar1"
git config --global user.email inar1@protonmail.com
git config --global core.editor vim

## Finishing setup
# remove unneed packages
apt autoremove -y

echo -e "\n\n===== Don't forget reboot!! ====="
