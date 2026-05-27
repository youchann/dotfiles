#!/bin/bash

set -u

# 実行場所のディレクトリを取得
THIS_DIR=$(cd $(dirname $0); pwd)

cd $THIS_DIR
git submodule init
git submodule update

echo "start setup..."
for f in .??*; do
    [ "$f" = ".git" ] && continue

    # リンク先はディレクトリ(~/)ではなくリンク名まで明示する。
    # GNU coreutils の ln では `ln -snf src ~/` がトレイリングスラッシュを
    # 別解釈して失敗するため、~/"$f" と明示して BSD/GNU 双方で動くようにする
    ln -snfv "$THIS_DIR"/"$f" ~/"$f"
done

cat << END

**************************************************
DOTFILES SETUP FINISHED! bye.
**************************************************

END
