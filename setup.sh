#!/bin/bash

DOTFILES_DIR="$HOME/dotfiles"

# dotfilesをclone（まだなければ）
if [ ! -d "$DOTFILES_DIR" ]; then
    git clone https://github.com/letmeslip/dotfiles.git "$DOTFILES_DIR"
fi

# OS判定
if [[ "$(uname)" == "Darwin" ]]; then
    OS="mac"
else
    OS="linux"
fi

# シンボリックリンクを張る関数
link() {
    local src="$DOTFILES_DIR/$1"
    local dst="$HOME/$1"
    if [ -f "$dst" ] && [ ! -L "$dst" ]; then
        mv "$dst" "$dst.bak"
        echo "既存の $1 を $1.bak にバックアップしました"
    fi
    ln -sf "$src" "$dst"
    echo "$1 のシンボリックリンクを作成しました"
}

# Oh My Zshのインストール
if [ ! -d "$HOME/.oh-my-zsh" ]; then
    echo "Oh My Zsh をインストール中..."
    sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended
fi

# zsh-autosuggestionsのインストール
if [ ! -d "$HOME/.oh-my-zsh/custom/plugins/zsh-autosuggestions" ]; then
    echo "zsh-autosuggestions をインストール中..."
    git clone https://github.com/zsh-users/zsh-autosuggestions "$HOME/.oh-my-zsh/custom/plugins/zsh-autosuggestions"
fi

# zsh-syntax-highlightingのインストール
if [ ! -d "$HOME/.oh-my-zsh/custom/plugins/zsh-syntax-highlighting" ]; then
    echo "zsh-syntax-highlighting をインストール中..."
    git clone https://github.com/zsh-users/zsh-syntax-highlighting "$HOME/.oh-my-zsh/custom/plugins/zsh-syntax-highlighting"
fi

# Powerlevel10kのインストール
if [ ! -d "$HOME/.oh-my-zsh/custom/themes/powerlevel10k" ]; then
    echo "Powerlevel10k をインストール中..."
    git clone --depth=1 https://github.com/romkatv/powerlevel10k.git "$HOME/.oh-my-zsh/custom/themes/powerlevel10k"
fi

# tmuxのインストール
if ! command -v tmux &>/dev/null; then
    echo "tmux をインストール中..."
    if [[ "$OS" == "mac" ]]; then
        brew install tmux
    else
        sudo apt install -y tmux 2>/dev/null || sudo dnf install -y tmux 2>/dev/null
    fi
fi

# シンボリックリンクを張る
link .tmux.conf
link .zshrc
link .p10k.zsh

echo ""
echo "完了！ source ~/.zshrc で設定を反映してください"
