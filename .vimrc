set nocompatible               " be improved
filetype plugin on                   " required!

"esc is far away, Use ;; to get us out of insert mode
"imap ;; <esc>

"Map ; to : for speeeed
:nmap ; :

set rtp+=~/.vim/bundle/Vundle.vim
"call vundle#begin()
call plug#begin()
"set rtp+=~/.local/lib/python2.7/site-packages/powerline/bindings/vim


"Manage Plugins
Plug 'gmarik/vundle'                    "Vim plugin manager

"Autocomplete Plugins
Plug 'alvan/vim-closetag'
Plug 'tpope/vim-surround'               "Adds 'cs' command to change pair characters
Plug 'Townk/vim-autoclose'              "Adds closing pairs
Plug 'Raimondi/delimitMate'
Plug 'terryma/vim-multiple-cursors'
Plug 'mattn/emmet-vim'                  "Adds snippets
Plug 'mattn/webapi-vim'
Plug 'tpope/vim-endwise'                "Auto-close ruby elements
Plug 'ternjs/tern_for_vim', { 'do': 'npm install' } "Auto complete
Plug 'Valloric/YouCompleteMe', { 'do': '.install.py --tern-completer' }
Plug 'neoclide/coc.nvim', {'branch': 'release'}

"Search Plugins
Plug 'tpope/vim-unimpaired'
Plug 'msanders/snipmate.vim'
Plug 'ctrlpvim/ctrlp.vim'                  "Allows for fuzzy file search
Plug 'mileszs/ack.vim'                  "Fuzzy text search
Plug 'tpope/vim-bundler'
Plug 'junegunn/fzf', { 'do': './install --bin' }
Plug 'junegunn/fzf.vim'                 "Fuzzy Finder
Plug 'ludovicchabant/vim-gutentags'     "Auto generate tags

"Visual
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'TaDaa/vimade'                     "Fade unfocused vim splits

"Navigation Plugins
Plug 'scrooloose/nerdtree'
Plug 'scrooloose/nerdcommenter'         "Adds easy comment and uncomment
Plug 'jistr/vim-nerdtree-tabs'
Plug 'majutsushi/tagbar'
Plug 'christoomey/vim-tmux-navigator'
Plug 'easymotion/vim-easymotion'

"Functional Plugins
Plug 'itchyny/calendar.vim'
Plug 'esneider/YUNOcommit.vim'
Plug 'wincent/command-t'
Plug 'thoughtbot/vim-rspec'
Plug 'jgdavey/tslime.vim'               "Send tmux commands in vim (isn't working)
Plug 'benmills/vimux'                   "Run Tmux commands from vim in 20% window

"Git Plugins
"Plug 'airblade/vim-gitgutter'
Plug 'tpope/vim-fugitive'               "Adds git commands like :Gdiff, :Gstatus
Plug 'mhinz/vim-signify'                "Adds git diffs in gutter

"Syntax Highlighting Plugins
"Plug 'scrooloose/syntastic'
Plug 'tpope/vim-rails'                  "Syntax + error highlight for rails
Plug 'tpope/vim-haml'                   "Syntax highlight for haml
Plug 'kchmck/vim-coffee-script'
Plug 'vim-ruby/vim-ruby'
Plug 'leafgarland/typescript-vim'
Plug 'fatih/vim-go'
Plug 'tomlion/vim-solidity'             "Syntax highlight smart contracts
Plug 'sheerun/vim-polyglot'             "Syntax highlight many languages
"Plug 'pangloss/vim-javascript'  "covered by polyglot
"Plug 'mxw/vim-jsx'              "covered by polyglot

"Linting Plugins
Plug 'vim-syntastic/syntastic'
Plug 'dense-analysis/ale'               "Async linting

"External Pugins
Plug 'hashrocket/vim-macdown'          "Use \p to live reload markdown files in MacDown app
Plug 'junegunn/goyo.vim'

"call vundle#end()
call plug#end()
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
"python from powerline.bindings.vim impor 'source_plugin; source_plugin()
let g:nerdtree_tabs_open_on_console_startup=0
let NERDTreeShowHidden=1
"colorscheme solarized
set background=dark

if has('gui_running')
  set guifont=Inconsolata\ 13    " set fonts for gui vim
  set guioptions=egmrt           " hide the gui menubar
endif

"=============SAVING==============
" Allow for mistakes
command! W :w
command! Q :q
command! Wq :wq
command! WQ :wq

"save on buffer leave
autocmd BufLeave,FocusLost,VimResized * silent! wall

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
set statusline+=%{gutentags#statusline()}

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
set lbr
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
"set term=cons25   " fix issue with arrow keys
set autoread | au CursorHold * checktime | call feedkeys("lh")  " auto refresh vim if current files change outside vim

"map pasting
"nnoremap <C-p> "+gP
"vnoremap <C-p> "+gP
"set clipboard=unnamedplus

" Editting configuration
syntax enable
set pastetoggle=<F2>
"set term=screen-256color
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
let g:ctrlp_custom_ignore = 'node_modules\|DS_Store\|git'
if executable('rg')
  set grepprg=rg--color=never
  let g:ctrlp_user_command = 'rg %s --files --color=never --glob ""'
  let g:ctrlp_use_caching = 0
endif

"start a find+replace for the current word
nnoremap <Leader>f :%s/<C-R><C-W>/

"do not have ack jump to first response
cnoreabbrev Ack Ack!

"Mouse Settings
set mouse=a            "enable mouse
if &term =~ '^screen'
  set ttymouse=xterm2  " tmux knows the extended mouse mode
endif

if !has('nvim')
  set ttymouse=xterm2
endif
"nnoremap <LeftMouse> m'<LeftMouse>
"nnoremap <LeftRelease> <LeftRelease>g``

"CtrlP
"search file names and contents
nnoremap <leader>. :CtrlPTag<cr>
"let g:ctrlp_user_command = ['.git/', 'git --git-dir=%s/.git ls-files -oc --exclude-standard']

if executable('ag')
  let g:ctrlp_user_command = 'ag %s -l --nocolor --hidden -g ""'
endif

let g:ctrlp_custom_ignore = 'node_modules\|DS_Store\|git\|images|*.svg'

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

" Vimade
let g:vimade = {}

let g:fzf_buffers_jump = 1

" Ale linter
let b:ale_fixers = {'javascript': ['prettier', 'eslint']}
let g:ale_fix_on_save = 1

"Auto completion
set omnifunc=syntaxcomplete#Complete

" Start autocompletion after 4 chars
"4 characters before you complete me kicks in
let g:ycm_min_num_of_chars_for_completion = 4
let g:ycm_min_num_identifier_candidate_chars = 4
let g:ycm_enable_diagnostic_highlighting = 0
" Don't show YCM's preview window [ I find it really annoying ]
set completeopt-=preview
let g:ycm_add_preview_to_completeopt = 0

" Python setup
let g:python2_host_prog = '/usr/local/bin/python'
let g:python3_host_prog = '/usr/local/bin/python3'

