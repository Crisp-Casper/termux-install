#!/usr/bin/env bash
rm ${HOME}/searx -rf
rm $HOME/termux-install -rf
pkg clean
curl https://raw.githubusercontent.com/Crisp-Casper/termux-install/dev/install.sh | bash
