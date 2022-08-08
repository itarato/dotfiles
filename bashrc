alias gs="git status"
alias gpf='git push --force-with-lease origin +$(git_current_branch)'
alias h="history | grep --color"
alias g="grep -n --colour -r"
alias grm="git rebase main"
alias gri="git rebase -i main"
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

export ITARATO_PROJECT_FOLDER="/home/spin/src/github.com/Shopify/shopify/"
export ITARATO_LOG_FILE="/tmp/idbg_log.txt"
