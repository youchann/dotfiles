# for M1 Mac
eval "$(/opt/homebrew/bin/brew shellenv)"

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

export VOLTA_HOME="$HOME/.volta"
export PATH="$VOLTA_HOME/bin:$PATH"
export PATH="$HOME/.yarn/bin:$HOME/.config/yarn/global/node_modules/.bin:$PATH"
export PATH="/usr/local/opt/openjdk/bin:$PATH"
export PATH="/usr/local/opt/mysql@5.6/bin:$PATH"
export PATH="/usr/local/opt/php@8.1/bin:$PATH"
export GOPATH=$HOME
export PATH=$PATH:$GOPATH/bin
export GOPRIVATE=github.com/voyagegroup
export PATH="$HOMEBREW_PREFIX/opt/coreutils/libexec/gnubin:$PATH"
export PATH="$HOME/.local/bin:$PATH"
export PATH="/opt/homebrew/opt/openjdk/bin:$PATH"

# The following lines have been added by Docker Desktop to enable Docker CLI completions.
fpath=(/Users/ca02502/.docker/completions $fpath)
# End of Docker CLI completions

# 補完の初期化はここで1回だけ。ダンプが24時間以上古いときだけ再生成し、
# それ以外はキャッシュ利用(-C)でセキュリティ監査をスキップして高速化する。
# gcloud completion より前に実行することで、向こうが compdef 未定義時に
# 独自の compinit を呼ぶ(=二重実行)のを防ぐ
autoload -Uz compinit
_zcompdump_old=(${ZDOTDIR:-$HOME}/.zcompdump(Nmh+24))
if (( $#_zcompdump_old )); then
  compinit
else
  compinit -C
fi
unset _zcompdump_old

source "$(brew --prefix)/share/google-cloud-sdk/path.zsh.inc"
source "$(brew --prefix)/share/google-cloud-sdk/completion.zsh.inc"

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/youchan/google-cloud-sdk/path.zsh.inc' ]; then . '/Users/youchan/google-cloud-sdk/path.zsh.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/Users/youchan/google-cloud-sdk/completion.zsh.inc' ]; then . '/Users/youchan/google-cloud-sdk/completion.zsh.inc'; fi
