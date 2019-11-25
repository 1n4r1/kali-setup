#! /bin/bash

cd

# updated for Linux kali 5.2.0-kali2-amd64

# checking permission
if [ ${EUID:-${UID}} != 0 ]; then
    echo 'exec as root user!'
    exit 1
fi

## initial setup
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
        ibus-anthy \
        telegram-desktop \
        gnome-screenshot \
        openvas \
        git \
        virtualbox \
        virtualbox-guest-x11 \
        virtualbox-ext-pack \
        vagrant \
        brasero \
        gobuster \
        seclists \
        wine32 \
        flake8 \
        python-pip

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
        alacarte \
        php-curl \
        gconf2 \
        gvfs-bin \
        pepperflashplugin-nonfree  # flash player

# install skype
wget https://repo.skype.com/latest/skypeforlinux-64.deb
dpkg -i skypeforlinux-64.deb
rm skypeforlinux-64.deb

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

## Other configurations
# set case ignore
cat << EOF > ~/.inputrc
set completion-ignore-case on
EOF

# git configuration
git config --global user.name "inar1"
git config --global core.editor vim

# console language
echo 'export LANG=en_US' >> ~/.bashrc

## Finishing setup
# remove unneed packages
apt autoremove -y

echo -e "\n\n===== Don't forget reboot!! ====="
