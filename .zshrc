PROMPT='[%n@%m %F{green}%d%f %D{%Y/%m/%d} %*]
%# '

case "${OSTYPE}" in
darwin*)
  alias ls="ls -G"
  ;;
linux*)
  alias ls="ls --color"
  ;;
esac

if [[ ! -n $TMUX ]] && [[ $VSCODE_PID == "" ]]; then
    tmux new-session
fi
