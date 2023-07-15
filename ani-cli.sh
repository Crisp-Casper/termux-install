#!/bin/bash

git clone https://github.com/pystardust/ani-cli.git
				cd ani-cli
				cp ./ani-cli $PREFIX/bin/ani-cli
				cd $HOME
				rm -rf ani-cli
