# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# If you come from bash you might have to change your $PATH.
export PATH=$HOME/bin:/usr/local/bin:$PATH
export PATH=$PATH:/c/portable/ClamAV-x64:"/c/Program Files/AutoHotkey"

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

# FIXME Preferred editor for local and remote sessions
if [[ -n $SSH_CONNECTION ]]; then
  export EDITOR='vim'
else
  export EDITOR='nvim'
fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# NOTE Before installing dotfiles on a new system:
# https://www.atlassian.com/git/tutorials/dotfiles
alias config='/mingw64/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'

alias ls="TERM=dumb lsd" # For correct `lsd` color display
alias lt="ls --tree"
alias c="clear"
alias e="exit"
alias q="exit"
alias v="sh ~/nvim.sh" # FIXME
alias cd="z"
alias rg="rg --path-separator '//'" # NOTE 'path-separator' is ONLY for Windows
alias acfg="v '$HOME/AppData/Roaming/alacritty/alacritty.yml'"
alias nvcd="cd '$HOME/AppData/Local/nvim/lua/user/plugins'"
alias nvdcd="cd '$HOME/AppData/Local/nvim-data/readme-diff/saved-commit-ids'"
alias pcd="cd '$HOME/AppData/Local/nvim-data/site/pack/packer/start'"
alias vcfg="v '$HOME/.vim/vimrc'"
alias nvcfg="v '$HOME/AppData/Local/nvim/init.lua'"
alias gsti="git status --ignored"
alias greg="git add -A && git commit --allow-empty-message -m '' && ggpush"
alias cat="bat -p"
alias pn="cd ~/prog-notes && ll"
alias fcd="fd -d 1" # Find in Current Dir
alias al="alias | rg"
# Missclicks
alias cd-="cd -"

freshclam()
{
  ~/wireguard/on.bat

  timeout=3
  for ((secs = 0; secs < $timeout; secs++)); do
    echo -ne "${secs} / ${timeout}\r"
    sleep 1
  done

  freshclam.exe
  ~/wireguard/off.bat
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
vupd() {
  v -c "PlugUpgrade | PlugUpdate | PlugClean | qa"
}

# $1 - путь к файлу/папке
cdl() {
  cd $1 && l
}

# TODO
# $1 - путь к файлу/папке
rmf() {
  pth=$1

  if [[ -z $pth ]]; then
    >&2 echo "Expected one argument - the name of a file or directory"
  fi

  if [[ ! -e $pth ]]; then
    >&2 echo "Path \"${pth}\" does not exist"

    return 1
  elif [[ -f $pth ]]; then
    rm -f $pth
  elif [[ -d $pth ]]; then
    rm -rf $pth
  fi

  return 0
}

# $filename [=id_rsa]
skg() {
  filename=~/.ssh/

  if [[ -z $1 ]]; then
    filename="${filename}id_rsa"
  else
    filename="${filename}${1}"
  fi

  if [[ -e $filename ]]; then
    >&2 echo "File \"${filename}\" already exists"

    return 1
  else
    ssh-keygen -f $filename -t rsa -b 4096
  fi

  return 0
}

mkd() {
  mkdir -p $1 && cd $1
}

d2u() {
  find . -name "$1" -type f -exec dos2unix {} \;
}

gccd() {
  git clone "$1" && cd "$(basename "$1" .git)"
}



# CHOCOLATEY

alias cl="choco list -l"
alias ci="choco install -y"
alias cu="choco uninstall -y"



# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

# Отключить все звуковые сигналы
unsetopt BEEP

# Init zoxide. Must be added after 'compinit' is called.
eval "$(zoxide init zsh)"
