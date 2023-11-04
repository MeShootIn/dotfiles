# Enable Powerlevel10k instant prompt. Should stay close to the top of $HOME/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# If you come from bash you might have to change your $PATH.
export PATH="${HOME}/bin":"/usr/local/bin":$PATH
export PATH=$PATH:"/c/portable/ClamAV-x64":"/c/Program Files/AutoHotkey"
export PATH=$PATH:"${HOME}/AppData/Local/Yarn/bin"
export PATH=$PATH:"/c/Users/dmitr/layout_switch"
export PATH=$PATH:"/c/Program Files/Okular/bin"

# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME="powerlevel10k/powerlevel10k"

# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in $ZSH/themes/
# If set to an empty array, this variable will have no effect.
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment one of the following lines to change the auto-update behavior
# zstyle ':omz:update' mode disabled  # disable automatic updates
# zstyle ':omz:update' mode auto      # update automatically without asking
# zstyle ':omz:update' mode reminder  # just remind me to update when it's time

# Uncomment the following line to change how often to auto-update (in days).
# zstyle ':omz:update' frequency 13

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS="true"

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# You can also set it to another string to have that shown instead of the default red dots.
# e.g. COMPLETION_WAITING_DOTS="%F{yellow}waiting...%f"
# Caution: this setting can cause issues with multiline prompts in zsh < 5.7.1 (see #5765)
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load?
# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git)

source $ZSH/oh-my-zsh.sh

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"
export BAT_THEME="OneHalfDark"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# FIXME Preferred editor for local and remote sessions.
if [[ -n $SSH_CONNECTION ]]; then
  export EDITOR='vim'
else
  export EDITOR='nvim'
fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# NOTE Before installing dotfiles on a new system:
# https://www.atlassian.com/git/tutorials/dotfiles
alias dotfiles='/mingw64/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'

# Missclicks
alias cd-="cd -"
alias cd..="cd .."
alias ..l="cd .. && l"

# Etc
alias ls="TERM=dumb lsd" # For correct `lsd` color display
alias lt="ls --tree --depth=2"
alias lta="lt --all"
alias c="clear"
alias e="exit"
alias q="exit"
alias v="nvim"
alias cd="z"
alias rg="rg --path-separator '//'" # NOTE 'path-separator' is ONLY for Windows
alias acfg="v '$HOME/AppData/Roaming/alacritty/alacritty.yml'"
alias nvcd="cd '$HOME/AppData/Local/nvim/lua/user/plugins'"
alias nvdcd="cd '$HOME/AppData/Local/nvim-data/readme-diff/saved-commit-ids'"
alias pcd="cd '$HOME/AppData/Local/nvim-data/site/pack/packer/start'"
alias vpcd="cd '$HOME/AppData/Local/nvim/plugged'" # vim-plug
alias vcfg="v '$HOME/.vim/.vimrc'"
alias cat="bat -p"
alias pn="cd $HOME/prog-notes && ll"
alias fcd="fd -d 1" # Find in Current Dir
alias al="alias | rg"
alias rmd="cd '$HOME/nvim-plugins/readme-diff' && v ."
alias fingerprint="ssh-keygen -lf"
alias y="yarn"
alias h="heroku"
alias m="make"
alias npmg="npm list -g --depth=0"
alias nre="npm run env --"
alias vr="nvim -u $HOME/AppData/Local/nvim/init_scp.lua"
alias serve="serve -p 0 --debug --cors --no-clipboard"

vpn()
{
  source ~/work/vpn/vpn.sh
}

vs()
{
  filename="./.session.vim"

  if [[ -f "$filename" ]]; then
    nvim -S $filename
  else
    nvim .
  fi
}

lang()
{
  rundll32 Shell32.dll,Control_RunDLL input.dll,,{C07337D3-DB2C-4D0B-9A93-B722A6C106E2}{HOTKEYS}
}

freshclam()
{
  $HOME/wireguard/on.bat

  timeout=3
  for ((secs = 0; secs < $timeout; secs++)); do
    echo -ne "${secs} / ${timeout}\r"
    sleep 1
  done

  freshclam.exe
  $HOME/wireguard/off.bat
}

# NOTE ClamAV https://docs.clamav.net/manual/Usage/Configuration.html#windows
# --exclude=REGEX                      Don't scan file names matching REGEX
# --exclude-dir=REGEX                  Don't scan directories matching REGEX
# Example: ... --exclude-dir=\\.git --exclude-dir=\\.tmp ./scanned/path/
# $1 - путь до директории/файла
clamscan()
{
  pth=$1

  if [[ ! -e $pth ]]; then
    >&2 echo "Path \"${pth}\" does not exist"

    return 1
  fi

  if [[ -d $pth ]]; then
    clamscan.exe --suppress-ok-results -r $pth
  else
    clamscan.exe --suppress-ok-results $pth
  fi

  return 0
}

# TODO Add 'PackerSync' command
vupd()
{
  nvim -c "set shell=cmd | PlugUpgrade | PlugUpdate | PlugClean | qa"
}

# $1 - путь к файлу/папке
cdl()
{
  cd $1 && l
}

# TODO
# $filename
skg()
{
  filename=$HOME/.ssh/

  if [[ -z $1 ]]; then
    filename="${filename}id_rsa"
  else
    filename="${filename}${1}"
  fi

  if [[ -f $filename ]]; then
    >&2 echo "file \"${filename}\" already exists"

    return 1
  else
    email=$(git config --global user.email)
    ssh-keygen -t ed25519 -C "${email}" -f "${filename}"
  fi

  return 0
}

mkd()
{
  mkdir -p $1 && cd $1
}

gccd()
{
  git clone "$1" && cd "$(basename "$1" .git)"
}

# PWD Mixed (like `pwdw`, but with forward slashes (C:/Users)).
pwdm()
{
  cygpath -m "$(pwd)"
}

# PWD Windows-style (with backshashes (C:\Users)).
pwdw()
{
  cygpath -w "$(pwd)"
}

find_crlf()
{
  rg -l "\r"
}

# fzf with mixed-style (with forward slashes) relative path output.
ff()
{
  cygpath -m "$(fzf)"
}



# CHOCOLATEY

alias cl="choco list"
alias ci="choco install -y"
alias cu="choco uninstall -y"



# SCOOP
alias sl="scoop list"



# To customize prompt, run `p10k configure` or edit $HOME/.p10k.zsh.
[[ ! -f $HOME/.p10k.zsh ]] || source $HOME/.p10k.zsh

# Отключить все звуковые сигналы
unsetopt BEEP

# Init zoxide. Must be added after 'compinit' is called.
eval "$(zoxide init zsh)"
