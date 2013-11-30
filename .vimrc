set nocompatible

"Bundle plugins!
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()
Bundle 'gmarik/vundle'
Bundle 'bling/vim-airline'
Bundle 'Lokaltog/vim-easymotion'
Bundle 'kien/ctrlp.vim'
Bundle 'altercation/vim-colors-solarized'
Bundle 'kchmck/vim-coffee-script'
Bundle 'tpope/vim-endwise'
Bundle 'tpope/vim-rails'
Bundle 'tpope/vim-repeat'
Bundle 'tpope/vim-surround'
Bundle 'tpope/vim-eunuch'
Bundle 'scrooloose/nerdtree'
Bundle 'nono/vim-handlebars'
Bundle 'plasticboy/vim-markdown'
Bundle 'slim-template/vim-slim'
Bundle 'ervandew/supertab'

syntax enable
syntax on

set backspace=indent,eol,start

"Solarized theme
let g:solarized_termtrans = 1
"set background=dark
colorscheme solarized
" change the default EasyMotion shading to something more readable with Solarized
hi link EasyMotionShade  Comment

"Vim AIRLINE
"let g:Powerline_symbols = 'fancy'
set encoding=utf-8
let g:airline_powerline_fonts = 1
let g:airline_theme='solarized'
set laststatus=2
set guifont=Inconsolata\ for\ Powerline

set ts=2 sts=2 sw=2 expandtab "Convert tabs to 2 spaces
set number      " line numbers
set nowrap
set hidden
set autoindent  " always autoindent
set hlsearch    " highlight search terms
set incsearch   " show search matches as you type
set history=1000
set undolevels=1000
set nobackup
set noswapfile
filetype plugin indent on
set ignorecase smartcase

"Unbind arrow keys
noremap <Up> <NOP>
noremap <Down> <NOP>
noremap <Left> <NOP>
noremap <Right> <NOP>

"Bindings
let mapleader=","
let g:ctrlp_map = '<Leader>t'
let g:EasyMotion_leader_key = '<Leader>'
map <F2> :source $MYVIMRC<CR>:echoe "Vimrc Reloaded!!!"<CR> "F2 to reload vimrc
nmap <silent> <Leader>/ :nohlsearch<CR> " ,/ clears search

" setup quicker split navigation
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-h> <C-w>h
nnoremap <C-l> <C-w>l

" set ruler
set colorcolumn=80

" set up ,, to quick swap buffers
nnoremap <Leader><Leader> <C-^>

" Setup height of active split
set winwidth=84
" We have to have a winheight bigger than we want to set winminheight. But if
" " we set winheight to be huge before winminheight, the winminheight set will
" " fail.
set winheight=5
set winminheight=5
set winheight=999

" Enable mouse
set mouse=a
set mousef=on

" Sets up NERDTree
" Opens in small left vertical split
let g:NERDTreeHijackNetrw = 0
let g:loaded_netrw = 1
let g:loaded_netrwPlugin = 1
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif

if argc() == 1 && argv(0) == '.'
  autocmd vimenter * NERDTree

  autocmd vimenter * wincmd w
  if !empty($L)
    autocmd vimenter * wincmd v
    autocmd vimenter * wincmd v
  endif
endif


autocmd BufNewFile,BufRead Gemfile set filetype=ruby
autocmd BufNewFile,BufRead Rakefile set filetype=ruby

" Ruby Autocomplete
let g:SuperTabDefaultCompletionType = "<C-X><C-O>"
autocmd FileType ruby,eruby let g:rubycomplete_buffer_loading = 1 
autocmd FileType ruby,eruby let g:rubycomplete_classes_in_global = 1
autocmd FileType ruby,eruby let g:rubycomplete_rails = 1

" Disable folding for markdown syntax plugin
let g:vim_markdown_folding_disabled=1
