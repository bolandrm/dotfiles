set nocompatible

" allow % to jump between beginning and end of blocks
runtime macros/matchit.vim

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
Bundle 'tpope/vim-bundler'
Bundle 'tpope/vim-abolish'
Bundle 'scrooloose/nerdtree'
Bundle 'nono/vim-handlebars'
Bundle 'plasticboy/vim-markdown'
Bundle 'slim-template/vim-slim'
Bundle 'bolandrm/vim-rspec'
Bundle 'kana/vim-textobj-user'
Bundle 'nelstrom/vim-textobj-rubyblock'

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
set synmaxcol=150  " only highlight to a certain column (for perf)

set ts=2 sts=2 sw=2 expandtab "Convert tabs to 2 spaces
set number      " line numbers
"set rnu         " relative line nums
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

" Sets up NERDTree
" Opens in small left vertical split
let g:NERDTreeHijackNetrw = 0
let g:loaded_netrw = 1
let g:loaded_netrwPlugin = 1
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif

if argc() == 1 && argv(0) == '.'
  if !empty($VT)
    autocmd vimenter * NERDTree
  endif

  autocmd vimenter * wincmd w
  if !empty($VL)
    autocmd vimenter * wincmd v
    autocmd vimenter * wincmd v
  endif
endif

" Read Rakefile and Gemfile as ruby
autocmd BufNewFile,BufRead Gemfile set filetype=ruby
autocmd BufNewFile,BufRead Guardfile set filetype=ruby
autocmd BufNewFile,BufRead Rakefile set filetype=ruby

" Disable folding for markdown syntax plugin
let g:vim_markdown_folding_disabled=1

" ctrl p - ignore files
set wildignore+=*/source_maps/*,*/tmp/*

" configure vim-rspec
map <Leader>r :call RunCurrentSpecFile()<CR>
map <Leader>s :call RunNearestSpec()<CR>
map <Leader>l :call RunLastSpec()<CR>
map <Leader>a :call RunAllSpecs()<CR>
let g:rspec_patterns = [
                       \ [ '\v^app/.+_controller\.rb$', "spec/features" ],
                       \ [ '\v^app/.+(\.js|\.coffee)$', "spec/features" ],
                       \ [ '\v^app/(.+)\.rb$', "spec/{MATCH1}_spec.rb" ]
                     \ ]


" use ctrl-d to open shell
noremap <C-d> :sh<cr>

" highlight trailing whitespace
:highlight ExtraWhitespace ctermbg=red guibg=red
autocmd Syntax * syn match ExtraWhitespace /\s\+$\| \+\ze\t/

" convert "This is a Description" => this_is_a_description
nnoremap <Leader>u Vi" :<C-w>%s/\%V,*\s/_/g<CR> :normal ds" guaW<CR>

" Use The Silver Searcher https://github.com/ggreer/the_silver_searcher
if executable('ag')
  " Use Ag over Grep
  set grepprg=ag\ --nogroup\ --nocolor

  " Use ag in CtrlP for listing files. Lightning fast and respects .gitignore
  let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'
endif
