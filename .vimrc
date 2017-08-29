set nocompatible               " be iproved
filetype off                   " required!
"esc is far away, let's try ;; to get us out of insert mode
imap ;; <esc>

"Map ; to : for speeeed
":nmap ; :

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
"set rtp+=~/.local/lib/python2.7/site-packages/powerline/bindings/vim


"Manage Plugins
Plugin 'gmarik/vundle'                    "Vim plugin manager

"Autocomplete Plugins
Plugin 'alvan/vim-closetag'
Plugin 'tpope/vim-surround'               "Adds 'cs' command to change pair characters
Plugin 'Townk/vim-autoclose'              "Adds closing pairs
Plugin 'Raimondi/delimitMate'
Plugin 'terryma/vim-multiple-cursors'
Plugin 'mattn/emmet-vim'                  "Adds snippets
Plugin 'mattn/webapi-vim'
Plugin 'tpope/vim-endwise'                "Auto-close ruby elements
"Plugin 'Valloric/YouCompleteMe'

"Layout
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'

"Navigation Plugins
Plugin 'scrooloose/nerdtree'
Plugin 'scrooloose/nerdcommenter'         "Adds easy comment and uncomment
Plugin 'jistr/vim-nerdtree-tabs'
Plugin 'majutsushi/tagbar'
Plugin 'christoomey/vim-tmux-navigator'
Plugin 'easymotion/vim-easymotion'

"Functional Plugins
Plugin 'itchyny/calendar.vim'
Plugin 'esneider/YUNOcommit.vim'
Plugin 'wincent/command-t'
Plugin 'thoughtbot/vim-rspec'

"Git Plugins
Plugin 'airblade/vim-gitgutter'
Plugin 'tpope/vim-fugitive'               "Adds git commands like :Gdiff, :Gstatus

"Search Plugins
Plugin 'tpope/vim-unimpaired'
Plugin 'msanders/snipmate.vim'
Plugin 'ctrlp/ctrlp.vim'
Plugin 'mileszs/ack.vim'

"Syntax Highlighting Plugins
Plugin 'scrooloose/syntastic'
Plugin 'tpope/vim-rails'                  "Syntax + error highlight for rails
Plugin 'tpope/vim-haml'                   "Syntax highlight for haml
Plugin 'pangloss/vim-javascript'
Plugin 'kchmck/vim-coffee-script'
Plugin 'vim-ruby/vim-ruby'
Plugin 'leafgarland/typescript-vim'


call vundle#end()
filetype plugin indent on "req

"Plugin

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
"python from powerline.bindings.vim impor 'source_plugin; source_plugin()
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

"Map ctrl+t to copy out of vim
vnoremap <C-t> "+y


" Map ctrl-movement keys to window switching
 map <C-k> <C-w><Up>
 map <C-j> <C-w><Down>
 map <C-l> <C-w><Right>
 map <C-h> <C-w><Left>
 map <C-n> <plug>NERDTreeTabsToggle<CR>
 nmap <Leader>r :NERDTreeFocus<cr>R<c-w><c-p>
 map <C-m> :TagbarToggle<CR>

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

"map pasting
"nnoremap <C-p> "+gP
"vnoremap <C-p> "+gP
"set clipboard=unnamedplus

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

"Highlight trailing whitespace in red
:highlight ExtraWhitespace ctermbg=red guibg=red
:au InsertEnter * match ExtraWhitespace /\s\+\%#\@<!$/
:au InsertLeave * match ExtraWhitespace /\s\+$/
:match ExtraWhitespace /\s\+$/           " Show trailing whitespace
:match ExtraWhitespace /\s\+$\| \+\ze\t/ " Show trailing whitespace and spaces before a tab
:match ExtraWhitespace /[^\t]\zs\t\+/    " Show tabs that are not at the start of a line

cnoreabbrev td tab drop

" RSpec.vim mappings
map <Leader>t :call RunCurrentSpecFile()<CR>
map <Leader>g :call RunNearestSpec()<CR>
map <Leader>l :call RunLastSpec()<CR>
map <Leader>a :call RunAllSpecs()<CR>
"Spring rspec
"let g:rspec_command = '!spring rspec {spec}'
let g:rspec_command = '!RAILS_ENV=test bundle exec rspec {spec} --color --profile'

let g:calendar_google_calendar = 1
let g:calendar_google_task = 1


" bind K to grep word under cursor
nnoremap K :grep! "\b<C-R><C-W>\b"<CR>:cw<CR>

"use ag for ack.vim
if executable('ag')
  let g:ackprg = 'ag --vimgrep'
endif

"do not have ack jump to first response
cnoreabbrev Ack Ack!
"ack for the current word under cursor
nnoremap <Leader>a :Ack!<Space><C-R><C-W>

"Mouse Settings
"set clipboard=unnamed
set mouse=a            "enable mouse
if &term =~ '^screen'
  set ttymouse=xterm2  " tmux knows the extended mouse mode
endif
nnoremap <LeftMouse> m'<LeftMouse>
nnoremap <LeftRelease> <LeftRelease>g``
nnoremap <leader>. :CtrlPTag<cr>
map <Leader>h :set number!<CR> :GitGutterToggle<CR>


"bind ctrl+c to copy
vmap <C-c> "+y
"vnoremap :w !cp /dev/null ~/temp.txt && cat > ~/temp.txt
"noremap :r !cat ~/temp.txt

" Auto open tagbar
"autocmd VimEnter * nested :call tagbar#autoopen(1)
nmap <F8> :TagbarToggle<CR>

nmap <F12> :vs ~/github.com/kevinweaver/dotfiles.wiki/Sharpen.md<CR>
nmap <F9> :vs ~/dotfiles/.vimrc<CR>

"Emmet Plugin
let g:user_emmet_settings = webapi#json#decode(join(readfile(expand('~/.snippets.json')), "\n"))

"Plugin: Airline
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#left_sep = ' '
"let g:airline_theme='base16_railscasts'
