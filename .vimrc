set nocompatible               " be iproved
filetype off                   " required!

"esc is far away, Use ;; to get us out of insert mode
"imap ;; <esc>

"Map ; to : for speeeed
:nmap ; :

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
Plugin 'jgdavey/tslime.vim'               "Send tmux commands in vim (isn't working)
Plugin 'benmills/vimux'                   "Run Tmux commands from vim in 20% window

"Git Plugins
Plugin 'airblade/vim-gitgutter'
Plugin 'tpope/vim-fugitive'               "Adds git commands like :Gdiff, :Gstatus

"Search Plugins
Plugin 'tpope/vim-unimpaired'
Plugin 'msanders/snipmate.vim'
Plugin 'ctrlp/ctrlp.vim'                  "Allows for fuzzy file search
Plugin 'mileszs/ack.vim'                  "
Plugin 'tpope/vim-bundler'

"Syntax Highlighting Plugins
Plugin 'scrooloose/syntastic'
Plugin 'tpope/vim-rails'                  "Syntax + error highlight for rails
Plugin 'tpope/vim-haml'                   "Syntax highlight for haml
Plugin 'pangloss/vim-javascript'
Plugin 'kchmck/vim-coffee-script'
Plugin 'vim-ruby/vim-ruby'
Plugin 'leafgarland/typescript-vim'
Plugin 'fatih/vim-go'
Plugin 'tomlion/vim-solidity'             "Syntax highlight Eth lang
Plugin 'mxw/vim-jsx'

"External Pugins
Plugin 'hashrocket/vim-macdown'          "Use \p to live reload markdown files in MacDown app
Plugin 'junegunn/goyo.vim'

call vundle#end()
filetype plugin indent on "req

"Plugin

"Vim Multiple Cursors Bindings
let g:multi_cursor_use_default_mapping=0
" Default mapping
"let g:multi_cursor_next_key='<C-n>'
"let g:multi_cursor_next_key='<C-x>'
"let g:multi_cursor_prev_key='<C-p>'
"let g:multi_cursor_skip_key='<C-x>'
"let g:multi_cursor_quit_key='<Esc>'
"6 characters before you complete me kicks in
let g:ycm_min_num_of_chars_for_completion = 6
"python from powerline.bindings.vim impor 'source_plugin; source_plugin()
let g:nerdtree_tabs_open_on_console_startup=0
let NERDTreeShowHidden=1
"colorscheme solarized
set background=dark

if has('gui_running')
  set guifont=Inconsolata\ 13    " set fonts for gui vim
  set guioptions=egmrt           " hide the gui menubar
endif

" Allow for mistakes
command! W :w
command! Q :q
command! Wq :wq
command! WQ :wq

"=============MOVEMENT==============

"Map ctrl+t to copy out of vim
vnoremap <C-t> "+y

" Map ctrl-movement keys to window switching
map <C-k> <C-w><Up>
map <C-j> <C-w><Down>
map <C-l> <C-w><Right>
map <C-h> <C-w><Left>

" Map command-movement keys to buffer switching
" NOTE: These only work in MacVim.  For support in default vim, add keyboard
" shortcut in iTerm preferences using action 'Send Text with vim special chars'
map <D-h> :bp<CR>
map <D-l> :bn<CR>

"Nerdtree maps

"Open/close nerdtree
map <C-n> <plug>NERDTreeTabsToggle<CR>
"map <C-n> <plug>NERDTreeTabsToggle<CR> :TagbarToggle<CR>

"Render the current file's folder
map <leader>n :NERDTreeFind<cr>
"Reload nerdtree
nmap <Leader>r :NERDTreeFocus<cr>R<c-w><c-p>

"Ctags
"map \c to run ctags in folder
map <Leader>c :! ctags -R -f ./.git/tags .<CR>
set tags=tags
" Ctrl+[ to so that manuevering ctags is simply Ctrl+] to go down and Ctrl+[ to go up
nnoremap <Leader>[ <C-t>
nnoremap <Leader>] <C-]>

"Tagbar maps
map <C-m> :TagbarToggle<CR>

cmap w!! %!sudo tee > /dev/null/ %

set backspace=indent,eol,start " make backspace work like most other programs
set history=1024               " Set

set number                 " Show line numbers
"set relativenumber        " Show relative line numbers

"set number relativenumber

"augroup numbertoggle
"  autocmd!
"  autocmd BufEnter,FocusGained,InsertLeave * set relativenumber
"  autocmd BufLeave,FocusLost,InsertEnter   * set norelativenumber
"augroup END
set nowrap        " Turn off Text Wrap
"But allow for wrap toggle with \w
map <Leader>w :call ToggleWrap()<CR>
function ToggleWrap()
 if (&wrap == 1)
   set nowrap
 else
   set wrap
 endif
endfunction

set scrolloff=3   " Keep more context when scrolling off the end of a buffer
set ruler         " show the cursor position all the time
set wildmenu      " Make tab completion for files/buffers act like bash
set showcmd       " display incomplete commands
set hidden        " keep undo history for background buffers
set autoread      " autoamically read the file again when it is changed externally
set showtabline=2 " always show tab bar
set term=cons25   " fix issue with arrow keys
set autoread | au CursorHold * checktime | call feedkeys("lh")  " auto refresh vim if current files change outside vim

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
set expandtab                         "Expand tabs to use the real number of spaces
set tabstop=2                         "
set shiftwidth=2
set softtabstop=2
set autoindent
set smartindent

