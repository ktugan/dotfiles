# --- Plugin manager (zinit) ---
ZINIT_HOME="${XDG_DATA_HOME:-${HOME}/.local/share}/zinit/zinit.git"
[ ! -d "$ZINIT_HOME" ] && mkdir -p "$(dirname $ZINIT_HOME)" && git clone https://github.com/zdharma-continuum/zinit.git "$ZINIT_HOME"
source "${ZINIT_HOME}/zinit.zsh"

zinit wait lucid for \
  zsh-users/zsh-autosuggestions \
  zsh-users/zsh-syntax-highlighting

zinit wait lucid atload"zicompinit; zicdreplay" blockf for \
  zsh-users/zsh-completions

# --- Theme ---
source ~/dotfiles/afowler.zsh-theme

# --- PATH ---
export PATH=/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:$PATH
export PATH=$PATH:$HOME/.poetry/bin:~/bin

# --- OS-specific config ---
case "$(uname)" in
  Darwin) source ~/dotfiles/macos.zsh ;;
  Linux)  source ~/dotfiles/linux.zsh ;;
esac

# --- Editor ---
if (( $+commands[nvim] )); then
  export EDITOR=nvim
  alias vim=nvim
  alias vi=nvim
else
  export EDITOR=vim
fi

# --- Tools ---
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# nvm (lazy loaded)
export NVM_DIR="$HOME/.nvm"
nvm() { unset -f nvm node npm npx; [ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"; [ -s "$NVM_DIR/bash_completion" ] && . "$NVM_DIR/bash_completion"; nvm "$@"; }
node() { unset -f nvm node npm npx; [ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"; node "$@"; }
npm() { unset -f nvm node npm npx; [ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"; npm "$@"; }
npx() { unset -f nvm node npm npx; [ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"; npx "$@"; }

# --- Aliases ---
source ~/dotfiles/git-aliases.zsh

alias dc=docker-compose
alias dcud="docker-compose down && docker-compose up -d"

alias k=kubectl
alias kall='kubectl api-resources --verbs=list -o name | xargs -n 1 kubectl get -o name'
export KUBECONFIG=~/.kube/xube
