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

syntax enable
syntax on

set backspace=indent,eol,start

"Solarized theme
let g:solarized_termtrans = 1
"set background=dark
colorscheme solarized

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

map <leader>r :call RunTestFile()<cr>
map <leader>R :call RunNearestTest()<cr>
map <leader>a :call RunTests('spec')<cr>
map <leader>c :w\|:!script/features<cr>

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



" Test running stuff, this needs work ...
function! RunTestFile(...)
  if a:0
    let command_suffix = a:1
  else
    let command_suffix = ""
  endif

  " Run the tests for previously marked file
  let in_test_file = match(expand("%"), '\(.feature\|_spec.rb\)$') != -1
  if in_test_file
    call SetTestFile()
  elseif !exists("t:grb_test_file")
    return
  end
  call RunTests(t:grb_test_file . command_suffix)
endfunction

function! RunNearestTest()
  let spec_line_number = line('.')
  call RunTestFile(":" . spec_line_number . " -b")
endfunction

function! SetTestFile()
  " Set the spec file that tests will be run for.
  let t:grb_test_file=@%
endfunction

function! RunTests(filename)
  "write the file and run tests for given filename
  :w
  ":silent !echo;echo;echo;echo;echo;echo;echo;echo;echo;echo
  ":silent !echo;echo;echo;echo;echo;echo;echo;echo;echo;echo
  ":silent !echo;echo;echo;echo;echo;echo;echo;echo;echo;echo
  ":silent !echo;echo;echo;echo;echo;echo;echo;echo;echo;echo
  ":silent !echo;echo;echo;echo;echo;echo;echo;echo;echo;echo
  :silent !echo;echo;echo;echo;echo;echo;echo;echo;echo;echo
  if match(a:filename, '\.feature$') != -1
    exec ":!zeus cucumber " . a:filename
  else
    if filereadable("script/test")
      exec ":!script/test " . a:filename
    elseif filereadable("Gemfile")
      exec ":!zeus rspec " . a:filename
    else
      exec ":!rspec " . a:filename
    end
  end
endfunction

" Disable folding for markdown syntax plugin
let g:vim_markdown_folding_disabled=1
