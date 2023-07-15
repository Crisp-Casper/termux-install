#!/usr/bin/env bash
set -euo pipefail

BLUE='\e[34m'
NC='\e[0m'
YOUTUBEDL_OUTPUT_FOLDER="${HOME}/storage/shared/Youtube-DL"
YOUTUBEDL_CONFIG_FOLDER="${HOME}/.config/yt-dlp/"
TERMUXURLOPENER_CONFIG_FOLDER="${HOME}/bin/"


# Basic setup
curl https://raw.githubusercontent.com/Crisp-Casper/termux-install/main/termux.sh > termux.sh
chmod 777 termux.sh
curl https://raw.githubusercontent.com/Crisp-Casper/termux-install/main/updater.sh > updater.sh
chmod 777 updater.sh
bash updater.sh
rm updater.sh
pkg install python ffmpeg libxslt git wget fzf aria2 python-pip rust p7zip binutils figlet espeak rsync tty-clock myman -y
pip install spotdl setuptools wheel
python3 -m pip install --force-reinstall https://github.com/yt-dlp/yt-dlp/archive/master.tar.gz
sed -i 's/# shortcut/shortcut/g' ~/.termux/termux.properties
mkdir -p $YOUTUBEDL_OUTPUT_FOLDER
mkdir -p $YOUTUBEDL_CONFIG_FOLDER
mkdir -p $TERMUXURLOPENER_CONFIG_FOLDER
# Download setup & config file
curl -L https://raw.githubusercontent.com/Crisp-Casper/termux-install/main/.ytdl.conf >"${YOUTUBEDL_CONFIG_FOLDER}/config"
curl -L https://raw.githubusercontent.com/Crisp-Casper/termux-install/main/sponsorblock.conf >"${YOUTUBEDL_CONFIG_FOLDER}/sponsorblock.conf"
curl -L https://raw.githubusercontent.com/Crisp-Casper/termux-install/main/share2youtubedl.sh >"${TERMUXURLOPENER_CONFIG_FOLDER}/termux-url-opener"
echo -e "${BLUE}"
curl https://raw.githubusercontent.com/Crisp-Casper/termux-install/main/bash.bashrc >${PREFIX}/etc/bash.bashrc
exit
