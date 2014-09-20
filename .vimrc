set nocompatible

" allow % to jump between beginning and end of blocks
runtime macros/matchit.vim

"Bundle plugins!
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()
Bundle 'gmarik/vundle'
Bundle 'Lokaltog/vim-easymotion'
Bundle 'kien/ctrlp.vim'
Bundle 'chriskempson/base16-vim'
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

set term=screen-16color
set t_Co=16
set background=dark
" let base16colorspace=256
colorscheme base16-monokai

set statusline=
set statusline +=%1*\ %n\ %*            "buffer number
set statusline +=%5*%{&ff}%*            "file format
set statusline +=%3*%y%*                "file type
set statusline +=%4*\ %<%F%*            "full path
set statusline +=%2*%m%*                "modified flag
set statusline +=%1*%=%5l%*             "current line
set statusline +=%2*/%L%*               "total lines
set statusline +=%1*%4v\ %*             "virtual column number
set statusline +=%2*0x%04B\ %*          "character under cursor
" "Vim AIRLINE
" set encoding=utf-8
" let g:airline_powerline_fonts = 1
" " let g:airline_theme='solarized'
" set laststatus=2

set guifont=Inconsolata\ for\ Powerline

" misc settings
set backspace=indent,eol,start
set synmaxcol=100  " only highlight to a certain column (for perf)
set ts=2 sts=2 sw=2 expandtab "Convert tabs to 2 spaces
set number      " line numbers
"set rnu         " relative line nums
set nowrap
set hidden
set autoindent  " always autoindent
set hlsearch    " highlight search terms
set incsearch   " show search matches as you type
set history=50
set undolevels=50
set nobackup
set noswapfile
filetype plugin indent on
set ignorecase smartcase
" If a file is changed outside of vim, automatically reload it without asking
set autoread
au FocusGained,BufEnter * :silent! !

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
"command G Git
cnoreabbrev G Git
nmap <leader>gs :Gstatus<CR><C-w>20+
nmap <leader>gd :Git diff<CR>
nmap <leader>gc :Gcommit<CR>

nnoremap <Space> $

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


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Reset VIM
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
function! Reset()
  execute "2,2000bd"
  execute "normal \<C-w>v"
  execute "normal \<C-w>v"
endfunction

map <F3> :call Reset()<CR>

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Read files as appropriate
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
autocmd BufNewFile,BufRead Gemfile set filetype=ruby
autocmd BufNewFile,BufRead Guardfile set filetype=ruby
autocmd BufNewFile,BufRead Rakefile set filetype=ruby
autocmd BufNewFile,BufReadPost *.ino,*.pde set filetype=cpp

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Disable folding for markdown syntax plugin
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:vim_markdown_folding_disabled=1

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" configure vim-rspec
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
map <Leader>r :call RunCurrentSpecFile()<CR>
map <Leader>s :call RunNearestSpec()<CR>
map <Leader>l :call RunLastSpec()<CR>
map <Leader>a :call RunAllSpecs()<CR>
let g:rspec_patterns = [
                       \ [ '\v^app/(.+)\.rb$', "spec/{MATCH1}_spec.rb" ]
                     \ ]
let g:rspec_command = "!bin/rspec {spec}"

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" highlight trailing whitespace
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
:highlight ExtraWhitespace ctermbg=red guibg=red
autocmd Syntax * syn match ExtraWhitespace /\s\+$\| \+\ze\t/

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" convert "This is a Description" => this_is_a_description
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
nnoremap <Leader>u Vi" :<C-w>%s/\%V,*\s/_/g<CR> :normal ds" guaW<CR>

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Use The Silver Searcher https://github.com/ggreer/the_silver_searcher
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
if executable('ag')
  " Use Ag over Grep
  set grepprg=ag\ --nogroup\ --nocolor

  " Use ag in CtrlP for listing files. Lightning fast and respects .gitignore
  let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'
endif

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" MULTIPURPOSE TAB KEY
" Indent if we're at the beginning of a line. Else, do completion.
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
function! InsertTabWrapper()
    let col = col('.') - 1
    if !col || getline('.')[col - 1] !~ '\k'
        return "\<tab>"
    else
        return "\<c-p>"
    endif
endfunction
inoremap <tab> <c-r>=InsertTabWrapper()<cr>
inoremap <s-tab> <c-n>
