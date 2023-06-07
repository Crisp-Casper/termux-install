#!/bin/bash

	while true ; do

############
### Note ###
############

echo "Keep in mind that at any point, you may press
the Enter key to display the available command list."

############
### Menu ###
############

MENU='Please enter your choice:		'

var=("Searx" "Anime" "Spotdl" "yt-dlp" "Genact" "Espeak" "TTY-Clock" "Download Center" "Update" "EXIT")
echo $MENU
	select opt in "${var[@]}" ; do
		case $opt in
			"Searx")
				clear
				figlet -w 50 -f script Browser Starting in 3
				sleep 1
				clear
				figlet -w 50 -f script Browser Starting in 2
				sleep 1
				clear
				figlet -w 50 -f script Browser Starting in 1
				sleep 1
				clear
				python searx/searx/webapp.py
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
				echo $MENU
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
						echo $MENU
						bvar=("New Anime" "History" "Download" "Download From History" "Delete History" "Update" "Main Menu")
				select watch in "${bvar[@]}" ; do
					case $watch in
						"New Anime")
							clear
							read anime
							ani-cli $dub $anime
							;;
						"History")
							clear
							ani-cli -c $dub
							;;
						"Download")
							clear
							ani-cli -d $dub
							;;
						"Download From History")
							clear
							ani-cli -d -c $dub
							;;
						"Delete History")
							clear
							rm $HOME/.local/state/ani-cli -rf
							;;
						"Update")
							rm $PREFIX/bin/ani-cli -rf
							git clone https://github.com/pystardust/ani-cli.git
							cd ani-cli
							cp ani-cli $PREFIX/bin/ani-cli
							cd $HOME
							rm -rf ani-cli
							;;
						"Main Menu")
							break
							;;

						esac
					done ;;
			"Spotdl")
				clear
				rm $HOME/Music -rf
				mkdir $HOME/Music
				cd $HOME/Music
				echo "Name the playlist folder"
				read dir
				clear
				mkdir $dir
				cd $dir
				echo "Now paste your spotify link"
				read spotify
				spotdl $spotify | sed 's/?si.*//g'
				cd $HOME/Music
				rsync -r --info=progress2 --stats --remove-source-files $dir $HOME/storage/music
				cd $HOME/
				rm $HOME/Music -rf
				clear
				echo Main Menu
				;;
			"yt-dlp")
				clear
				echo "Paste the link to the websight containing a video file"
				read yt
				yt-dlp $yt
				clear
				echo Main Menu
				;;
			"Genact")
				clear
				if test -f $HOME/.cargo/bin/genact ; then
					genact
					clear
					echo Main Menu
				else
					git clone https://github.com/svenstaro/genact.git
					cd genact
					cargo install --path ./
					cd $HOME/
					rm genact -rf
					clear
					genact
					clear
					echo Main Menu
				fi ;;
			"Espeak")
				clear
				sed -i 's/# volume-keys/volume-keys/g' $HOME/.termux/termux.properties
				termux-reload-settings
				echo $MENU
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
							echo Main Menu
							;;
					esac
				done
				sed -i 's/volume-keys/# volume-keys/g' $HOME/.termux/termux.properties

				termux-reload-settings
				;;
			"TTY-Clock")
				clear
				tty-clock -cstC 6
				;;
			"Download Center")
				clear
				echo $MENU
				cvar=("Spudify" "Morrowind" "Back")
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
							break
							echo Main Menu
							;;
						"Morrowind")
							clear
							echo $MENU
							dvar=("With Mods" "Without Mods" "Back")
							select mw in "${dvar[@]}" ; do
								case $mw in
									"With Mods")
										clear
										echo "This will take a momment please be patient..."
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
										echo "Morrowind is in a folder called omw on your phone"
										echo Main Menu
										;;
									"Without Mods")
										clear
										echo "This will take a momment please be patient..."
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
										echo "Morrowind is in a folder called omw on your phone"
										echo Main Menu
										;;
									"Back")
										break
										echo Download Center Menu
										;;
								esac
							done ;;
						"Back")
							break
							echo Main Menu
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
