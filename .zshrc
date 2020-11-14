export PATH=/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:$PATH
source ~/dotfiles/antigen.zsh
antigen use oh-my-zsh

# plugins
antigen bundle git 
antigen bundle command-not-found
antigen bundle compleat
antigen bundle extract
antigen bundle tmux
# antigen bundle history-substring-search 
antigen bundle ant
antigen bundle docker
antigen bundle gitignore 
antigen bundle postgres
antigen bundle redis-cli
antigen bundle npm

# python
antigen bundle celery
antigen bundle django
antigen bundle python
antigen bundle pip
# antigen bundle virtualenv

antigen theme afowler
antigen apply

# docker
alias dc=docker-compose
alias dcud="docker-compose down && docker-compose up -d"

# editor
alias vim=nvim
alias vi=nvim
export EDITOR=nvim


# kubernetes
# if [ kubectl ]; then source <(kubectl completion zsh); fi
export KUBECONFIG=~/.kube/xube
alias k=kubectl
alias kall='kubectl api-resources --verbs=list -o name | xargs -n 1 kubectl get -o name'

# PATH
export PATH=$PATH:$HOME/.poetry/bin:~/bin


# clipboard
alias setclip='xclip -selection c'
alias getclip='xclip -selection clipboard -o'


# weird macos fix
# export LC_ALL=en_US.UTF-8 # todo make mac only

# gnu utils mac only:
# PATH="/usr/local/opt/coreutils/libexec/gnubin:$PATH" # todo make mac only

# alias j12="export JAVA_HOME=`/usr/libexec/java_home -v 12`; java -version"
# alias j8="export JAVA_HOME=`/usr/libexec/java_home -v 1.8`; java -version"
# export JAVA_HOME=`/usr/libexec/java_home -v 1.8`

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
