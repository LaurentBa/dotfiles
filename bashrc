#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

PS1='[\u@\h \W]\$ '

export EDITOR="vim"
export PAGER="vimpager"

export PATH=$PATH:/usr/bin/vendor_perl:~/bin

export CDPATH=.:..:~/programmation:~/my_prog
# Make Bash append rather than overwrite the history on disk: 
shopt -s histappend
# Whenever displaying the prompt, write the previous line to disk: 
PROMPT_COMMAND='history -a'


source ~/.aliases
source ~/.aliases.tmp
export PRINTER=HP_LaserJet_CM1415fnw:

source /usr/share/git/completion/git-completion.bash

set -o vi
