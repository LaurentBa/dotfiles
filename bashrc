#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

#Set colors 
COL_VERT='1;32'

COL_PY='38;5;45'
COL_C='38;5;39'
COL_PROG='38;5;30'
COL_PDF='1;32 '
COL_EX='38;5;63' 
COL_IMG='38;5;176'
COL_PDF='38;5;217'



PS1='\[\e[${COL_VERT}m\][\u@\h \W]\$\[\e[0m\] '

export EDITOR="vim"
export PAGER="most"

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
complete -cf sudo



LS_COLORS="di=1:fi=0:ln=1;35:pi=5:so=36:bd=42:cd=1;32:or=31:mi=0:ex=${COL_EX}:*.py=${COL_PY}:*.c=${COL_C}:*.cpp=${COL_C}:*.sh=${COL_PROG}:*.glo=${COL_PROG}:*.pdf=${COL_PDF}:*.jpg=${COL_IMG}"

export LS_COLORS
