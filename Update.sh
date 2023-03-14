#!/usr/bin/env bash
git clone https://github.com/pystardust/ani-cli.git
cd ani-cli
cp ani-cli /data/data/com.termux/files/usr/bin/ani-cli
cd ..
rm -rf ani-cli
pkg upgrade -y
YOUTUBEDL_CONFIG_FOLDER="${HOME}/.config/yt-dlp/"
rm "${YOUTUBEDL_CONFIG_FOLDER}/config" -rf
curl -L https://raw.githubusercontent.com/Crisp-Casper/termux-install/main/.ytdl.conf >"${YOUTUBEDL_CONFIG_FOLDER}/config"
