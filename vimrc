" Leader key
let mapleader = ","

set binary
set nocompatible      " Be iMproved
set nobackup
set nowritebackup
set noswapfile
set incsearch         " Enable incremental searching
set expandtab
set tabstop=2
set shiftwidth=2
set softtabstop=2
set smarttab
set autoindent
set nowrap

" allow vim to put buffers on the background without writing to disk and
" remember history and marks when buffer becomes current
set hidden

" shows file title when editing
set title

" fold settings
"set foldmethod=syntax
"set foldlevelstart=2
"set foldnestmax=3

set number
set history=100       " Save the last 100 commands/search terms
set laststatus=2      " Always display the status line

" search settings
set hlsearch
set ignorecase        " Ignore case in searches.
set smartcase         " Case sensitive if capitals are included.

set autoread          " automatically reload a file if it's changed outside vim

set backspace=indent,eol,start " backspace deletes back

" Use Ag instead of Grep when available
if executable("ag")
  set grepprg=ag\ --nogroup\ --nocolor\ --column

  " Automatically include quotes, because they never hurt and forgetting them is a pain.
  " Use <Leader>a to prompt you for an Ag search
  nnoremap <Leader>a :Ag!<SPACE>"<LEFT>"

  " Use <Leader>A to ag for the word under the cursor
  nnoremap <leader>A *<C-O>:AgFromSearch!<CR>

  let g:ctrlp_user_command = 'ag %s -l --nocolor --ignore-dir ./spec/reports -g ""'
else
  " Use Ack instead of Grep when available
  if executable("ack")
    set grepprg=ack\ -H\ --nogroup\ --nocolor

    " Automatically include quotes, because they never hurt and forgetting them is a pain.
    " Use <Leader>a to prompt you for an Ack search
    nnoremap <Leader>a :Ack!<SPACE>"<LEFT>"

    " Use <Leader>A to Ack for the word under the cursor
    nnoremap <leader>A *<C-O>:AckFromSearch!<CR>
  endif
endif

set tags=./tags;       " TagList

set gfn=Meslo\ LG\ S\ for\ Powerline:h11

" check to make sure vim has been compiled with colorcolumn support before enabling it
if exists("+colorcolumn")
  set colorcolumn=120
endif

syntax on             " Enable syntax highlighting
filetype off           " Enable filetype detection

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" Let Vundle manage Vundle
Plugin 'gmarik/Vundle.vim'

" Original repos on github
Plugin 'airblade/vim-gitgutter'
Plugin 'kien/ctrlp.vim'
Plugin 'Lokaltog/vim-easymotion'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'jelera/vim-javascript-syntax'
Plugin 'maxbrunsfeld/vim-yankstack'
Plugin 'rking/ag.vim'
Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}
Plugin 'scrooloose/nerdtree'
Plugin 'Raimondi/delimitMate'
Plugin 'sjl/gundo.vim'
Plugin 'tpope/vim-endwise'
Plugin 'tpope/vim-bundler'
Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-rails.git'
Plugin 'vim-ruby/vim-ruby'
Plugin 'vim-scripts/ctags.vim'
Plugin 'vim-scripts/tComment'
Plugin 'derekwyatt/vim-scala'
Plugin 'thoughtbot/vim-rspec'

" Colorschemes
Plugin 'tomasr/molokai'

call vundle#end()

" Syntax and indent
set showmatch  "Show matching bracets when text indicator is over them

" Switch on filetype detection and loads
filetype plugin indent on     " required!
filetype on
set autoindent " Copy indent from the row above
set si " Smart indent

" Brief help
" :PluginList          - list configured bundles
" :PluginInstall(!)    - install(update) bundles
" :PluginSearch(!) foo - search(or refresh cache first) for foo
" :PluginClean(!)      - confirm(or auto-approve) removal of unused bundles
"
" see :h vundle for more details or wiki for FAQ
" NOTE: comments after Plugin command are not allowed..

" CtrlP configuration
let g:ctrlp_map = '<Leader>f'

" Vim gutter configuration
let g:gitgutter_enabled = 1

" Airline/Powerline configuration
let g:airline_powerline_fonts = 1
let g:airline_theme='powerlineish'

" Center screen when scrolling search results
nmap n nzz
nmap N Nzz

" Yankstack configuration
let g:yankstack_map_keys = 0
nmap <leader>v <Plug>yankstack_substitute_older_paste
nmap <leader>V <Plug>yankstack_substitute_newer_paste

" Available colorschemes
colorscheme molokai

" Go learn vim
nnoremap <Left> :echoe "Use h"<CR>
nnoremap <Right> :echoe "Use l"<CR>
nnoremap <Up> :echoe "Use k"<CR>
nnoremap <Down> :echoe "Use j"<CR>

" Automatically change to the current directory
nnoremap <Leader>cd :cd %:p:h<CR>:pwd<CR>

" Turn search highlight off
nnoremap <leader><space> :noh<cr>

" Gundo default key
nnoremap <F5> :GundoToggle<CR>

" Navigate in buffers.
map <Leader>n :bnext<CR>
map <Leader>p :bprevious<CR>

" Navigate in splits.
nnoremap <Leader>h <C-w>h
nnoremap <Leader>j <C-w>j
nnoremap <Leader>k <C-w>k
nnoremap <Leader>l <C-w>l

" use C-j and C-k to 'bubble' lines (see
" " http://vimcasts.org/episodes/bubbling-text/)
map <C-j> ddp
map <C-k> ddkP

" NerdTree
map <Leader>t :NERDTreeToggle<CR>
nnoremap <F1> :NERDTreeFind<CR>

" Generate ctags
map <leader>ct :!ctags --extra=+f --languages=-javascript --exclude=.git --exclude=log -R .<CR>

" When vimrc, either directly or via symlink, is edited, automatically reload it
autocmd! bufwritepost .vimrc source %
autocmd! bufwritepost vimrc source %

" RSpec.vim mappings
let g:rspec_runner = "os_x_iterm2"
let g:rspec_command = "!bundle exec rspec {spec}"
map <Leader>q :call RunCurrentSpecFile()<CR>
map <Leader>w :call RunNearestSpec()<CR>
map <Leader>e :call RunLastSpec()<CR>
map <Leader>r :call RunAllSpecs()<CR>

""""""""""""""""""""""""""""""""""
" Some other comfy settings
""""""""""""""""""""""""""""""""""
com W w
set nocompatible "Not vi compatible (Vim is king)

" set nu " Number lines
set hls " highlight search
set lbr " linebreak
