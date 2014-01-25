zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'
setopt no_complete_aliases
export LANG=ja_JP.UTF-8

setopt auto_cd
setopt auto_pushd #use cd -<TAB>
setopt pushd_ignore_dups

export LSCOLORS="gxfxcxdxbxegedabagacad"


setopt hist_ignore_space
setopt hist_ignore_dups

setopt nobeep
setopt correct


bindkey -v #keybind vi like
export EDITOR=vi

#setting the path
PATH="$PATH":~/bin
eval "$(rbenv init -)"
export PATH="$HOME/.rbenv/bin:$PATH"

#set prompt
PROMPT=%F{green}'[%m: %~]'$'\n''%(!.#.$) '%f

#alias
alias rm='rm -i'
alias ls=' ls -G' #ls with coloring
alias pr='powder restart; powder applog'

# git alias
alias g="git"
alias gl="git log --pretty='medium-reverse' --graph --name-status"
alias ga="git add ."
alias gc="git commit"
alias gch="git checkout"
alias gnb="git checkout -b"
alias gb="git branch"
alias gdb="git branch -d"
alias gm="git merge"
alias gpull="git pull origin master; growlnotify -m Done!;"
alias gph="git push heroku master; growlnotify -m Done!;"
alias gps="git push staging master; growlnotify -m Done!;"
alias gst="git status"
alias gd="git diff"
alias gdc="git diff --cached"

# gpo() {
	# local branch=$*;
  # if [ -n "$branch" ]; then
	# git push origin $branch;
	# growlnotify -m "git push origin $branch";
  # fi
# }

# rake alias
alias rdm="echo rake db:migrate; rake db:migrate; growlnotify -m Done!; echo next rdtp;"
alias rdtp="echo rake db:test:prepare; rake db:test:prepare; growlnotify -m Done!; echo next rdp;"
alias rdp="echo rake db:populate; rake db:populate; growlnotify -m Done!; echo next rds;"
alias rds="echo rake db:seed; rake db:seed; growlnotify -m Done!; echo next gnb;"

# add Path to my pivotaltracker commands
PATH="$PATH":~/commands

# etc alias
alias music="mkdir /Volumes/contents; mount_afp afp://10.0.1.5/contents /Volumes/contents; open /Applications/iTunes.app"
alias eject="killall iTunes; hdiutil eject /Volumes/contents"

#display current dir in tab title
precmd () {
  echo -ne "\e]2;${PWD}\a"
  echo -ne "\e]1;${PWD:t}\a"
}

#prompt for git
setopt prompt_subst
autoload -Uz VCS_INFO_get_data_git; VCS_INFO_get_data_git 2> /dev/null

function rprompt-git-current-branch {
  local name st color gitdir action
  if [[ "$PWD" =~ '/¥.git(/.*)?$' ]]; then
    return
  fi
  name=$(basename "`git symbolic-ref HEAD 2> /dev/null`")
  if [[ -z $name ]]; then
    return
  fi

  gitdir=`git rev-parse --git-dir 2> /dev/null`
  action=`VCS_INFO_git_getaction "$gitdir"` && action="($action)"

  st=`git status 2> /dev/null`
  if [[ -n `echo "$st" | grep "^nothing to"` ]]; then
    color=%F{green}
  elif [[ -n `echo "$st" | grep "^nothing added"` ]]; then
    color=%F{yellow}
  elif [[ -n `echo "$st" | grep "^# Untracked"` ]]; then
    color=%B%F{red}
  else
     color=%F{red}
  fi
  echo "$color$name$action%f%b "
}

# -------------- 使い方 ---------------- #
RPROMPT='`rprompt-git-current-branch`'

#for autojump
[[ -s /Users/akira/.autojump/etc/profile.d/autojump.sh ]] && source /Users/akira/.autojump/etc/profile.d/autojump.sh
autoload -U compinit && compinit -u

#for growl
growl() { echo -e $'\e]9;'${1}'\007' ; return  ; }

#PATH=/opt/local/bin:/opt/local/sbin:$PATH
#MANPATH=/opt/local/man:$MANPATH
