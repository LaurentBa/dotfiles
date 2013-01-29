" Vim syntax file
" Language:	Glow Aerotech project ultimate juggling
" Maintainer:	Afixaziz <afixaziz.net>, La rue Luberlu <larueluberlu.net>
" Last Change:	2009 Nov 02
" Version:	1


"""prendre en compte la case
syn case match




"""definition de mot cles
syn keyword gloColors R G B C 
syn keyword gloDelay D RAMP
syn keyword gloNoargument END
syn keyword gloLoop L E SUB 
syn keyword gloDefsub DEFSUB ENDSUB 
" les commentaires
syn match gloComment "\;.$"

syn region  gloComment start=";" end="$"
" voir les groupe par defaut
highlight link gloColors Statement
highlight link gloDelay Label
highlight link gloNoargument Exception
highlight link gloLoop Repeat
highlight link gloDefsub Function
highlight link gloComment Comment
