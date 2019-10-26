#! /bin/bash

cd

# updated for kali linux 2018.4 

if [ ${EUID:-${UID}} != 0 ]; then
    echo 'exec as root user!'
    exit 1
fi

# upload packages
dpkg --add-architecture i386
apt-get -y update
apt-get -y upgrade

# install packages
export DEBIAN_FRONTEND=noninteractive
apt-get -y install \
        libelf-dev \
        gconf-service \
        gconf2-common \
        libgconf-2-4 \ 
        fontconfig-config \
        task-japanese \
        task-japanese-desktop \
        ibus-anthy \
        libappindicator1 \
        libappindicator3-1 \
        git \
        apt-transport-https \
        openvas \
        virtualbox \
        virtualbox-guest-x11 \
        virtualbox-ext-pack \
        vagrant \
        packer \
        libsqlite3-dev \
        libncurses5-dev \
        alacarte \
        brasero \
        gobuster \
        flake8 \
        php-curl \
        seclists \
        wine32 \
        dbeaver \
        gconf2 \
        gvfs-bin \
        telegram-desktop \
        gnome-screenshot \
        pepperflashplugin-nonfree  # flash player

# install skype
curl https://repo.skype.com/data/SKYPE-GPG-KEY | sudo apt-key add - 
wget https://repo.skype.com/latest/skypeforlinux-64.deb
dpkg -i skypeforlinux-64.deb
rm skypeforlinux-64.deb

# set case ignore
cat << EOF > ~/.inputrc
set completion-ignore-case on
EOF

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
# remove unneed packages
apt autoremove -y

# install python modules
pip install pyinstaller

# git configuration
git config --global user.name "inar1"
git config --global user.email "inar1@protonmail.com"
