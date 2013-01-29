" vim: nowrap fdm=marker
set nocompatible
let mapleader = ","

" Load bundled plugins {{{1
"==========================
call pathogen#infect()
call pathogen#helptags()

" Load plugins that ship with Vim {{{1
"=====================================
runtime macros/matchit.vim
runtime ftplugin/man.vim

" Preferences {{{1
"=================
" Behaviour {{{2
"~~~~~~~~~~~~~~~
set backspace=2
set nojoinspaces
set encoding=utf8
" Tab-completion in command-line mode
set wildmode=full
set wildmenu
filetype plugin indent on
filetype plugin on
" set mouse=a
if has('mouse')
  " Don't want the mouse to work in insert mode.
  set mouse=nv
endif
set nopaste
set pastetoggle=<F2>

" Search {{{1
"~~~~~~~~~~~~~~~
set ignorecase
set smartcase
set incsearch
set hlsearch

" Spell checking {{{1
"~~~~~~~~~~~~~~~~~~~~
" Pressing ,ss will toggle and untoggle spell checking
map <leader>ss :setlocal spell!<cr>
map <leader>s :set spell<cr>:set spelllang=fr<cr>
" spellchecking
set spellfile=~/.vim/spell/fr.utf-8.add
set spellsuggest=10

" Appearzance {{{1
"================
syntax on
set nu
set showcmd 
set showmode
"set background=dark
set background=light
"set cursorline
"hi cursorline ctermbg=12 ctermfg=White "don't work see it 
set visualbell
set textwidth=80
set scrolloff=3
set laststatus=2
set guifont=DejaVu\ Sans\ Mono\ 11
set statusline=%F%m%r%h%w\ 
    \[%r%{getcwd()}%h]\
	\[FORMAT=%{&ff}]\ 
	\[TYPE=%Y]\
	\[ASCII=\%03.3b]\
	\[Line=%04l]\
	\[Col=%04v]\
	\[%p%%]\
" colorscheme {{{2
"~~~~~~~~~~~~~~~~~
colorscheme default
"colorscheme desert
"colorscheme blue
"colorscheme darkblue
"colorscheme darkblue

" Indentation {{{1
"set smartindent
set autoindent
set expandtab 
set shiftwidth=4
set softtabstop=4
set tabstop=4
"set smarttab " is it useful ?

" Plugin (conf & Map) {{{1 
"==========================
" Ctag {{{2
"~~~~~~~~~~~
map <F7> <Esc>:TlistToggle<CR>

" Plugin Project {{{2
map <F8> <Esc>:Project<CR>

" NerdTree {{{2
"~~~~~~~~~~~~~~
map <F9> <Esc>:NERDTreeToggle<CR>
let NERDTreeShowBookmarks=1

" VimWiki {{{2
"~~~~~~~~~~~~~
" Wikis list
let g:vimwiki_list = [{'path': '~/vimwiki/adminWiki', 'path_html': '~/vimwiki/adminWiki/http_'},
\{'path': '~/vimwiki/projectWiki', 'path_html': '~/vimwiki/projectWiki/http_'},
\{'path': '~/vimwiki/memoWiki', 'path_html': '~/vimwiki/memoWiki/http_'},
\{'path': '~/vimwiki/oldWiki', 'path_html': '~/vimwiki/oldWiki/http_' }]
" Wikis color
hi VimwikiHeader1 guifg=#FF0000
hi VimwikiHeader2 guifg=#00FF00
hi VimwikiHeader3 guifg=#0000FF
hi VimwikiHeader4 guifg=#FF00FF
hi VimwikiHeader5 guifg=#00FFFF
hi VimwikiHeader6 guifg=#FFFF00

" Maps {{{1
"==========
" cd like cmd {{{2
map ,cd :cd %:p:h<CR>

" Bind jj for esc {{{2
imap jj <Esc>:echo "-- NORMAL MODE --"<CR>

" help navigation {{{2
nmap <Return> <C-]>
nmap <BS> <C-T>

" tab navigation {{{2
:nmap <C-S-k> :tabprevious<CR>
:nmap <C-j> :tabnext<CR>
:map <C-S-k> :tabprevious<CR>
:map <C-j> :tabnext<CR>
:imap <C-S-k> <Esc>:tabprevious<CR>i
:imap <C-j> <Esc>:tabnext<CR>i
:nmap <C-t> :tabnew<CR>
:imap <C-t> <Esc>:tabnew<CR>
" tab open, only, close
map <leader>tn :tabnew<cr>
map <leader>tc :tabclose<cr>
map <leader>to :tabonly<cr>

" Script {{{2
"~~~~~~~~~~~~
" Latex to Pdf
map ,pdf :w!<CR>:cd %:p:h<CR>:!~/bin/MakePdf  %
" indent C prog
map ,ind :w!<CR>:cd %:p:h<CR>:!indent -gnu  %

" Skeleton {{{1
"""""""""""""""
"autocmd BufNewFile *.tex 0r ~/.vim/skeleton/skeleton.tex
"autocmd BufNewFile *.tex :9
"autocmd BufNewFile *.py 0r ~/.vim/skeleton/skeleton.py

" syntax {{{1
augroup filetypedetect 
  au! BufRead,BufNewFile /var/log/* set filetype=syslog 
augroup END 

" completion {{{1
"let g:SuperTabDefaultCompletionType = "<c-x><c-o>"
au filetype python      set omnifunc=pythoncomplete#Complete
au filetype html        set omnifunc=htmlcomplete#CompleteTags
au filetype css         set omnifunc=csscomplete#CompleteCSS
au filetype javascript  set omnifunc=javascriptcomplete#CompleteJS
au filetype c           set omnifunc=ccomplete#Complete
au filetype php         set omnifunc=phpcomplete#CompletePHP
au filetype ruby        set omnifunc=rubycomplete#Complete
au filetype sql         set omnifunc=sqlcomplete#Complete
au filetype xml         set omnifunc=xmlcomplete#CompleteTags
au filetype vim         set omnifunc=xmlcomplete#CompleteTags
au filetype glo        	set omnifunc=xmlcomplete#CompleteTags

" old {{{2
"~~~~~~~~~
" open fierefox ( now i use an other script) 
"vmap ,o :<C-U>!firefox "<cfile>"& >& /dev/null<CR><CR>

" bitbake
"au BufRead,BufNewFile *.bb set ft=bitbake
"au BufRead,BufNewFile *.bbclass  set ft=bitbake

"autocmd   FileType python source ~/.vim/py.vim

" send web file on web server with ZAMscp script
"map ,ww :cd%:p:h<CR>
"	\: let $a='vim2html/'.expand("%:r").'.html'<CR>
"	\:let $b=expand("%:r").'.html'<CR>
"	\:source $VIMRUNTIME/syntax/2html.vim<CR>
"	\:cd%:p:h<CR>:w! $a <CR>
"	\:! ~/bin/ZAMscp $b<CR>:q!<CR>


"Change la couleur de la statusline en insertion
"function! EnterI()
"    execute': hi Statusline ctermbg=darkgreen ctermfg=black'
"endfunction
"function! LeaveI()
"    execute': hi Statusline ctermbg=gray ctermfg=black'
"endfunction
"au InsertEnter * call EnterI()      
"au InsertLeave * call LeaveI()

" what's it {{{1
set whichwrap=b,s,<,>,[,]

" interesting {{{1
" Turn backup off, since most stuff is in SVN, git et.c anyway...
set nobackup
set nowb
set noswapfile

" Shortcuts using <leader>
map <leader>sn ]s
map <leader>sp [s
map <leader>sa zg
map <leader>s? z=
" }}}