"enable fold based on indent with max level of 10
set foldmethod=indent
set foldnestmax=2
set foldlevel=100
set foldenable

set undofile                           "allow per file undo persistance
set undoreload=10000                   " how many times can you undo
set undodir=~/.vim/tmp/undo//          "undo dir
set backupdir=~/.vim/tmp/backups//     "backup dir -- // saves full filepath with % as folder delimeter
set directory=~/.vim/tmp/swap//        "temporary dir for swap files
set backup                             "file backups enabled
set writebackup                        "enabling backups
set noswapfile                         "disable swaps - were using backups in the distant future

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
set ignorecase    " search ignores casing
set smartcase     " if an upcase exists,

"pressing enter key in command mode removes search highlighting
nnoremap <CR> :nohlsearch <CR>
nnoremap Q <nop>

"Highlight trailing whitespace in red
":highlight ExtraWhitespace ctermbg=red guibg=red
":au InsertEnter * match ExtraWhitespace /\s\+\%#\@<!$/
":au InsertLeave * match ExtraWhitespace /\s\+$/
":match ExtraWhitespace /\s\+$/           " Show trailing whitespace
":match ExtraWhitespace /\s\+$\| \+\ze\t/ " Show trailing whitespace and spaces before a tab
":match ExtraWhitespace /[^\t]\zs\t\+/    " Show tabs that are not at the start of a line

"Automatically strip trailing whitespace on save
autocmd BufWritePre * %s/\s\+$//e

cnoreabbrev td tab drop


" tslime.vim - Specs running in Tmux
let g:rspec_command = 'call Send_to_Tmux("bundle exec rspec {spec}\n")'


" RSpec.vim mappings
map <Leader>t :call RunCurrentSpecFile()<CR>
map <Leader>g :call RunNearestSpec()<CR>
map <Leader>l :call RunLastSpec()<CR>
"map <Leader>a :call RunAllSpecs()<CR>

"Open Spec file in vertical pane
map <Leader>s :vs<CR>\| :A<CR>

"Spring rspec
"let g:rspec_command = '!spring rspec {spec}'

let g:calendar_google_calendar = 1
let g:calendar_google_task = 1


" bind K to grep word under cursor
nnoremap K :grep! "\b<C-R><C-W>\b"<CR>:cw<CR>

"Ack
"use ag for ack.vim
if executable('ag')
  let g:ackprg = 'ag --vimgrep'
endif

"ack for the current word under cursor
nnoremap <Leader>a :Ack!<Space><C-R><C-W>
"do not have ack jump to first response
cnoreabbrev Ack Ack!

"Mouse Settings
set mouse=a            "enable mouse
if &term =~ '^screen'
  set ttymouse=xterm2  " tmux knows the extended mouse mode
endif
"nnoremap <LeftMouse> m'<LeftMouse>
"nnoremap <LeftRelease> <LeftRelease>g``

"CtrlP
nnoremap <leader>. :CtrlPTag<cr>
let g:ctrlp_user_command = ['.git/', 'git --git-dir=%s/.git ls-files -oc --exclude-standard']

"Hide everything
"map <Leader>h :set number! relativenumber!<CR> :GitGutterToggle<CR>
map <Leader>m :set number!<CR> :GitGutterToggle<CR>


"===========COPY==============
"bind ctrl+c to copy
"vmap <C-c> "+y
"nmap <C-c> :.w !pbcopy<CR><CR>
"vnoremap :w !cp /dev/null ~/temp.txt && cat > ~/temp.txt
"noremap :r !cat ~/temp.txt

"vnoremap <C-t> "+y
"vnoremap <C-p> "+gP
"set clipboard=unnamed "this breaks yy copy

" Auto open tagbar
"autocmd VimEnter * nested :call tagbar#autoopen(1)

nmap <F12> :vs ~/github.com/kevinweaver/dotfiles.wiki/<CR>
nmap <F9> :vs ~/dotfiles/.vimrc<CR>
nmap <F8> :TagbarToggle<CR>
nmap <F7> :vs ~/dotfiles/.snippets.json<CR>

"Emmet Plugin
let g:user_emmet_settings = webapi#json#decode(join(readfile(expand('~/.snippets.json')), "\n"))
let g:user_emmet_expandabbr_key = '<Tab>'


"Plugin: Airline - Used to display top and bottom bars for tabs and file info
let g:airline#extensions#tabline#enabled = 1     " Enable the list of buffers
let g:airline#extensions#tabline#fnamemod = ':t' " Show just the filename
let g:airline#extensions#tabline#left_sep = ' '
"let g:airline_theme='base16_railscasts'

" Function that will create directories on save if necessary:
function s:MkNonExDir(file, buf)
    if empty(getbufvar(a:buf, '&buftype')) && a:file!~#'\v^\w+\:\/'
        let dir=fnamemodify(a:file, ':h')
        if !isdirectory(dir)
            call mkdir(dir, 'p')
        endif
    endif
endfunction
augroup BWCCreateDir
    autocmd!
    autocmd BufWritePre * :call s:MkNonExDir(expand('<afile>'), +expand('<abuf>'))
augroup END
