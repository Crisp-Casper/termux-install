#!/usr/bin/env bash
git clone --depth 1 --filter=blob:none --no-checkout https://github.com/Crisp-Casper/termux-install
cd termux-install/
git checkout main Morrowind
cd Morrowind
7z x Open_Morrowind.zip.001
7z x Morrowind.zip.001
mkdir ~/storage/shared/omw
rsync -r --info=progress2 --stats --remove-source-files Open_Morrowind.apk ~/storage/shared/omw/Open_Morrowind.apk
rsync -r --info=progress2 --stats --remove-source-files Morrowind ~/storage/shared/omw/
cd ~
rm termux-install -rf
clear
echo Morrowind is in a folder called omw!
exit
