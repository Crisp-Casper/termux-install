#!/usr/bin/env bash
git clone --depth 1 --filter=blob:none --no-checkout https://github.com/Crisp-Casper/termux-install
cd termux-install/
git checkout main Spudify
cd Spudify
7z x Spotify__Music_and_Podcasts_8.7.30.1221_v2.zip.001
mv Spotify__Music_and_Podcasts_8.7.30.1221_v2.apk ~/storage/downloads/Spotify.apk
rm ${HOME}/searx -rf
rm ~/termux-install -rf
curl https://raw.githubusercontent.com/Crisp-Casper/termux-install/main/install.sh | bash
