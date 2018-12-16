case "${OSTYPE}" in
darwin*)
    alias ls='ls -G'
    ;;
*)
    alias ls='ls --color=auto'
    ;;
esac

alias lr='ls -R'
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'

alias rm='rm -v'
alias rr='rm -r'

alias grep='grep --color=auto'
alias fgrep='fgrep --color=auto'
alias egrep='egrep --color=auto'

alias df='df -h'

alias tmux='tmux -2'

alias zmv='noglob zmv -W'

if [[ -e ${HOME}/.local_aliases ]]; then
    source ${HOME}/.local_aliases
fi

