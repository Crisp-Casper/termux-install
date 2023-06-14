#!/bin/bash

	while true ; do
#############
### Color ###
#############

black='\x1b[30m'
red='\x1b[31m'
green='\x1b[32m'
yellow='\x1b[33m'
blue='\x1b[34m'
magenta='\x1b[35m'
cyan='\x1b[36m'
white='\x1b[37m'

############
### Note ###
############

echo -e "${yellow}Keep in mind that at any point, you may press
the Enter key to display the available command list.${white}"

############
### Menu ###
############

MENU='Please enter your choice:		'

var=("Searx" "Anime" "Spotdl" "yt-dlp" "Genact" "Espeak" "TTY-Clock" "Games/Applications" "Update" "EXIT")
echo -e "${cyan}$MENU${green}"
	select opt in "${var[@]}" ; do
		case $opt in
			"Searx")
				clear
				if test -f $HOME/searx/searx/webapp.py ; then
				echo "Searx is installed"
				clear
				else
				git clone https://github.com/Crisp-Casper/searx.git
				pip install -r searx/requirements.txt
				fi
				clear
				echo -e "${red}"
				figlet -w 50 -f script Browser Starting in 3
				sleep 1
				clear
				echo -e "${yellow}"
				figlet -w 50 -f script Browser Starting in 2
				sleep 1
				clear
				echo -e "${green}"
				figlet -w 50 -f script Browser Starting in 1
				sleep 1
				clear
				python searx/searx/webapp.py
				echo -e "${green}"
				;;
			"Anime")
				clear
				if test -f $PREFIX/bin/ani-cli ; then
				echo "ani-cli installed"
				else
				cd $HOME
				git clone https://github.com/pystardust/ani-cli.git
				cd ani-cli
				cp ani-cli $PREFIX/bin/ani-cli
				cd $HOME
				rm -rf ani-cli
				fi
				clear
				echo -e "${cyan}$MENU${magenta}"
				avar=("Sub" "Dub")
					select lang in "${avar[@]}" ; do
						case $lang in
							"Sub")
								dub=""
								break
								;;
							"Dub")
								dub="--dub"
								break
								;;
							esac
						done
						clear
						echo -e "${cyan}$MENU${magenta}"
						bvar=("New Anime" "History" "Download" "Download From History" "Delete History" "Update" "Main Menu")
				select watch in "${bvar[@]}" ; do
					case $watch in
						"New Anime")
							clear
							echo -e "${cyan}Enter Anime Name:	${white}"
							read anime
							ani-cli $dub $anime
							clear
							echo -e "${magenta}Anime Menu"
							;;
						"History")
							clear
							echo -e "${green}One moment please..."
							ani-cli -c $dub
							clear
							echo -e "${magenta}Anime Menu"
							;;
						"Download")
							clear
							echo -e "${cyan}Enter Anime Name:	${white}"
							read anime
							clear
							echo -e "${green}One moment please..."
							ani-cli -d $dub $anime
							mv *.mp4 $HOME/storage/shared/Youtube-DL/
							clear
							echo -e "${magenta}Anime Menu"
							;;
						"Download From History")
							clear
							echo -e "${green}One moment please..."
							ani-cli -d -c $dub
							mv *.mp4 $HOME/storage/shared/Youtube-DL/
							clear
							echo -e "${magenta}Anime Menu"
							;;
						"Delete History")
							clear
							rm $HOME/.local/state/ani-cli -rf
							clear
							echo -e "${magenta}Anime Menu"
							;;
						"Update")
							rm $PREFIX/bin/ani-cli -rf
							git clone https://github.com/pystardust/ani-cli.git
							cd ani-cli
							cp ani-cli $PREFIX/bin/ani-cli
							cd $HOME
							rm -rf ani-cli
							clear
							echo "Anime Menu"
							;;
						"Main Menu")
							clear
							echo -e "{$green}Main Menu"
							break
							;;

						esac
					done ;;
			"Spotdl")
				clear
				rm $HOME/Music -rf
				mkdir $HOME/Music
				cd $HOME/Music
				echo -e "${green}Name the playlist folder"
				read dir
				clear
				mkdir "$dir"
				cd "$dir"
				echo -e "${green}Now paste your spotify link"
				read spotify
				spotdl $spotify | sed 's/?si.*//g'
				cd $HOME/Music
				rsync -r --info=progress2 --stats --remove-source-files "$dir" $HOME/storage/music
				cd $HOME/
				rm $HOME/Music -rf
				clear
				echo -e "${green}Main Menu"
				;;
			"yt-dlp")
				clear
				echo -e "${yellow}Paste the link to the websight containing a video file${white}"
				read yt
				yt-dlp $yt
				clear
				echo -e "${green}Main Menu"
				;;
			"Genact")
				clear
				if test -f $HOME/.cargo/bin/genact ; then
					echo -e "${white}"
					genact
					clear
					echo -e "${green}Main Menu"
				else
					git clone https://github.com/svenstaro/genact.git
					cd genact
					cargo install --path ./
					cd $HOME/
					rm genact -rf
					clear
					genact
					clear
					echo -e "${green}Main Menu"
				fi ;;
			"Espeak")
				clear
				sed -i 's/# volume-keys/volume-keys/g' $HOME/.termux/termux.properties
				termux-reload-settings
				echo -e "${cyan}$MENU${yellow}"
				options=("Talk" "Yell" "Quit")
				select opt in "${options[@]}" ; do
					case $opt in
						"Talk")
							clear
							read -p "You are now Talking:	" speak
							echo $speak | espeak -s 145
							clear
							echo "back to amplitude selection"
							;;
						"Yell")
							clear
							read -p "You are now Yelling:	" speak
							echo $speak | espeak -s 145 -a 200
							echo "back to amplitude selection"
							;;
						"Quit")
							clear
							break
							;;
					esac
				done
				sed -i 's/volume-keys/# volume-keys/g' $HOME/.termux/termux.properties

				termux-reload-settings
				echo -e "${green}Main Menu"
				;;
			"TTY-Clock")
				clear
				tty-clock -cstC 6
				echo -e "${green}Main Menu"
				;;
			"Games/Applications")
				clear
				echo -e "${cyan}$MENU${red}"
				cvar=("Spudify" "Pac-Man" "Morrowind" "Back")
				select down in "${cvar[@]}" ; do
					case $down in
						"Spudify")
							git clone --depth 1 --filter=blob:none --no-checkout https://github.com/Crisp-Casper/termux-install
							cd termux-install/
							git checkout main Spudify
							cd Spudify
							7z x Spudify.zip.001
							mv Spudify.apk $HOME/storage/downloads/Spudify.apk
							cd $HOME
							rm termux-install -rf
							clear
							echo -e "${green}Main Menu"
							break
							;;
						"Pac-Man")
							clear
							if test -f $PREFIX/bin/myman ; then
								echo -e "${white}"
								myman
								echo -e "${green}Main Menu"
							else
								pkg install myman -y
								clear
								echo -e "${white}"
								myman
								echo -e "${green}Main Menu"
							fi
							;;
						"Morrowind")
							clear
							echo -e "${cyan}$MENU${green}"
							dvar=("With Mods" "Without Mods" "Back")
							select mw in "${dvar[@]}" ; do
								case $mw in
									"With Mods")
										clear
										echo -e "${yellow}This will take a momment please be patient...${green}"
										sleep 5
										git clone --depth 1 --filter=blob:none --no-checkout https://github.com/Crisp-Casper/termux-install
										cd termux-install
										git checkout main Morrowind
										cd Morrowind
										7z x Open_Morrowind.zip.001
										7z x Morrowind.zip.001
										mkdir ~/storage/shared/omw
										rsync -r --info=progress2 --stats --remove-source-files Open_Morrowind.apk ~/storage/shared/omw/Open_Morrowind.apk
										rsync -r --info=progress2 --stats --remove-source-files Morrowind ~/storage/shared/omw/
										cd $HOME
										rm termux-install -rf
										clear
										echo -e "${yellow}Morrowind is in a folder called omw on your phone"
										echo -e "${red}Games/Applications Menu"
										break
										;;
									"Without Mods")
										clear
										echo -e "${yellow}This will take a momment please be patient...${green}"
										sleep 5
										git clone --depth 1 --filter=blob:none --no-checkout https://github.com/Crisp-Casper/termux-install
										cd termux-install
										git checkout main DMW
										cd DMW
										7z x Open_Morrowind.zip.001
										7z x Morrowind.zip.001
										mkdir ~/storage/shared/omw
										rsync -r --info=progress2 --stats --remove-source-files Open_Morrowind.apk ~/storage/shared/omw/Open_Morrowind.apk
										rsync -r --info=progress2 --stats --remove-source-files Morrowind ~/storage/shared/omw/
										cd $HOME
										rm termux-install -rf
										clear
										echo -e "${yellow}Morrowind is in a folder called omw on your phone"
										echo -e "${red}Games/Applications Menu"
										break
										;;
									"Back")
										echo -e "${red}Games/Applications Menu"
										break
										;;
								esac
							done ;;
						"Back")
							echo -e "${green}Main Menu"
							break
							;;

					esac
				done ;;
			"Update")
				curl https://raw.githubusercontent.com/Crisp-Casper/termux-install/main/Update.sh | bash
				exit
				;;
			"EXIT")
				exit
				;;
		esac
	done
done
