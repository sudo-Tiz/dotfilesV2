# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.config/zsh/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# Enable colors and change prompt:
autoload -Uz colors && colors	# Load colors
PS1="%B%{$fg[red]%}[%{$fg[yellow]%}%n%{$fg[green]%}@%{$fg[blue]%}%M %{$fg[magenta]%}%~%{$fg[red]%}]%{$reset_color%}$%b "

# History in cache directory:
HISTSIZE=1000000
SAVEHIST=1000000
HISTFILE="${XDG_CACHE_HOME:-$HOME/.cache}/zsh/history"
setopt SHARE_HISTORY # Share history across sessions
setopt HIST_IGNORE_DUPS # Avoid duplication in history

# Load aliases and shortcuts if existent.
[ -f "${XDG_CONFIG_HOME:-$HOME/.config}/shell/shortcutrc" ] && source "${XDG_CONFIG_HOME:-$HOME/.config}/shell/shortcutrc"
[ -f "${XDG_CONFIG_HOME:-$HOME/.config}/shell/aliasrc" ] && source "${XDG_CONFIG_HOME:-$HOME/.config}/shell/aliasrc"
[ -f "${XDG_CONFIG_HOME:-$HOME/.config}/shell/zshnameddirrc" ] && source "${XDG_CONFIG_HOME:-$HOME/.config}/shell/zshnameddirrc"

# Options
setopt CORRECT  # spell-check command names
setopt AUTO_CD # Automatically cd into typed directory.
setopt INTERACTIVE_COMMENTS # allow # comments in interactive shell
setopt EXTENDED_GLOB # enable #, ~, ^, ** patterns
setopt GLOB_DOTS # include dotfiles in glob expansion

# Basic auto/tab complete:
autoload -Uz compinit
zstyle ':completion:*' menu select
zmodload zsh/complist
compinit -d "${XDG_CACHE_HOME:-$HOME/.cache}/zsh/zcompdump"

# vi mode
bindkey -v
export KEYTIMEOUT=1

# Use vim keys in tab complete menu:
bindkey -M menuselect 'h' vi-backward-char
bindkey -M menuselect 'k' vi-up-line-or-history
bindkey -M menuselect 'l' vi-forward-char
bindkey -M menuselect 'j' vi-down-line-or-history
bindkey -v '^?' backward-delete-char

# Change cursor shape for different vi modes.
function zle-keymap-select () {
    case $KEYMAP in
        vicmd) echo -ne '\e[1 q';;      # block
        viins|main) echo -ne '\e[5 q';; # beam
    esac
}
zle -N zle-keymap-select
zle-line-init() {
    zle -K viins # initiate `vi insert` as keymap (can be removed if `bindkey -V` has been set elsewhere)
    echo -ne "\e[5 q"
}
zle -N zle-line-init
echo -ne '\e[5 q' # Use beam shape cursor on startup.
preexec() { echo -ne '\e[5 q' ;} # Use beam shape cursor for each new prompt.

# Yank and paste to/from the system clipboard
function vi-yank-wl-copy {
    zle vi-yank
   echo "$CUTBUFFER" | wl-copy
}
function vi-paste-wl-copy {
    LBUFFER+="$(wl-paste)"
    zle reset-prompt
}
zle -N vi-yank-wl-copy
zle -N vi-paste-wl-copy
bindkey -M vicmd 'y' vi-yank-wl-copy
bindkey -M vicmd 'p' vi-paste-wl-copy

# Add copy and paste using alt+C and alt+V
bindkey "^[v" vi-paste-wl-copy
bindkey -M vicmd "^[v" vi-paste-wl-copy
bindkey '^[c' vi-yank-wl-copy
bindkey -M vicmd '^[c' vi-yank-wl-copy

# Fzf 
if (( $+commands[fzf] )); then
  source <(fzf --zsh)
fi
fzf-cd-widget() {
  local dir
  dir=$(find . -type d 2>/dev/null | fzf) || return
  cd -- "$dir"
  zle reset-prompt
}
zle -N fzf-cd-widget
bindkey '^f' fzf-cd-widget




yazicwd() {
  local tmp cwd

  tmp="$(mktemp -t yazi-cwd.XXXXXX)" || return
  command yazi "$@" --cwd-file="$tmp"

  if cwd="$(cat -- "$tmp")" && [[ -n "$cwd" && "$cwd" != "$PWD" && -d "$cwd" ]]; then
    builtin cd -- "$cwd"
    zle reset-prompt 2>/dev/null
  fi

  rm -f -- "$tmp"
}
bindkey -s '^o' '^uyazicwd\n'




bindkey "^[[3~" delete-char
bindkey -M vicmd "^[[3~" delete-char
# bindkey -M vicmd '^[[P' vi-delete-char
# bindkey -M visual '^[[P' vi-delete

# Shift + Tab to accept autosuggest
bindkey '^[[Z' autosuggest-accept

# Edit line in vim with ctrl-e:
autoload -Uz edit-command-line; zle -N edit-command-line
bindkey '^e' edit-command-line
bindkey -M vicmd '^e' edit-command-line

# Load syntax highlighting
[[ ! -f /usr/share/zsh/plugins/fast-syntax-highlighting/fast-syntax-highlighting.plugin.zsh ]] || \
  source /usr/share/zsh/plugins/fast-syntax-highlighting/fast-syntax-highlighting.plugin.zsh
# Load autosuggestions
[[ ! -f /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.plugin.zsh ]] || \
  source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.plugin.zsh
# To customize prompt, run `p10k configure` or edit ~/.config/zsh/.p10k.zsh.
[[ ! -f /usr/share/zsh-theme-powerlevel10k/powerlevel10k.zsh-theme ]] || \
  source /usr/share/zsh-theme-powerlevel10k/powerlevel10k.zsh-theme
[[ ! -f ~/.config/zsh/.p10k.zsh ]] || \
  source ~/.config/zsh/.p10k.zsh
