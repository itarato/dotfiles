# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each

# time that oh-my-zsh is loaded.
#ZSH_THEME="af-magic"
ZSH_THEME="agnoster"

# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

# Set to this to use case-sensitive completion
# CASE_SENSITIVE="true"

# Comment this out to disable weekly auto-update checks
# DISABLE_AUTO_UPDATE="true"

# Uncomment following line if you want to disable colors in ls
# DISABLE_LS_COLORS="true"

# Uncomment following line if you want to disable autosetting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment following line if you want red dots to be displayed while waiting for completion
# COMPLETION_WAITING_DOTS="true"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(git lol nyan svn osx rsync screen sprunge sublime symfony2 zsh-syntax-highlighting go)

source $ZSH/oh-my-zsh.sh

# Customize to your needs...
export PATH=\
/Applications/MAMP/bin/php/php5.5.10/bin:\
/usr/bin:\
/bin:\
/usr/sbin:\
/sbin:\
/usr/local/bin:\
/usr/local/sbin:\
/usr/local/git/bin:\
/usr/local/lib:\
/Users/itarato/Desktop/OpenCV-2.4.3/lib:\
/Applications/MAMP/Library/bin:\

#export DYLD_FALLBACK_LIBRARY_PATH=/usr/local/lib
export PYTHONPATH="/usr/lib:$PYTHONPATH"

alias dr="sh /Users/itarato/Web/drush/drush"
alias dr5="sh /Users/itarato/Checkout/drush/drush"
alias gd="git diff | /Users/itarato/Applications/colordiff.pl | less -R"
alias gd2="git-icdiff | less -R"
alias svndiff="svn diff | /Users/itarato/Applications/colordiff.pl | less -R"
alias g="grep -n -r --colour"
alias gs="git status"
alias h="history | grep "
alias l="ls -la"
alias phpa="/usr/bin/php -a"

alias start_apache="sudo /Applications/MAMP/Library/bin/apachectl start"
alias stop_apache="sudo /Applications/MAMP/Library/bin/apachectl stop"
alias start_selenium="java -jar /Users/itarato/Applications/selenium-server-standalone-2.37.0.jar -singleWindow -log /tmp/selenium.log"
alias start_solr="cd /Users/itarato/Applications/apache-solr-3.6.2/example/; java -jar start.jar"
alias start_jenkins="sudo launchctl load /Library/LaunchDaemons/org.jenkins-ci.plist"
alias stop_jenkins="sudo launchctl unload /Library/LaunchDaemons/org.jenkins-ci.plist"
alias start_maria="/usr/local/opt/mariadb/bin/mysql.server start"
alias stop_maria="/usr/local/opt/mariadb/bin/mysql.server stop"
alias start_mysql="/Applications/MAMP/Library/bin/mysqld_safe --port=3306 --socket=/Applications/MAMP/tmp/mysql/mysql.sock --lower_case_table_names=0 --pid-file=/Applications/MAMP/tmp/mysql/mysql.pid --log-error=/Applications/MAMP/logs/mysql_error_log &"
alias stop_mysql="/Applications/MAMP/Library/bin/mysqladmin -uroot -proot --socket=/Applications/MAMP/tmp/mysql/mysql.sock shutdown"
alias start_tomcat="sudo -u tomcat /Users/itarato/Applications/apache-tomcat-7.0.42/bin/startup.sh"
alias stop_tomcat="sudo -u tomcat /Users/itarato/Applications/apache-tomcat-7.0.42/bin/shutdown.sh"
alias start_memcached="for ((n=1; n<=11; n++)); do; ((port=(11210+${n}))); memcached -m 24 -p ${port} -d; done;"
alias stop_memcached="killall memcached"
alias start_nginx="nginx"
alias stop_nginx="nginx -s stop"
alias start_varnish="sudo varnishd -a 127.0.0.1:8888 -b 127.0.0.1:80 -s file,/tmp,500M"

alias sshdigitalocean="ssh root@198.211.97.148"


drupal_modules() {
  drush dis dashboard help overlay rdf shortcut toolbar -y
  drush dl admin_menu ctools devel views module_filter -y
  drush en admin_devel admin_menu admin_menu_toolbar ctools devel devel_generate views_ui module_filter syslog -y
}

gitkillbranch() {
  git branch -D $1;
  git push origin :$1;
}

export M2_HOME=/usr/local/apache-maven
export M2=/usr/local/apache-maven/bin

export GOROOT=/usr/local/go
export GOPATH=$HOME/Documents/go
export PATH=$PATH:$GOROOT/bin:$M2

launchctl setenv GOROOT /usr/local/go
launchctl setenv GOPATH /Users/itarato/Documents/go

start_web() {
  stop_jenkins
  stop_nginx
  start_apache
  start_mysql
  start_tomcat
  for ((n=1; n<=11; n++)); do; ((port=(11210+${n}))); memcached -m 24 -p ${port} -d; done;
}

stop_web() {
  stop_apache
  stop_mysql
  stop_memcached
  stop_tomcat
}

export PATH="$PATH:$HOME/.rvm/bin" # Add RVM to PATH for scripting
