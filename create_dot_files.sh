#!/bin/bash
# Author: Amberson

echo "Create file .screenrc"
tee /root/.screenrc << END
startup_message off
defscrollback 5000

term xterm-256color
attrcolor b ".I"    # allow bold colors - necessary for some reason
termcapinfo xterm 'Co#256:AB=\E[48;5;%dm:AF=\E[38;5;%dm'   # tell screen how to set colors. AB = background, AF=foreground
termcapinfo xterm Z0=\E[?3h:Z1=\E[?3l:is=\E[r\E[m\E[2J\E[H\E[?7h\E[?1;4;6l
termcapinfo xterm* ti@:te@
defbce on    # use current bg color for erased chars

hardstatus alwayslastline
hardstatus string '%{gk}[%{G}%H%{g}][%= %{wk}%?%-Lw%?%{=b kR}(%{W}%n*%f %t%?(%u)%?%{=b kR})%{= kw}%?%+Lw%?%?%= %{g}]%{=b C}[%m/%d/%y %C %A]%{W}'
vbell off
shell -$SHELL
logtstamp on
logtstamp after 1
END

echo "Create file .inputrc"
tee /root/.inputrc << END
## arrow up
"\e[A":history-search-backward
## arrow down
"\e[B":history-search-forward
## arrow left
"\e[1;5C": forward-word
## arrow right
"\e[1;5D": backward-word
END

