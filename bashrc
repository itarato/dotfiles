alias gs="git status"
alias gpf='git push --force-with-lease origin +$(git_current_branch)'
alias h="history | grep --color"
alias g="grep -n --colour -r"
alias grm="git rebase master"
alias gri="git rebase -i master"
alias to_j="ruby -e \"require 'json';require 'awesome_print';ap JSON.parse(STDIN.read)\""
alias gd2="git-icdiff"
alias gl="git pull || (echo \"\n*******************\n* DO IT AGAIN NOW *\n*******************\n\" ; git pull --prune)"

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
