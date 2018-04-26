#!/bin/bash



# Easier navigation
alias ..="cd .."
alias ...="cd ../.."
alias ....="cd ../../.."
alias -- -="cd -"
alias cd..="cd .."
alias cd-="cd -"

# edit hosts
alias hosts='sudo $EDITOR /etc/hosts'

# copy working directory
alias cwd='pwd | tr -d "\r\n" | xclip -selection clipboard'

# === security ===
# copy file interactive
alias cp='cp -i'

# move file interactive
alias mv='mv -i'

# mv, rm, cp
alias mv='mv -v'
alias rm='rm -i -v'
alias cp='cp -v'
