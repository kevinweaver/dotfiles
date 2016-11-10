set nocompatible               " be iproved
filetype off                   " required!
"esc is far away, let's try ;; to get us out of insert mode



imap ;; <esc>

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
"set rtp+=~/.local/lib/python2.7/site-packages/powerline/bindings/vim

" let Vundle manage Vundle
" required!
 Bundle 'gmarik/vundle'
 Bundle 'tpope/vim-fugitive'
 Bundle 'tpope/vim-rails'
 Bundle 'tpope/vim-haml'
 Bundle 'tpope/vim-surround'
 Bundle 'pangloss/vim-javascript'
 Bundle 'kchmck/vim-coffee-script'
 Bundle 'vim-ruby/vim-ruby'
 Bundle 'scrooloose/nerdtree'
 Bundle 'scrooloose/syntastic'
 Bundle 'jistr/vim-nerdtree-tabs'
 Bundle 'msanders/snipmate.vim'
 Bundle 'Townk/vim-autoclose'
 Bundle 'kien/ctrlp.vim'
 "Bundle 'Valloric/YouCompleteMe'
 "Bundle 'wakatime/vim-wakatime'
 Bundle 'airblade/vim-gitgutter'
 Bundle 'Lokaltog/vim-easymotion'
 Bundle 'itchyny/calendar.vim'
 Bundle 'terryma/vim-multiple-cursors'
 Bundle 'majutsushi/tagbar'
 Bundle 'esneider/YUNOcommit.vim'
 Bundle 'christoomey/vim-tmux-navigator'
 Bundle 'bling/vim-airline'

call vundle#end()
filetype plugin indent on "req

"Vim Multiple Cursors Bindings
let g:multi_cursor_use_default_mapping=0
" Default mapping
"let g:multi_cursor_next_key='<C-n>'
let g:multi_cursor_next_key='<C-x>'
let g:multi_cursor_prev_key='<C-p>'
"let g:multi_cursor_skip_key='<C-x>'
let g:multi_cursor_quit_key='<Esc>'

"python from powerline.bindings.vim import 'source_plugin; source_plugin()

let g:nerdtree_tabs_open_on_console_startup=1
"colorscheme solarized
set background=dark

if has('gui_running')
  set guifont=Inconsolata\ 13    " set fonts for gui vim
  set guioptions=egmrt           " hide the gui menubar
endif

" ARROW KEYS ARE UNACCEPTABLE
"  map <Left> :echo "no!"<cr>
"  map <Right> :echo "no!"<cr>
"  map <Up> :echo "no!"<cr>
"  map <Down> :echo "no!"<cr>

" Pretty obvious defaults if you ask me...
  command! W :w
  command! Q :q
  command! Wq :wq
  command! WQ :wq

" Map ctrl-movement keys to window switching
 map <C-k> <C-w><Up>
 map <C-j> <C-w><Down>
 map <C-l> <C-w><Right>
 map <C-h> <C-w><Left>
 map <C-n> <plug>NERDTreeTabsToggle<CR>

 cmap w!! %!sudo tee > /dev/null/ %

set backspace=indent,eol,start
set history=100

set number        " Show line numbers
set nowrap        " Turn off Text Wrap
set scrolloff=3   " Keep more context when scrolling off the end of a buffer
set ruler         " show the cursor position all the time
set wildmenu      " Make tab completion for files/buffers act like bash
set showcmd       " display incomplete commands
set hidden        " keep undo history for background buffers
set autoread      " autoamically read the file again when it is changed externally
set showtabline=2 " always show tab bar
set term=cons25   " fix issue with arrow keys

" Editting configuration
syntax enable
set pastetoggle=<F2> 
set term=screen-256color
set ts=2
set smarttab
set showmatch
set encoding=utf-8
set noshowmode
set backup
set backupdir=~/.vim/backups
set directory=~/.vim/tmp
set noerrorbells
set timeoutlen=350
"set mousehide
set expandtab
set tabstop=2
set shiftwidth=2
set softtabstop=2
set autoindent
set smartindent

"enable fold based on indent with max level of 10
set foldmethod=indent
set foldnestmax=2
set foldlevel=100
set foldenable

set undofile                                      "allow per file undo persistance
set undoreload=10000
set undodir=~/.vim/tmp/undo//                     "undo dir
set backupdir=~/.vim/tmp/backups//                "backup dir -- // saves full filepath with % as folder delimeter
set directory=~/.vim/tmp/swap//                   "temporary dir for swap files
set backup                                        "file backups enabled
set writebackup                                   "enabling backups
set noswapfile                                    "disable swaps - were using backups in 2015

" if undo and backup directories do not exist, make them
if !isdirectory(expand(&undodir))
    call mkdir(expand(&undodir), "p")
endif
if !isdirectory(expand(&backupdir))
    call mkdir(expand(&backupdir), "p")
endif

set listchars=tab:▸\ ,eol:¬,extends:❯,precedes:❮  "show unicode characters for tab,eol,and with wrap on
set showbreak=↪

if !isdirectory(expand(&directory))
    call mkdir(expand(&directory), "p")
endif
nnoremap <leader>ww mz:%s/\s\+$//<cr>:let @/=''<cr>`z
"clears eol whitespace

nmap <f3> :TagbarToggle<CR>

" set smartindent
set laststatus=2
set statusline=%<%f\ (%{&ft})\ %-4(%m%)%=%-19(%3l,%02c%03V%)

"Search Stuff
  set hlsearch  " highlight previous search matches
  set incsearch " search as you type
  " Make searches case-sensitive only if they contain upper-case characters
  set ignorecase
  set smartcase
  "pressing enter key in command mode removes search highlighting
  nnoremap <CR> :nohlsearch <CR>
  nnoremap Q <nop>

"set mouse=a

"Highlight trailing whitespace in red
:highlight ExtraWhitespace ctermbg=red guibg=red
:au InsertEnter * match ExtraWhitespace /\s\+\%#\@<!$/
:au InsertLeave * match ExtraWhitespace /\s\+$/
:match ExtraWhitespace /\s\+$/           " Show trailing whitespace
:match ExtraWhitespace /\s\+$\| \+\ze\t/ " Show trailing whitespace and spaces before a tab
:match ExtraWhitespace /[^\t]\zs\t\+/    " Show tabs that are not at the start of a line

cnoreabbrev td tab drop

"syntax on
"if has("autocmd")
"filetype plugin indent on
"	au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g`\"" | endif
"else
"	set autoindent
"endif


" Remap the tab key to do autocompletion or indentation depending on the
" context (from http://www.vim.org/tips/tip.php?tip_id=102)
"function! InsertTabWrapper()
"  let col = col('.') - 1
"  if !col || getline('.')[col - 1] !~ '\k'
"    return "\<tab>"
"  else
"    return "\<c-p>"
"  endif
"endfunction
"inoremap <tab> <c-r>=InsertTabWrapper()<cr>
"inoremap <s-tab> <c-n>

let mapleader=","

map <leader>t :w\|!rspec --drb --color %<cr>

" fix so powerline updates faster 
"if ! has('gui_running')
"    set ttimeoutlen=10
"    augroup FastEscape
"        autocmd!
"        au InsertEnter * set timeoutlen=0
"        au InsertLeave * set timeoutlen=1000
"    augroup END
"endif
"set rtp+=/home/kevin/.local/lib/python2.7/site-packages/powerline/bindings/vim

let g:calendar_google_calendar = 1
let g:calendar_google_task = 1
