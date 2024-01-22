#!/bin/bash
# Author: Amberson

echo "Create file .screenrc"
tee /root/.screenrc << END
startup_message off
defscrollback 10000

term xterm-256color
termcapinfo xterm* ti@:te@
attrcolor b ".I"    # allow bold colors - necessary for some reason
defbce on    # use current bg color for erased chars

hardstatus alwayslastline
hardstatus string '%{gk}[ %{G}%H %{g}][%= %{wk}%?%-Lw%?%{=b kR}[%{W}%n%f %t%?(%u)%?%{=b kR}]%{= kw}%?%+Lw%?%?%= %{g}][%{Y}%l%{g}]%{=b C}[ %D %m/%d %C%a ]%{W}'

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

