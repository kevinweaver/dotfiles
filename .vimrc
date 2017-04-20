set nocompatible               " be iproved
filetype off                   " required!
"esc is far away, let's try ;; to get us out of insert mode
imap ;; <esc>

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
"set rtp+=~/.local/lib/python2.7/site-packages/powerline/bindings/vim

" let Vundle manage Vundle
" required!

"Look into
"emmet
"fxf
"ultisnips
"honza/vim-snippets
"TODO  Switch to (or just add) vim-plug for plugins
"

Plugin 'gmarik/vundle'
Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-rails'
Plugin 'tpope/vim-haml'
Plugin 'tpope/vim-surround'
Plugin 'pangloss/vim-javascript'
Plugin 'kchmck/vim-coffee-script'
Plugin 'vim-ruby/vim-ruby'
Plugin 'scrooloose/nerdtree'
Plugin 'scrooloose/syntastic'
Plugin 'jistr/vim-nerdtree-tabs'
Plugin 'msanders/snipmate.vim'
Plugin 'Townk/vim-autoclose'
Plugin 'Raimondi/delimitMate'
Plugin 'Valloric/YouCompleteMe'
Plugin 'ctrlp/ctrlp.vim'
Plugin 'wakatime/vim-wakatime'
Plugin 'airblade/vim-gitgutter'
Plugin 'itchyny/calendar.vim'
Plugin 'terryma/vim-multiple-cursors'
Plugin 'majutsushi/tagbar'
Plugin 'esneider/YUNOcommit.vim'
Plugin 'christoomey/vim-tmux-navigator'
Plugin 'bling/vim-airline'
Plugin 'leafgarland/typescript-vim'
Plugin 'easymotion/vim-easymotion'
Plugin 'wincent/command-t'
Plugin 'mileszs/ack.vim'

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
"6 characters before you complete me kicks in
let g:ycm_min_num_of_chars_for_completion = 6
"python from powerline.bindings.vim import 'source_plugin; source_plugin()
let g:nerdtree_tabs_open_on_console_startup=0
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
set belloff=all
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
set noswapfile                                    "disable swaps - were using backups in 2017

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

"let mapleader="\\"

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



" bind K to grep word under cursor
nnoremap K :grep! "\b<C-R><C-W>\b"<CR>:cw<CR>

:nnoremap <LeftMouse> m'<LeftMouse>
:nnoremap <LeftRelease> <LeftRelease>g``

"use ag for ack.vim
if executable('ag')
  let g:ackprg = 'ag --vimgrep'
endif

"do not have ack jump to first response
cnoreabbrev Ack Ack!
"ack for the current word under cursor
nnoremap <Leader>a :Ack!<Space><C-R><C-W>
