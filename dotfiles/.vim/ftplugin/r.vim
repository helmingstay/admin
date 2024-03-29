" ftplugin for R files
"
" Author: Iago Mosqueira <i.mosqueira@ic.ac.uk>
" Author: Johannes Ranke <jranke@uni-bremen.de>
" Author: Fernando Henrique Ferraz Pereira da Rosa <feferraz@ime.usp.br>
" Maintainer: Johannes Ranke <jranke@uni-bremen.de>
" Last Change: 2006 Mai 24
" SVN: $Id: r.vim 61 2006-05-22 06:15:10Z ranke $
"
" Code written in vim is sent to R through a perl pipe
" [funnel.pl, by Larry Clapp <vim@theclapp.org>], as individual lines,
" blocks, or the whole file.

" Press <F2> to open a new xterm with a new R interpreter listening
" to its standard input (you can type R commands into the xterm)
" as well as to code pasted from within vim.
"
" After selecting a visual block, 'r' sends it to the R interpreter
"
" In insert mode, <M-Enter> sends the active line to R and moves to the next
" line (write and process mode).
"
" Maps:
"       <F2>		Start a listening R interpreter in new xterm
"       <F3>		Start a listening R-devel interpreter in new xterm
"       <F4>		Start a listening R --vanilla interpreter in new xterm
"       <F5>        Run current file
"       <F9>        Run line under cursor
"       r	        Run visual block
"       <M-Enter>   Write and process

" Only do this when not yet done for this buffer
if exists("b:did_ftplugin")
  finish
endif

" Don't load another plugin for this buffer
let b:did_ftplugin = 1

"disable backup for .r-pipe
setl backupskip=.*pipe

"set r-friendly tabbing
set expandtab
set tabstop=4
set shiftwidth=4


"abbreviations
inoremap <buffer> `, <-
inoremap <buffer> `. %.>%
inoremap <buffer> `f FALSE
inoremap <buffer> `t TRUE
inoremap <buffer> `n !=
inoremap <buffer> `e ==
inoremap <buffer> `x <- function() { <ENTER> } <ESC>k0f(a
inoremap <buffer> `9 ()<ESC>a
inoremap <buffer> `[ []<ESC>a
inoremap <buffer> `dh h()<ESC>i
inoremap <buffer> `dt tt()<ESC>i
inoremap <buffer> `ds ss()<ESC>i
nnoremap <buffer> `s :w<ENTER>




"Start a listening R interpreter in new xterm
noremap <buffer> <F2> :!gnome-terminal -t 'R' -x funnel.pl ~/.r-pipe "R && echo -e 'Interpreter has finished. Exiting. Goodbye.\n'"&<CR><CR>

"Start a listening R-devel interpreter in new xterm
noremap <buffer> <F3> :!xterm -T 'R' -e funnel.pl ~/.r-pipe "R-devel && echo 'Interpreter has finished. Exiting. Goodbye.'"&<CR><CR>

"Start a listening R --vanilla interpreter in new xterm
noremap <buffer> <F4> :!xterm -T 'R' -e funnel.pl ~/.r-pipe "R -vanilla && echo 'Interpreter has finished. Exiting. Goodbye.'"&<CR><CR>

"send line under cursor to R
noremap <buffer> <F9> :execute line(".") 'w >> ~/.r-pipe'<CR>
inoremap <buffer> <F9> <Esc> :execute line(".") 'w >> ~/.r-pipe'<CR>

"send visual selected block to R
vnoremap <buffer> r :w >> ~/.r-pipe<CR>

"write and process mode (somehow mapping <C-Enter> does not work)
inoremap <M-Enter> <Esc>:execute line(".") 'w >> ~/.r-pipe'<CR>o

"send current file to R
noremap <buffer> <F5> :execute '1 ,' line("$") 'w >> ~/.r-pipe' <CR><CR>
