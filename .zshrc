eval "$(/opt/homebrew/bin/brew shellenv)"

autoload -U compinit
compinit -u

alias ll='ls -laF'
alias g='git'
alias gc='git checkout'
alias gp='git pull'
alias gs='git stash'
alias d='docker'
alias dc='docker-compose'

# fzfとghqを連動させたディレクトリ移動
function f() {
  declare -r REPO_NAME="$(ghq list >/dev/null | fzf-tmux --reverse +m)"
  [[ -n "${REPO_NAME}" ]] && cd "$(ghq root)/${REPO_NAME}"
}
zle -N f
bindkey '^e' f

export PATH=$HOME/.nodebrew/current/bin:$PATH
export PATH="$HOME/.yarn/bin:$HOME/.config/yarn/global/node_modules/.bin:$PATH"
export PATH="/usr/local/opt/openjdk/bin:$PATH"
export PATH="/usr/local/opt/mysql@5.6/bin:$PATH"
export PATH="/usr/local/opt/php@8.1/bin:$PATH"
export GOPATH=$HOME
export PATH=$PATH:$GOPATH/bin

source "$(brew --prefix)/share/google-cloud-sdk/path.zsh.inc"
source "$(brew --prefix)/share/google-cloud-sdk/completion.zsh.inc"
