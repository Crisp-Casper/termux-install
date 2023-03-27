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
alias upgrade='curl https://raw.githubusercontent.com/Crisp-Casper/termux-install/main/Update.sh | bash && bash ${PREFIX}/etc/bash.bashrc'
alias update='curl https://raw.githubusercontent.com/Crisp-Casper/termux-install/main/Update.sh | bash && bash ${PREFIX}/etc/bash.bashrc'
alias Upgrade='curl https://raw.githubusercontent.com/Crisp-Casper/termux-install/main/Update.sh | bash && bash ${PREFIX}/etc/bash.bashrc'
alias Update='curl https://raw.githubusercontent.com/Crisp-Casper/termux-install/main/Update.sh | bash && bash ${PREFIX}/etc/bash.bashrc'
alias work="sed -e 's/Youtube-DL/work/g' ~/.config/yt-dlp/config"
figlet -f script Browser Starting in 3
clear
sleep 5
figlet -f script Browser Starting in 2
clear
sleep 5
figlet -f script Browser Starting in 1
sleep 5
python searx/searx/webapp.py
exit
