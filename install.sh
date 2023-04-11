#!/usr/bin/env bash
set -euo pipefail

BLUE='\e[34m'
NC='\e[0m'
YOUTUBEDL_OUTPUT_FOLDER="${HOME}/storage/shared/Youtube-DL"
YOUTUBEDL_CONFIG_FOLDER="${HOME}/.config/yt-dlp/"
TERMUXURLOPENER_CONFIG_FOLDER="${HOME}/bin/"


# Basic setup
curl https://raw.githubusercontent.com/Crisp-Casper/termux-install/main/updater.sh > updater.sh
chmod 777 updater.sh
bash updater.sh
rm updater.sh
pkg install python ffmpeg libxslt git ani-cli wget fzf aria2 python-pip rust p7zip figlet -y
git clone https://github.com/pystardust/ani-cli.git
cd ani-cli
cp ani-cli /data/data/com.termux/files/usr/bin/ani-cli
cd ..
rm -rf ani-cli
pip install yt-dlp spotdl setuptools wheel
cargo install genact
git clone --depth 1 --filter=blob:none --no-checkout https://github.com/Crisp-Casper/termux-install
cd termux-install/
git checkout main Spudify
cd Spudify
7z x Spudify.7z.001
mv Spudify.apk ~/storage/downloads/Spudify.apk
cd ~
rm termux-install -rf
sed -i 's/# shortcut/shortcut/g' ~/.termux/termux.properties
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
exit
