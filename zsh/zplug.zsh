if [[ ! -e ~/.zplug/init.zsh ]]; then
    git clone https://github.com/zplug/zplug ~/.zplug
fi

source ~/.zplug/init.zsh

zplug "zplug/zplug"

# コマンドに色をつける
zplug "zsh-users/zsh-syntax-highlighting", \
    defer:2

# cd便利化
zplug "b4b4r07/enhancd", \
    use:init.sh

# HTTPステータスコードの確認に便利
zplug "b4b4r07/http_code"

# インタラクティブフィルタ
zplug "jhawthorn/fzy", \
    as:command, \
    rename-to:fzy, \
    hook-build:"make && sudo make install"

# historyからコマンドをサジェストさせる
zplug "zsh-users/zsh-autosuggestions"

if [[ $OSTYPE == *darwin* ]]; then
    # GitHub 操作をshellから可能にする
    zplug "github/hub", \
        from:gh-r, \
        as:command, \
        use:"*darwin*amd64*"
fi
