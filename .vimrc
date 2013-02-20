set nocompatible
execute pathogen#infect()

syntax enable
syntax on

"Solarized theme
let g:solarized_termtrans = 1
set background=light
colorscheme solarized

set guifont=Inconsolata-g:h12

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
map <F2> :source $MYVIMRC<CR>:echoe "Vimrc Reloaded!!!"<CR> "F2 to reload vimrc
nmap <silent> <Leader>/ :nohlsearch<CR> " ,/ clears search

nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-h> <C-w>h
nnoremap <C-l> <C-w>l

nnoremap <Leader><Leader> <C-^>

set laststatus=2
set statusline=%F%m%r%h%w\ [FORMAT=%{&ff}]\ [TYPE=%Y]\ [ASCII=\%03.3b]\ [HEX=\%02.2B]\ [POS=%04l,%04v][%p%%]\ [LEN=%L]

set winwidth=84
" We have to have a winheight bigger than we want to set winminheight. But if
" " we set winheight to be huge before winminheight, the winminheight set will
" " fail.
set winheight=5
set winminheight=5
set winheight=999

set background=light
colorscheme solarized
