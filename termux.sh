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

var=("Searx" "Anime" "YouTube" "Spotdl" "yt-dlp" "Convert" "Genact" "Espeak" "TTY-Clock" "Games/Applications" "Update" "EXIT")
echo -e "${cyan}$MENU${green}"
	select opt in "${var[@]}" ; do
		case $opt in
			"Searx")
				clear
				if test -f $HOME/searx/searx/webapp.py ; then
				echo "Searx is installed"
				clear
				else
				export CFLAGS="-Wno-incompatible-function-pointer-types -Wno-implicit-function-declaration"
				git clone https://github.com/Crisp-Casper/searx.git
				pip install -r searx/requirements.txt
				fi
				clear
				#echo -e "${red}"
				#echo -efiglet -w 50 -f script Browser Starting in 3
				#echo -esleep 1
				#echo -eclear
				#echo -eecho -e "${yellow}"
				#echo -efiglet -w 50 -f script Browser Starting in 2
				#echo -esleep 1
				#echo -eclear
				#echo -eecho -e "${green}"
				#echo -efiglet -w 50 -f script Browser Starting in 1
				#echo -esleep 1
				#echo -eclear
				python searx/searx/webapp.py
				echo -e "${green}"
				;;
			"Anime")
				clear
				if test -f $PREFIX/bin/ani-cli ; then
				echo "ani-cli installed"
				else
				curl https://raw.githubusercontent.com/Crisp-Casper/termux-install/main/ani-cli.sh | bash
				yes | pkg install fzf aria2
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
							curl https://raw.githubusercontent.com/Crisp-Casper/termux-install/main/ani-cli.sh | bash
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
			"YouTube")
				clear
				if test -f $PREFIX/bin/ytfzf ; then
				echo "ytfzf installed"
				else
				yes | pkg install ytfzf chafa
				mkdir .config/ytfzf
				curl https://raw.githubusercontent.com/Crisp-Casper/termux-install/main/ytfzf > .config/ytfzf/conf.sh
				fi
				clear
				echo -e "${yellow}You MUST have the custom mpv from the Games/Applications menu! Open mpv, go to three dots top right->Settings->Advanced->Install/Update youtube-dl and select Install and choose yt-dlp"
				echo -e "${red}YouTube Menu"
				yvar=("Search" "Search History" "Watch History" "Subscriptions" "Add Subscriptions" "Delete History" "Delete Subscriptions" "Main Menu")
		select tube in "${yvar[@]}" ; do
			case $tube in
				"Search")
					clear
					echo -e "${magenta}Search:"
					read search
					ytfzf -T chafa -t $search
					clear
					;;
				"Search History")
					clear
					ytfzf -q
					clear
					;;
				"Watch History")
					clear
					ytfzf -H
					clear
					;;
				"Subscriptions")
					clear
					ytfzf -c youtube-subscriptions
					clear
					;;
				"Add Subscriptions")
					clear
					echo -e "${green}Enter link to channel:"
					read subscription
					ytfzf --channel-link="$subscription" >> .config/ytfzf/subscriptions
					clear
					;;
				"Delete History")
					clear
					[[ "$(read -e -p 'Continue? [y/N]> '; echo $REPLY)" == [Yy]* ]] && ytfzf -x || echo stopping
					clear
					;;
				"Delete Subscriptions")
					clear
					[[ "$(read -e -p 'Continue? [y/N]> '; echo $REPLY)" == [Yy]* ]] && rm .config/ytfzf/subscriptions || echo stopping
					clear
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
				if test -f $PREFIX/bin/spotdl ; then
				echo "spotdl installed"
				else
				pip install spotdl
				fi
				clear
				rm $HOME/Music -rf
				mkdir $HOME/Music
				cd $HOME/Music
				echo -e "${green}Name the playlist folder"
				read dir
				clear
				rsync -r --info=progress2 --stats $HOME/storage/music/$dir "$dir"
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
			"Convert")
				mkdir $HOME/storage/shared/Documents/Convert
				clear
				echo -e "${cyan}Put your file into Documents/Convert${magenta}"
				convar=("MP4" "MP3" "JPG" "PNG" "WAV" "Lower-Quality" "Back")
					select convert in ${convar[@]} ; do
						case $convert in
							"MP3")
								echo -e "${white}"
								ffmpeg -i $HOME/storage/shared/Documents/Convert/* $HOME/storage/shared/Documents/Convert/Output%d.$convert
								clear
								echo -e "${green}Done!"
								break
								;;
							"MP4")
								echo -e "${white}"
								ffmpeg -i $HOME/storage/shared/Documents/Convert/* $HOME/storage/shared/Documents/Convert/Output%d.$convert
								clear
								echo -e "${green}Done!"
								break
								;;
							"Lower-Quality")
								echo -e "${white}"
								ffmpeg -i $HOME/storage/shared/Documents/Convert/* -crf 28 $HOME/storage/shared/Documents/Convert/Output%d.mp4
								clear
								echo -e "${green}Done!"
								break
								;;
							"JPG")
								echo -e "${white}"
								ffmpeg -i $HOME/storage/shared/Documents/Convert/* $HOME/storage/shared/Documents/Convert/Output%d.$convert
								clear
								echo -e "${green}Done!"
								break
								;;
							"PNG")
								echo -e "${white}"
								ffmpeg -i $HOME/storage/shared/Documents/Convert/* $HOME/storage/shared/Documents/Convert/Output%d.$convert
								clear
								echo -e "${green}Done!"
								break
								;;
							"WAV")
								echo -e "${white}"
								ffmpeg -i $HOME/storage/shared/Documents/Convert/* $HOME/storage/shared/Documents/Convert/Output%d.$convert
								clear
								echo -e "${green}Done!"
								break
								;;
							"Back")
								clear
								echo -e "${green}Main Menu"
								break
								;;

						esac
					done ;;
			"Genact")
				clear
				if test -f $HOME/.cargo/bin/genact ; then
					echo -e "${white}"
					genact
					clear
					echo -e "${green}Main Menu"
				else
					yes | pkg install rust
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
				if test -f $PREFIX/bin/espeak ; then
				echo "espeak installed"
				else
				yes | pkg install espeak
				fi
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
				if test -f $PREFIX/bin/tty-clock ; then
				echo "tty-clock installed"
				else
				yes | pkg install tty-clock
				fi
				clear
				tty-clock -cstC 6
				echo -e "${green}Main Menu"
				;;
			"Games/Applications")
				clear
				echo -e "${cyan}$MENU${red}"
				cvar=("xManager" "nds4droid" "MPV" "Lucky-Patcher" "Pac-Man" "Morrowind" "Back")
				select down in "${cvar[@]}" ; do
					case $down in
						"xManager")
							git clone --depth 1 --filter=blob:none --no-checkout https://github.com/Crisp-Casper/termux-install
							cd termux-install/
							git checkout main xManager
							cd xManager
							mv xManager.apk $HOME/storage/downloads/xManager.apk
							cd $HOME
							rm termux-install -rf
							clear
							echo -e "${green}Main Menu"
							break
							;;
						"nds4droid")
							git clone --depth 1 --filter=blob:none --no-checkout https://github.com/Crisp-Casper/termux-install
							cd termux-install/
							git checkout main NDS
							cd NDS
							mv nds4droid.apk $HOME/storage/downloads/nds4droid.apk
							cd $HOME
							rm termux-install -rf
							clear
							echo -e "${green}Main Menu"
							break
							;;
						"MPV")
							git clone --depth 1 --filter=blob:none --no-checkout https://github.com/Crisp-Casper/termux-install
							cd termux-install/
							git checkout main MPV
							cd MPV
							mv mpv.apk $HOME/storage/downloads/mpv.apk
							cd $HOME
							rm termux-install -rf
							clear
							echo -e "${green}Main Menu"
							break
							;;
       						"Lucky-Patcher")
	     						git clone --depth 1 --filter=blob:none --no-checkout https://github.com/Crisp-Casper/termux-install
							cd termux-install/
							git checkout main Lucky-Patcher
							cd Lucky-Patcher
							mv LP_Downloader.apk $HOME/storage/downloads/Lucky-Patcher.apk
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
				uvar=("Normal" "Dev" "Back")
							select update in "${uvar[@]}" ; do
								case $update in
									"Normal")
										curl https://raw.githubusercontent.com/Crisp-Casper/termux-install/main/Update.sh | bash
										exit
										;;
									"Dev")
										curl https://raw.githubusercontent.com/Crisp-Casper/termux-install/main/UpdateDev.sh | bash
										exit
										;;
									"Back")
										break
										;;
							esac
						done ;;

			"EXIT")
				exit
				;;
		esac
	done
done
