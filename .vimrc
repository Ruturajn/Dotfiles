" This is a configuration File for Vim. Disable compatibility with vi which can cause unexpected issues.
set nocompatible

" Set Text highlighting after search
set hlsearch

" Enable type file detection. Vim will be able to try to detect the type of file in use.
filetype on

" Enable plugins and load plugin for the detected file type.
filetype plugin on

" Load an indent file for the detected file type.
filetype indent on

" Turn ON syntax highlighting
syntax on

" Set Line numbers
set number
set relativenumber

" Set number of spaces in tab
set tabstop=4 softtabstop=4
set shiftwidth=4

" Set Bold Line at the end
set laststatus=2

" PLUGINS ------------------------------------------------------------------- 
call plug#begin('~/.vim/plugged')

  Plug 'preservim/nerdtree'
  Plug 'vim-scripts/AutoComplPop'
  Plug 'gko/vim-coloresque'
  Plug 'ap/vim-css-color'
  " Plug 'vim-airline/vim-airline'
  Plug 'mhinz/vim-startify'
  Plug 'tpope/vim-fugitive'
  Plug 'ryanoasis/vim-devicons'
  Plug 'itchyny/lightline.vim'
  Plug 'pacha/vem-tabline'
  " Plug 'scrooloose/syntastic'
  " Plug 'jiangmiao/auto-pairs'
  Plug 'tpope/vim-commentary'
  " Plug 'junegunn/fzf.vim' 
  Plug 'z0mbix/vim-shfmt', { 'for': 'sh' }
  Plug 'vim-scripts/DoxygenToolkit.vim'
  " Plug 'catppuccin/vim'

call plug#end()

" ----------------------------------------------------------------END PLUGINS

set expandtab smarttab

set complete+=kspell

set completeopt=menuone,longest

set shortmess+=c

set noerrorbells

set nowrap

" Enable ascii symbols
" let g:airline_symbols_ascii=1
"let g:airline_powerline_fonts=1
"
"" Enable Spell-check with airline
"let g:airline_detect_spell=1
"
"let g:airline#extensions#whitespace#enabled = 0
"
"let g:airline#extensions#branch#enabled=1
"
"let g:airline_powerline_fonts = 1
"
"
"if !exists('g:airline_symbols')
"        let g:airline_symbols = {}
"endif
"
"
"" powerline symbols
"let g:airline_left_sep = ''
"let g:airline_left_alt_sep = ''
"let g:airline_right_sep = ''
"let g:airline_right_alt_sep = ''
"let g:airline_symbols.branch = ''
"let g:airline_symbols.colnr = ' | CN : '
"let g:airline_symbols.readonly = ''
"let g:airline_symbols.linenr = ' LN : '
"let g:airline_symbols.maxlinenr = ''
"let g:airline_symbols.dirty='⚡'

" Keybindings for Tabs
nnoremap <C-n> :tabn<cr>
nnoremap <C-t> :tabnew<cr>
nnoremap <C-x> :tabc<cr>
nnoremap <C-l>h :tabr<cr>
nnoremap <C-l>l :tabl<cr>
nnoremap <C-l>j :tabp<cr>


let g:lightline = {
	\ 'active': {
    \   'left': [ [ 'mode', 'paste' ],
	\             [ 'gitbranch', 'readonly', 'filename', 'modified' ] ]
	\ },
	\ 'component_function': {
	\   'gitbranch': 'FugitiveHead',
    \   'filetype': 'MyFiletype',
    \   'fileformat': 'MyFileformat'
	\ },
	\ }



  
function! MyFiletype()
    return winwidth(0) > 70 ? (strlen(&filetype) ? &filetype . ' ' . WebDevIconsGetFileTypeSymbol() : 'no ft') : ''
endfunction
  
function! MyFileformat()
    return winwidth(0) > 70 ? (&fileformat . ' ' . WebDevIconsGetFileFormatSymbol()) : ''
endfunction



" Reference Values
" Ps = 0 -> blinking block
" Ps = 1 -> blinking block (default)
" Ps = 2 -> steady block
" Ps = 3 -> blinking underline
" Ps = 4 -> steady underline
" Ps = 5 -> bliking bar (xterm)
" Ps = 6 -> steady bar (xterm)
" &t_SI is for INSERT mode, and &t_EI is for everything else.
let &t_SI = "\e[5 q"
let &t_EI = "\e[2 q"

" let g:startify_custom_header = [ 
"             \ '   ██████╗  █████╗ ███████╗██╗  ██╗██████╗  ██████╗  █████╗ ██████╗ ██████╗  ',
"             \ '   ██╔══██╗██╔══██╗██╔════╝██║  ██║██╔══██╗██╔═══██╗██╔══██╗██╔══██╗██╔══██╗ ',
"             \ '   ██║  ██║███████║███████╗███████║██████╔╝██║   ██║███████║██████╔╝██║  ██║ ',
"             \ '   ██║  ██║██╔══██║╚════██║██╔══██║██╔══██╗██║   ██║██╔══██║██╔══██╗██║  ██║ ',
"             \ '   ██████╔╝██║  ██║███████║██║  ██║██████╔╝╚██████╔╝██║  ██║██║  ██║██████╔╝ ',
"             \ '   ╚═════╝ ╚═╝  ╚═╝╚══════╝╚═╝  ╚═╝╚═════╝  ╚═════╝ ╚═╝  ╚═╝╚═╝  ╚═╝╚═════╝  ',
"             \ ]

let g:startify_custom_header = [                                                                         
            \'    ██╗   ██╗██╗███╗   ███╗',
            \'    ██║   ██║██║████╗ ████║',
            \'    ██║   ██║██║██╔████╔██║',
            \'    ╚██╗ ██╔╝██║██║╚██╔╝██║',
            \'     ╚████╔╝ ██║██║ ╚═╝ ██║',
            \'      ╚═══╝  ╚═╝╚═╝     ╚═╝',
            \ ]

" let g:shfmt_fmt_on_save = 1

" Copy and paste between vim and other programs
set clipboard=unnamedplus

" :map <C-Enter> :rightb vert term<cr>
"

" Set mouse
" set mouse=a
" nnoremap g<right> 5<c-w>>
" nnoremap g<left> 5<c-w><lt>

:map <C-r><Enter> :rightb vert term<cr>
nnoremap <C-a>l 5<C-w>>
nnoremap <C-a>h 5<C-w><lt>
