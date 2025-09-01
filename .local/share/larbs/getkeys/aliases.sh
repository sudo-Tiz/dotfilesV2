cac ${XDG_CACHE_HOME:-$HOME/.cache}
cf  ${XDG_CONFIG_HOME:-$HOME/.config}
dt  ${XDG_DATA_HOME:-$HOME/.local/share}
sc  $HOME/.local/bin
src $HOME/.local/src

h   $HOME
mn  /mnt
D   ${XDG_DOWNLOAD_DIR:-$HOME/Downloads}
d   ${XDG_DOCUMENTS_DIR:-$HOME/documents}

m   /media/HDD/$USER
pp  $HOME/documents/progra
S   $HOME/space
# These files automatically update when edited/saved in vim:

# keys	filename				description
bf	${XDG_CONFIG_HOME:-$HOME/.config}/shell/bm-files	# This file, a list of bookmarked files
bd	${XDG_CONFIG_HOME:-$HOME/.config}/shell/bm-dirs		# A list of bookmarked directories similar to this file
cfx	${XDG_CONFIG_HOME:-$HOME/.config}/x11/xresources	# Colors, themes and variables for X11
cfb	~/.local/src/dwmblocks/config.h				# dwmblocks: the status bar for dwm


# These do not update automatically, but on the next new instance of a program:

cfv	${XDG_CONFIG_HOME:-$HOME/.config}/nvim/lua/config/options.lua # vim/neovim config
cfz	$ZDOTDIR/.zshrc						# zsh (shell) config
cfa	${XDG_CONFIG_HOME:-$HOME/.config}/shell/aliasrc		# aliases used by zsh (and potentially other shells)
cfp	${XDG_CONFIG_HOME:-$HOME/.config}/shell/profile		# profile file for login settings for zsh
cfm	${XDG_CONFIG_HOME:-$HOME/.config}/mutt/muttrc		# mutt (email client) config
cfn	${XDG_CONFIG_HOME:-$HOME/.config}/newsboat/config	# newsboat (RSS reader)
cfu	${XDG_CONFIG_HOME:-$HOME/.config}/newsboat/urls		# RSS urls for newsboat
cfmb	${XDG_CONFIG_HOME:-$HOME/.config}/ncmpcpp/bindings	# ncmpcpp (music player) keybinds file
cfmc	${XDG_CONFIG_HOME:-$HOME/.config}/ncmpcpp/config	# ncmpcpp (music player) config
cfl	${XDG_CONFIG_HOME:-$HOME/.config}/lf/lfrc		# lf (file browser) config
cfL	${XDG_CONFIG_HOME:-$HOME/.config}/lf/scope		# lf's scope/preview file
cfX	${XDG_CONFIG_HOME:-$HOME/.config}/nsxiv/exec/key-handler	# nsxiv (image viewer) key/script handler
#!/bin/sh

# Use neovim for vim if present.
[ -x "$(command -v nvim)" ] && alias vim="nvim" vimdiff="nvim -d"

# Use $XINITRC variable if file exists.
[ -f "$XINITRC" ] && alias startx="startx $XINITRC"

[ -f "$MBSYNCRC" ] && alias mbsync="mbsync -c $MBSYNCRC"

# sudo not required for some system commands
for command in mount umount sv updatedb su shutdown poweroff reboot isw; do
	alias $command="sudo $command"
done; unset command

se() {
	cd ~/.local/bin
	$EDITOR $(fzf)
}

# Verbosity and settings that you pretty much just always are going to want.
alias \
	cp="cp -ivr" \
	mv="mv -iv" \
	rm="rm -vIrf" \
	bc="bc -ql" \
	mkd="mkdir -pv" \
	yt="yt-dlp --embed-metadata -i" \
	yta="yt -x -f bestaudio/best" \
	ffmpeg="ffmpeg -hide_banner"

# Colorize commands when possible.
alias \
	ls="ls -hN --color=auto --group-directories-first" \
	grep="grep --color=auto" \
	diff="diff --color=auto" \
	cat="bat --paging=never -pp" \
  bless="bat -p --pager 'less -RF'" \
	ip="ip -color=auto"

# LS
alias \
	l="exa --group-directories-first --sort extension --group" \
	ll="l -l" \
	la="l -aF" \
	lla="l -laF"
#lt="exa -T" \
#llt="exa -Tl \

# CD
alias \
	...="cd ../.." \
	....="cd ../../.." \
	.....="cd ../../../.."

