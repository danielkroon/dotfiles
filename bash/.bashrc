eval $(thefuck --alias)

. ~/.git-prompt.sH
. /usr/local/opt/autoenv/activate.sh

PS1='\e[0;32m\u\e[m @ \e[1;32m\h\e[m \e[1;36m\w\e[m $(__git_ps1 "[%s]") \n\$ '

export GIT_PS1_SHOWDIRTYSTATE=true
export GIT_PS1_SHOWUPSTREAM='auto'

alias grep='grep --color'
alias ls='ls -G'

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh" # This loads nvm'

export SAAS_DB="reef"
export SAAS_HOST="localhost"
export GOODUP_TRANSLATIONS_PATH=~/Onepercentclub/server-deployment/translations

alias saasrestoredb="scp -l 8192 backups@bluebucket.onepercentclub.com:/home/backups/saas-backups/saas/reef-prod-current.sql.bz2 ./; dropdb $SAAS_DB; createdb $SAAS_DB; bzcat reef-prod-current.sql.bz2 | psql $SAAS_DB; rm reef-prod-current.sql.bz2; echo \"UPDATE clients_client SET domain_url=CONCAT(client_name, '.$SAAS_HOST');\" | psql reef"

alias update_backend="cd ~/Onepercentclub/bluebottle/; git pull; pip install -e .[test] --process-dependency-links --trusted-host github.com; python manage.py migrate_schemas --no-input; cd -"

# Fix history
HISTFILESIZE=1000000
HISTSIZE=1000000
export HISTTIMEFORMAT='%F %T '

# Make history write immediately
shopt -s histappend
PROMPT_COMMAND="history -a; history -n;$PROMPT_COMMAND"
alias dotfiles="/usr/bin/git --git-dir=$HOME/.dotfiles.git/ --work-tree=$HOME"
