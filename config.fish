set fish_greeting

set -U BROWSER firefox
set -U EDITOR vim
set -U PAGER less

set -U SVDIR ~/service

set -U XBPS_SRC_ROOT /home/robb/Repos/void-packages
set -U XBPS_SRC_DIR $XBPS_SRC_ROOT/hostdir/sources

## Really slows things down :/
nvm_load > /dev/stderr

fish_add_path /usr/local/bin/

if status is-interactive

	alias b=$BROWSER
	alias cls=clear
	alias dir=ls
	alias e=$EDITOR
	alias l=$PAGER
	alias ll='ls -lha --color'
	alias ls='ls -lF --color'

	abbr -ag v	vim
	abbr -ag s	source
end
