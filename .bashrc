# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# Enable colors and change prompt:
PS1='\[\e[1;31m\][\[\e[1;33m\]\u\[\e[1;32m\]@\[\e[1;34m\]\h \[\e[1;35m\]\w\[\e[1;31m\]]\[\e[0m\]$ '
stty stop undef # Disable ctrl-s to freeze terminal.

# History in cache directory:
HISTSIZE=10000000
HISTFILESIZE=10000000
HISTFILE="${XDG_CACHE_HOME:-$HOME/.cache}/bash/history"
# Create cache directory if it doesn't exist
mkdir -p "${XDG_CACHE_HOME:-$HOME/.cache}/bash"

# History options (bash equivalents)
HISTCONTROL=ignoreboth:erasedups # Don't record duplicate entries and entries starting with space
shopt -s histappend              # Append to history file, don't overwrite
shopt -s histverify              # Show command before executing from history

# Enable auto cd (bash 4.0+)
shopt -s autocd 2>/dev/null

# Basic auto/tab complete:
# Enable programmable completion features
if ! shopt -oq posix; then
  if [ -f /usr/share/bash-completion/bash_completion ]; then
    . /usr/share/bash-completion/bash_completion
  elif [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
  fi
fi

# Include hidden files in completion
bind 'set match-hidden-files on'
bind 'set completion-ignore-case on'
bind 'set show-all-if-ambiguous on'

# vi mode
set -o vi
export KEYTIMEOUT=1

# Bash vi mode cursor shapes and key bindings
bind 'set keymap vi-insert'
bind '"\e[3~": delete-char'
bind '"\C-r": reverse-search-history'

# Edit line in vim with ctrl-e:
bind '"\C-e": edit-and-execute-command'

# Cursor shape for vi modes (bash doesn't have native support, using workaround)
function set_cursor_beam() { echo -ne '\e[5 q'; }
function set_cursor_block() { echo -ne '\e[1 q'; }

# Set beam cursor on startup
set_cursor_beam

# Hook for prompt to reset cursor
PROMPT_COMMAND="set_cursor_beam; $PROMPT_COMMAND"

# Load aliases and shortcuts if existent.
[ -f "${XDG_CONFIG_HOME:-$HOME/.config}/shell/shortcutrc" ] && source "${XDG_CONFIG_HOME:-$HOME/.config}/shell/shortcutrc"
[ -f "${XDG_CONFIG_HOME:-$HOME/.config}/shell/aliasrc" ] && source "${XDG_CONFIG_HOME:-$HOME/.config}/shell/aliasrc"
[ -f "${XDG_CONFIG_HOME:-$HOME/.config}/shell/zshnameddirrc" ] && source "${XDG_CONFIG_HOME:-$HOME/.config}/shell/zshnameddirrc"
