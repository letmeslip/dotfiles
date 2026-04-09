#!/bin/bash

DOTFILES_DIR="$HOME/dotfiles"

# dotfilesをclone（まだなければ）
if [ ! -d "$DOTFILES_DIR" ]; then
    git clone git@github.com:letmeslip/dotfiles.git "$DOTFILES_DIR"
fi

# .tmux.conf のシンボリックリンクを張る
if [ -f "$HOME/.tmux.conf" ] && [ ! -L "$HOME/.tmux.conf" ]; then
    mv "$HOME/.tmux.conf" "$HOME/.tmux.conf.bak"
    echo "既存の .tmux.conf を .tmux.conf.bak にバックアップしました"
fi

ln -sf "$DOTFILES_DIR/.tmux.conf" "$HOME/.tmux.conf"
echo ".tmux.conf のシンボリックリンクを作成しました"

echo "完了！tmux を起動して確認してください"
