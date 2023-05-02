# Command history tweaks:
# - Append history instead of overwriting
#   when shell exits.
# - When using history substitution, do not
#   exec command immediately.
# - Do not save to history commands starting
#   with space.
# - Do not save duplicated commands.
shopt -s histappend
shopt -s histverify
export HISTCONTROL=ignoreboth
export PATH=$PATH:~/.cargo/bin/

# Default command line prompt.
PROMPT_DIRTRIM=2
PS1='\[\e[0;32m\]\w\[\e[0m\] \[\e[0;97m\]\$\[\e[0m\] '

# Handles nonexistent commands.
# If user has entered command which invokes non-available
# utility, command-not-found will give a package suggestions.
if [ -x /data/data/com.termux/files/usr/libexec/termux/command-not-found ]; then
command_not_found_handle() {
/data/data/com.termux/files/usr/libexec/termux/command-not-found "$1"
}
fi
clear
alias c=clear
alias e=exit
alias upgrade='curl https://raw.githubusercontent.com/Crisp-Casper/termux-install/main/Update.sh | bash && yes | pkg update && clear && bash ${PREFIX}/etc/bash.bashrc'
alias update='curl https://raw.githubusercontent.com/Crisp-Casper/termux-install/main/Update.sh | bash && yes | pkg update && clear && bash ${PREFIX}/etc/bash.bashrc'
alias Upgrade='curl https://raw.githubusercontent.com/Crisp-Casper/termux-install/main/Update.sh | bash && yes | pkg update && clear && bash ${PREFIX}/etc/bash.bashrc'
alias Update='curl https://raw.githubusercontent.com/Crisp-Casper/termux-install/main/Update.sh | bash && yes | pkg update && clear && bash ${PREFIX}/etc/bash.bashrc'
alias Morrowind='curl https://raw.githubusercontent.com/Crisp-Casper/termux-install/main/Morrowind/Morrowind.sh | bash'
alias morrowind='curl https://raw.githubusercontent.com/Crisp-Casper/termux-install/main/Morrowind/Morrowind.sh | bash'
alias omw='curl https://raw.githubusercontent.com/Crisp-Casper/termux-install/main/Morrowind/Morrowind.sh | bash'
alias mw='curl https://raw.githubusercontent.com/Crisp-Casper/termux-install/main/Morrowind/Morrowind.sh | bash'
alias dmw='curl https://raw.githubusercontent.com/Crisp-Casper/termux-install/main/DMW/Morrowind.sh | bash'
alias DMW='curl https://raw.githubusercontent.com/Crisp-Casper/termux-install/main/DMW/Morrowind.sh | bash'
alias Dmw='curl https://raw.githubusercontent.com/Crisp-Casper/termux-install/main/DMW/Morrowind.sh | bash'
alias work="sed -i 's/Youtube-DL/work/g' ~/.config/yt-dlp/config"
alias og="sed -i 's/work/Youtube-DL/g' ~/.config/yt-dlp/config"
figlet -w 50 -f script Browser Starting in 5
sleep 1
clear
figlet -w 50 -f script Browser Starting in 4
sleep 1
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
exit
