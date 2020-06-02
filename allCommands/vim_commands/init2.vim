" this goes in .config/nvim/init.vim :

execute pathogen#infect()

ab ll λ 

syntax on
filetype plugin indent on

set noswapfile
set number
set shortmess+=I
set nocompatible
set showmode
set smartcase
set smarttab
set smartindent
set autoindent
set expandtab
set shiftwidth=2
set softtabstop=2
set background=dark
set laststatus=0

set guicursor=                          " these both need to
let $NVIM_TUI_ENABLE_CURSOR_SHAPE = 0  " be in place

let g:haskell_classic_highlighting = 1
let g:haskell_indent_if = 3
let g:haskell_indent_case = 2
let g:haskell_indent_let = 4
let g:haskell_indent_where = 6
let g:haskell_indent_before_where = 2
let g:haskell_indent_after_bare_where = 2
let g:haskell_indent_do = 3
let g:haskell_indent_in = 1
let g:haskell_indent_guard = 2
let g:haskell_indent_case_alternative = 1
let g:cabal_indent_section = 2 

color darkblue
hi Keyword ctermfg=darkcyan
hi Constant ctermfg=2*
hi Comment ctermfg=4*
hi Normal ctermbg=none
hi LineNr ctermfg=darkgrey
