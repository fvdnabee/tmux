" Automatic reloading of .vimrc
autocmd! bufwritepost .vimrc source %

" Automatically regenrate tag files
" autocmd BufWritePost *.cc,*.hh,*.c,*.h silent! !/usr/bin/ctags -R 2> /dev/null &
"set tags=./tags,./TAGS;$HOME " 1. tags, 2. TAGS, 3.… until $HOME
set tags=tags;/
" Better copy & paste
" When you want to paste large blocks of code into vim, press F2 before you
" paste. At the bottom you should see ``-- INSERT (paste) --``.

set pastetoggle=<F2>
set clipboard=unnamed

" Mouse and backspace
set mouse=a " on OSX press ALT and click
set bs=2 " make backspace behave like normal again

" Rebind <Leader> key
" I like to have it here becuase it is easier to reach than the default and
" it is next to ``m`` and ``n`` which I use for navigating between tabs.
let mapleader = ","

" Bind nohl
" Removes highlight of your last search
" ``<C>`` stands for ``CTRL`` and therefore ``<C-n>`` stands for ``CTRL+n``
" noremap <C-n> :nohl<CR>
" vnoremap <C-n> :nohl<CR>
" inoremap <C-n> :nohl<CR>

" <Ctrl-l> redraws the screen and removes any search highlighting.
" nnoremap <silent> <C-l> :nohl<CR><C-l>
nnoremap <silent> _ :nohl<CR>

" Quicksave command
noremap <C-s> :update<CR>
vnoremap <C-s> <C-C>:update<CR>
inoremap <C-s> <C-O>:update<CR>

" Quick quit command
noremap <Leader>e :quit<CR> " Quit current window
noremap <Leader>E :qa!<CR> " Quit all windows

" bind Ctrl+<movement> keys to move around the windows, instead of using Ctrl+w + <movement>
" Every unnecessary keystroke that can be saved is good for your health :)
map <c-j> <c-w>j
map <c-k> <c-w>k
map <c-l> <c-w>l
map <c-h> <c-w>h

" easier moving between tabs
map <Leader>n <esc>:tabprevious<CR>
map <Leader>m <esc>:tabnext<CR>

" easier moving of code blocks
" Try to go into visual mode (v), thenselect several lines of code here and
" then press ``>`` several times.
vnoremap < <gv " better indentation
vnoremap > >gv " better indentation

" Goto the next/previous error in source code remapping
map cn <esc>:cn<cr>
map cp <esc>:cp<cr>

" Show whitespace
" MUST be inserted BEFORE the colorscheme command
autocmd ColorScheme * highlight ExtraWhitespace ctermbg=white guibg=white
au InsertLeave * match ExtraWhitespace /\s\+$/

" Color scheme
" mkdir -p ~/.vim/colors && cd ~/.vim/colors
" wget -O wombat256mod.vim http://www.vim.org/scripts/download_script.php?src_id=13400
set t_Co=256
colorscheme wombat256mod

" Showing line numbers and length
set number " show line numbers
set tw=79 " width of document (used by gd)
set nowrap " don't automatically wrap on load
set fo-=t " don't automatically wrap text when typing
set colorcolumn=80
highlight ColorColumn ctermbg=233

" easier formatting of paragraphs
vmap Q gq
nmap Q gqap

" Useful settings
set history=700
set undolevels=700

" Make search case insensitive
set incsearch
set hlsearch
set ignorecase
set smartcase

" Disable stupid backup and swap files - they trigger too many events
" for file system watchers
set nobackup
set nowritebackup
set noswapfile

" Automatically load plugins using pathogen
call pathogen#infect()

" Start with NERDTree opened
" autocmd VimEnter waits until all initialization is finished (plugins are loaded)
" autocmd VimEnter * NERDTree
" autocmd VimEnter * wincmd p
" let g:nerdtree_tabs_open_on_console_startup=1
" Toggle NERDTree accross all tabs:
map <Leader>; <esc>:NERDTreeTabsToggle<CR>
" autocmd VimEnter * NERDTreeTabsToggle

" Rebind tag next
map <Leader>b <esc>:tn<CR>
map <Leader>v <esc>:tp<CR>

" Enable filetype detection, indentation and syntax highlighting
filetype plugin on
filetype indent on
syntax on

" Set foldingmethod to syntax, note this requires a syntax file for every language in syntax
set foldmethod=syntax

" Real programmers don't use TABs but spaces
"autocmd FileType cc setlocal shiftwidth=2 tabstop=2 softtabstop=2 expandtab shiftround
autocmd FileType c setlocal shiftwidth=2 tabstop=2 softtabstop=2 expandtab shiftround
"autocmd FileType hh setlocal shiftwidth=2 tabstop=2 softtabstop=2 expandtab shiftround
autocmd FileType h setlocal shiftwidth=2 tabstop=2
autocmd FileType py setlocal shiftwidth=2 tabstop=2 softtabstop=2 expandtab shiftround
autocmd BufRead,BufNewFile *.click set filetype=click
autocmd BufRead,BufNewFile *.conf set filetype=click
autocmd BufRead,BufNewFile *.cfg set filetype=click

" grepprg
" set grepprg="grep -R -i --color=auto --include '*.cc,*.hh,*.conf,*.cfg' -n -H $ /dev/null"

" Use clang autocomplete
" let g:clang_use_library = 1

" Easymotion rebind leader
let g:EasyMotion_leader_key = '.'

" Alternate header definition
" let g:alternateExtensions_CC = "hh"
" let g:alternateExtensions_HH = "cc"
let g:alternateSearchPath = 'sfr:../source,sfr:../src,sfr:../include,sfr:../inc,sfr:../../include,sfr:./include'

" Custom C function colors
"hi cCustomFunc  gui=bold guifg=yellowgreen
"hi cCustomClass gui=reverse guifg=#00FF00

" Highlight current line
:set cursorline

" Ignore specific files/directories:
:set wildignore+=*.o,*.d,.git,.svn,*/doxygen-html/*,*/userlevel/*

" Easygrep configuration:
let g:EasyGrepCommand=1
let g:EasyGrepMode=2
let g:EasyGrepRecursive=1
let g:EasyGrepIgnoreCase=1
let g:EasyGrepJumpToMatch=0

" YouCompleteMe
let g:ycm_extra_conf_globlist = ['~/GIT/COAPClientGateway/*','!~/*']

" Increase number of tabs
set tabpagemax=30
