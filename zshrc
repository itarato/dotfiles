export ZSH="${HOME}/.oh-my-zsh"

ZSH_THEME="simple"

plugins=(git brew bundler colored-man-pages colorize common-aliases gem github rails ruby)

. $ZSH/oh-my-zsh.sh

alias gs="git status"
alias gpf='git push --force-with-lease origin +$(git_current_branch)'
alias h="history | grep --color"
alias g="grep -n --colour -r"
alias grm="git rebase main"
alias gri="git rebase -i main --autosquash"
alias to_j="ruby -e \"require 'json';require 'awesome_print';ap JSON.parse(STDIN.read)\""
alias gl="git pull || (echo \"\n*******************\n* DO IT AGAIN NOW *\n*******************\n\" ; git pull --prune)"

EDITOR=vim

function gsave() {
  TAG=`echo $(git_current_branch) | md5`
  gca -m "${TAG:0:4} | $1"
}

function glr() {
  git pull origin $(git_current_branch) --rebase
}

function gfeature() {
  git checkout -b $1
  git push --no-verify -u origin $1
}

function shopkill() {
  stop shopify
  pkill -9 -f spring
  systemctl restart mysql@shopify--shopify.service
}

function pgc() {
  commit_count=`git rev-list --count --first-parent main..${git_current_branch}`
  echo "Fount $commit_count commits in branch."

  if [[ "$commit_count" -eq "0" ]];
  then
    if [ -z "$1" ];
    then
      echo "This is the first commit. Provide a commit message."
      return 1
    else
      echo "Saving first commit."
      git commit -vam $1
    fi;
  else
    first_commit_offset=$(($commit_count - 1))
    first_commit=`git rev-parse HEAD~${first_commit_offset}`

    echo "Fixup commit for $first_commit."
    git commit -va --fixup $first_commit
  fi;
}

export ITARATO_PROJECT_FOLDER="/home/spin/src/github.com/Shopify/shopify/"
export ITARATO_LOG_FILE="/tmp/idbg_log.txt"
