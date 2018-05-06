""""""""""""""""""""
" Minimal Vim Config - Gerald Ke
"
" Dependencies - silversearcher-ag
"
""""""""""""""""""""

"""""""""
" General
"""""""""

" Lines of history VIM has to remember
set history=1000

" Map leader for extra key combinations
let mapleader = ","
let g:mapleader = ","

"""""""""
" Plugins
"""""""""

" Install Vim Plug
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin('~/.vim/plugged')

Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
Plug 'ctrlpvim/ctrlp.vim',  { 'on': '<Plug>CtrlP' }
Plug 'mhinz/vim-grepper'
Plug 'chriskempson/vim-tomorrow-theme'

call plug#end()

" NERDTree
map <C-n> :NERDTreeToggle<CR>

" ctrlp
set runtimepath^=~/.vim/plugged/ctrlp.vim
let g:ctrlp_match_window = 'results:100'

" Use SilverSearcher with Ctrl_p
if executable('ag')
  " Use ag in CtrlP for listing files. Lightning fast and respects .gitignore
  let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'

  " ag is fast enough that CtrlP doesn't need to cache
  let g:ctrlp_use_caching = 0
endif

""""
" UI
""""

" Set 7 lines to the cursor - when moving vertically using j/k
set so=7

" Turn on the wild menu
set wildmenu

" Always show current position
set ruler

" Height of the command bar
set cmdheight=2

" Don't redraw while executing macros (good performance config)
set lazyredraw

" Show matching brackets when text indicator is over them
set showmatch

" How many tenths of a second to blink when matching brackets
set mat=2

" No annoying sound on errors
set noerrorbells
set novisualbell
set t_vb=
set tm=500

" Highlight current line
set cursorline

" Add mouse support
set mouse=a

" Show line numbers
set number

""""""""""""""""""
" Colors and Fonts
""""""""""""""""""

syntax enable

if !empty(glob('~/.vim/plugged/vim-tomorrow-theme/colors/Tomorrow-Night.vim'))
  colorscheme Tomorrow-Night
else
  colorscheme peachpuff
endif

" Enable 256 colors palette in Gnome Terminal
set t_Co=256

" Use Unix as the standard file type
set ffs=unix,dos,mac

""""""""
" Search
""""""""

" Ignore case when searching
set ignorecase

" When searching try to be smart about cases
set smartcase

" Highlight search results
set hlsearch

" Makes search act like search in modern browsers
set incsearch

"""""""
" Files
"""""""

" Turn backup off, since most stuff is in SVN, git et.c anyway...
set nobackup
set nowb
set noswapfile

""""""
" Text
""""""

" Use spaces instead of tabs
set expandtab

" Be smart when using tabs
set smarttab

" 1 tab == 2 spaces
set shiftwidth=2
set tabstop=2

" Delete trailing spaces
autocmd BufWritePre * :%s/\s\+$//e

" Linebreak on 500 characters
set lbr
set tw=500

" Set utf8 as standard encoding and en_US as the standard language
set encoding=utf8

" Configure backspace so it acts as it should act
set backspace=eol,start,indent
set whichwrap+=<,>,h,l

set ai "Auto indent
set si "Smart indent
set nowrap

" Toggle paste mode on and off
map <leader>pp :setlocal paste!<cr>

"""""""""""""""
" Moving around
"""""""""""""""

" Smart way to move between windows
map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-h> <C-W>h
map <C-l> <C-W>l

" Return to last edit position when opening files (You want this!)
au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif

" Move a line of text using ALT+[jk] or Command+[jk]
nmap <C-j> mz:m+<cr>`z
nmap <C-k> mz:m-2<cr>`z
vmap <C-j> :m'>+<cr>`<my`>mzgv`yo`z
vmap <C-k> :m'<-2<cr>`>my`<mzgv`yo`z

""""""
" Misc
""""""

" Disable Arrow keys in Escape mode
map <up> <nop>
map <down> <nop>
map <left> <nop>
map <right> <nop>

" Disable Arrow keys in Insert mode
imap <up> <nop>
imap <down> <nop>
imap <left> <nop>
imap <right> <nop>