# These common commands are just too long! Abbreviate them.
alias \
	ka="killall" \
	trem="transmission-remote" \
	YT="youtube-viewer" \
	sdn="shutdown -h now" \
	v="$EDITOR" \
	svim="sudo vim" \
	p="pacman" \
	sp="sudo pacman" \
	z="zathura" \
	sysup='sudo systemctl enable --now' \
	sysdn='sudo systemctl disable --now'
  bak() {mv "$1" "$1.bak"}
  mdtemp() {cd $(mktemp -d)}
# Correction for script using old commands
alias \
	egrep="grep -E"

alias \
	lf="lfub" \
	magit="nvim -c MagitOnly" \
	ref="shortcuts >/dev/null; source ${XDG_CONFIG_HOME:-$HOME/.config}/shell/shortcutrc ; source ${XDG_CONFIG_HOME:-$HOME/.config}/shell/zshnameddirrc" \
	weath="less -S ${XDG_CACHE_HOME:-$HOME/.cache}/weatherreport" \
	ee='exit' \
	tree='tree -CAhF --dirsfirst' \
	grepr='grep -iIHrn' \
  fd="fd -Hi"

# DOCKER
alias \
	doc='sudo /bin/docker' \
	doco='sudo /bin/docker-compose' \
	rmdoc='sudo /bin/docker rm -f $(/bin/docker ps -a -q)'

# GIT
alias \
	g="git" \
	gd="git diff" \
	gcl='git clone' \
	gull='git pull' \
	gush='git push' \
	gco='git commit -m' \
	ga='git add' \
	gr='git restore' \
	grs='git restore --staged' \
	greset1='git reset --hard HEAD~1' \
	gusho='git push -f origin' \
	gst='git status' \
  gl='git log' \
  gch="git checkout" \
  gchb="git checkout -b" \
  gls='l --group-directories-first --color=auto -d $(git ls-tree $(git branch | grep \* | cut -d " " -f2) --name-only)' \
  gll='l --group-directories-first --color=auto -d $(git ls-tree -r $(git branch | grep \* | cut -d " " -f2) --name-only)'
  gdi() {git diff --name-only --relative --diff-filter=d | xargs bat --diff}




# VENV
alias \
	ve='python -m venv .env' \
	va='source ./.env/bin/activate || source ./env/bin/activate' \
	veva='python -m venv .env && source ./.env/bin/activate' \
	da='deactivate'

# XRANDR
alias \
	xrandrright="xrandr --output $(xrandr | grep "connected primary" | awk '{print $1}') --rotate right" \
	xrandrnormal="xrandr --output $(xrandr | grep "connected primary" | awk '{print $1}') --rotate normal" \
	xrandrleft="xrandr --output $(xrandr | grep "connected primary" | awk '{print $1}') --rotate left" \
	xrandrinverted="xrandr --output $(xrandr | grep "connected primary" | awk '{print $1}') --rotate inverted" \
	xrandr120="xrandr --output $(xrandr | grep "connected primary" | awk '{print $1}') --mode 1920x1080 --rate 120" \
	xrandr48="xrandr --output $(xrandr | grep "connected primary" | awk '{print $1}') --mode 1920x1080 --rate 48"

# Copy progress bar
alias \
	cpv='rsync -ah --info=progress2' \
	mvv='rsync -ah --remove-source-files --info=progress2'

# Micro to speaker
alias \
	micON='pactl load-module module-loopback latency_msec=1' \
	micOFF='pactl unload-module module-loopback'

# PDF to JPG (need imagemagick)
pdftojpg() {
	[ $# = 1 ] && convert -density 150 "$1" -quality 90 "$(echo $1 | sed s/.pdf/%03d.jpg/g)" || echo ERROR
}

# Cheatsheet for linux commands
ch() { curl "http://cheat.sh/$@"; }

# RUN THE COMMAND FROM HISTORY, USING FZF AS SELECTOR, ALTERNATIVE TO <C-R>
hf() {
	cmd=$(history 0 | sort -nr | cut -c 8- | fzf -e --select-1 --no-sort --query "$1")
	# push the command into the history
	print -S $cmd
	eval $cmd
}

# LIST PATHS OF OTHER ZSH SHELLS I HAVE OPEN
lssh() {
	ps au |
		awk '$11 == "-zsh" || $11 == "/bin/zsh" { print $2 }' |
		xargs pwdx |
		awk '{ print $2 }' |
		sed -n "\|^${2}.*|p" |
		sort -u |
		nl
}
# CD TO SHELL NUMBER RETURNED BY LSSH
cdsh() {cd $(lssh | sed "$1!d" | cut -f 2)}
# CD TO PATH OF ANOTHER SHELL, USING FZF AS SELECTOR
cs() {
	cmd1=$(lssh | fzf --select-1 --query "$1" --height=~50 | cut -f 2)
	cmd="cd $cmd1"
	print -S $cmd
	eval $cmd
}
