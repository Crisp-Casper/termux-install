#!/usr/bin/env bash
set -euo pipefail

BLUE='\e[34m'
NC='\e[0m'
YOUTUBEDL_OUTPUT_FOLDER="${HOME}/storage/shared/Youtube-DL"
YOUTUBEDL_CONFIG_FOLDER="${HOME}/.config/yt-dlp/"
TERMUXURLOPENER_CONFIG_FOLDER="${HOME}/bin/"

echo "Hi, This script setup an environment to download various videos from various apps"
sleep 1
echo -e "\n\n${BLUE}Requirements :"
echo -e "${NC}    1. Allow storage access to Termux"
echo -e "${NC}    2. A working internet connection.\n\n"
read -p "When you are ready just press enter:"

# Basic setup
termux-setup-storage
sleep 5
rm /data/data/com.termux/files/usr/etc/tls/openssl.cnf
rm /data/data/com.termux/files/usr/etc/motd
rm /data/data/com.termux/files/usr/etc/motd-playstore
rm /data/data/com.termux/files/usr/etc/profile.d/init-termux-properties.sh
rm /data/data/com.termux/files/usr/etc/bash.bashrc
pkg upgrade -y
pkg install python ffmpeg libxslt git ani-cli wget fzf aria2 python-pip rust p7zip -y
git clone https://github.com/pystardust/ani-cli.git
cd ani-cli
cp ani-cli /data/data/com.termux/files/usr/bin/ani-cli
cd ..
rm -rf ani-cli
pip install yt-dlp spotdl setuptools wheel
cargo install genact
git clone --depth 1 --filter=blob:none --no-checkout https://github.com/Crisp-Casper/termux-install
cd termux-install/
git checkout main Spotify
cd Spotify
7z x Spotify.7z.001
mv Spotify_*.apk ~/storage/downloads/Spotify.apk
cd ~
rm termux-install -rf
mkdir -p $YOUTUBEDL_OUTPUT_FOLDER
mkdir -p $YOUTUBEDL_CONFIG_FOLDER
mkdir -p $TERMUXURLOPENER_CONFIG_FOLDER
# Download setup & config file
curl -L https://raw.githubusercontent.com/Crisp-Casper/termux-install/main/.ytdl.conf >"${YOUTUBEDL_CONFIG_FOLDER}/config"
curl -L https://raw.githubusercontent.com/Crisp-Casper/termux-install/main/sponsorblock.conf >"${YOUTUBEDL_CONFIG_FOLDER}/sponsorblock.conf"
curl -L https://raw.githubusercontent.com/Crisp-Casper/termux-install/main/share2youtubedl.sh >"${TERMUXURLOPENER_CONFIG_FOLDER}/termux-url-opener"

echo -e "${BLUE}now onto searx!!!\n\n"
git clone https://github.com/Crisp-Casper/searx.git
pip install -r searx/requirements.txt
curl https://raw.githubusercontent.com/Crisp-Casper/termux-install/main/bash.bashrc >${PREFIX}/etc/bash.bashrc
clear
echo Done!
exit
