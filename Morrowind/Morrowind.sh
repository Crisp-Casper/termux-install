#!/usr/bin/env bash
git clone --depth 1 --filter=blob:none --no-checkout https://github.com/Crisp-Casper/termux-install
cd termux-install/
git checkout main Morrowind
cd Morrowind
7z x Open_Morrowind.zip.001
7z x Morrowind.zip.001
mv Open_Morrowind.apk ~/storage/downloads/Open_Morrowind.apk
mv Morrowind ~/storage/downloads/
cd ~
rm termux-install -rf
clear
figlet -w 50 -f script Morrowind is in your downloads!
exit
