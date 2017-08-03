PS1="\n[ \D{%Y-%m-%d %H:%M:%S} \u@\h \w \!(\$?) ]\n\$ "

case "${OSTYPE}" in
darwin*)
  alias ls="ls -G"
  ;;
linux*)
  alias ls="ls --color"
  ;;
esac

if [[ ! -n $TMUX ]]; then
    tmux new-session
fi
