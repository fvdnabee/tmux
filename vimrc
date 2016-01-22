" Load Plugins {{{
" load Vundle:
filetype off
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

" Let Vundle manage itself.
Plugin 'gmarik/vundle'

Bundle 'Valloric/YouCompleteMe'
Bundle 'scrooloose/syntastic'
Bundle 'fatih/vim-go'
Bundle 'fvdnabee/a.vim'
Bundle 'mileszs/ack.vim'
Bundle 'kien/ctrlp.vim'
Bundle 'Lokaltog/vim-easymotion'
Bundle 'scrooloose/nerdtree'
Bundle 'jistr/vim-nerdtree-tabs'
" Tagbar, class outline viewer:
Bundle 'majutsushi/tagbar'
" wombat256mod colour scheme for vim:
Bundle 'vim-scripts/wombat256.vim'
" Solarized colour scheme for vim:
" Bundle 'altercation/vim-colors-solarized'
" Base16 colour scheme for vim:
" Bundle 'chriskempson/base16-vim'

" Required, plugins available after.
call vundle#end()

" }}}
" Whitespace, color and fonts {{{
" Show whitespace
" MUST be inserted BEFORE the colorscheme command
autocmd ColorScheme * highlight ExtraWhitespace ctermbg=white guibg=white
au InsertLeave * match ExtraWhitespace /\s\+$/

" Color schemes
" 1) wombat256mod
" mkdir -p ~/.vim/colors && cd ~/.vim/colors
" wget -O wombat256mod.vim http://www.vim.org/scripts/download_script.php?src_id=13400
set t_Co=256
colorscheme wombat256mod
" 2) solarized:
" let g:solarized_termcolors=256
"set t_Co=256
"set background=dark
"colorscheme solarized
" 3) base16:
" let base16colorspace=256
" set background=dark
" colorscheme base16-colors

" Font for gvim:
set guifont=Monospace\ 9

" }}}
" UI Layout {{{
set cursorline	" Highlight current line
set showmatch	" higlight matching parenthesis
set tw=79	" width of document (used by gd)
set nowrap	" don't automatically wrap on load
set fo-=t	" don't automatically wrap text when typing
set scrolloff=3 " lines of text around cursor

set showcmd	" show command in bottom bar
set wildmenu	" show command-line completion matches just above the command line

" Colour column 80
set colorcolumn=80
highlight ColorColumn ctermbg=233

" }}}
" Relative/absolute line numbers {{{
" Showing line numbers, the following two lines will always show the absolute
" line number for the cursor line and the surrounding lines will show the
" relative line number
set number	" show line numbers
set relativenumber " show relative line numbers, easy for moving around with j/k

" function to toggle between abs and rel line numbers
function! RelativeNumberToggle()
  if(&relativenumber == 1)
    set norelativenumber
  else
    set relativenumber
  endif
endfunc

nnoremap <C-n> :call RelativeNumberToggle()<cr>

" }}}
" Searching {{{
set incsearch           " search as characters are entered
set hlsearch            " highlight matches
set ignorecase 		" case-insensitive search (but also see next option)
set smartcase		" make search case insensitive when no upper case letters are found in the search pattern
" }}}
" Spaces & Tabs {{{
" Enable filetype detection, indentation and syntax highlighting
filetype plugin on
filetype indent on
syntax on

" Set foldingmethod to syntax, note this requires a syntax file for every language in syntax
set foldmethod=syntax

nnoremap <space> za	" space open/closes folds

set tabpagemax=30 	" Increase number of tabs
set modelines=1		" Search the last line of a file for file-specific vimrc modes

" easier moving of code blocks
" Try to go into visual mode (v), thenselect several lines of code here and
" then press ``>`` several times.
vnoremap < <gv " better indentation
vnoremap > >gv " better indentation
" }}}
" Leader {{{
" Rebind <Leader> key
" I like to have it here becuase it is easier to reach than the default and
" it is next to ``m`` and ``n`` which I use for navigating between tabs.
let mapleader = ","

" easier moving between tabs
map <Leader>n <esc>:tabprevious<CR>
map <Leader>m <esc>:tabnext<CR>

" open new tab with <Leader>T
map <Leader>T <esc>:tabnew<CR>

" turn off search highlight
nnoremap <leader><space> :nohlsearch<CR>

" Rebind tag next
map <Leader>b <esc>:tn<CR>
map <Leader>v <esc>:tp<CR>
" }}}
" Quick save/quit {{{
" Quicksave command
noremap <C-s> :update<CR>
vnoremap <C-s> <C-C>:update<CR>
inoremap <C-s> <C-O>:update<CR>

" Quick quit command
noremap <Leader>e :quit<CR>	" Quit current window
noremap <Leader>E :qa!<CR> 	" Quit all windows

" Quick quick+save command
noremap <Leader>x :x<CR> 	" Quit and save current window
" }}}
" Misc key mappings {{{
" bind Ctrl+<movement> keys to move around the windows, instead of using Ctrl+w + <movement>
" Every unnecessary keystroke that can be saved is good for your health :)
map <c-j> <c-w>j
map <c-k> <c-w>k
map <c-l> <c-w>l
map <c-h> <c-w>h

" Goto the next/previous error in source code remapping or search match
map cn <esc>:cn<cr>
map cp <esc>:cp<cr>
nmap <silent> <RIGHT> :cnext<CR>
nmap <silent> <LEFT> :cprev<CR>

" scroll the viewport faster
nnoremap <C-e> 3<C-e>
nnoremap <C-y> 3<C-y>

" highlight last inserted text
nnoremap gV `[v`]

" jk is escape
inoremap jk <esc>

" easier formatting of paragraphs (for text input)
vmap Q gq
nmap Q gqap
" }}}
" Backup/swap files {{{
set backup
set backupdir=/var/tmp/vim,/tmp
set directory=/var/tmp/vim,/tmp
set backupskip=/tmp/*,/private/tmp/*
set writebackup

" " Disable stupid backup and swap files - they trigger too many events
" " for file system watchers
" set nobackup
" set nowritebackup
" set noswapfile
" }}}
" Misc {{{
set ttyfast	" faster redraw
" Useful settings
set history=700
set undolevels=700
" Mouse and backspace
set mouse=a	" enable mouse (on OSX press ALT and click)
set backspace=2	" make backspace behave like normal again
" Custom C function colors
"hi cCustomFunc  gui=bold guifg=yellowgreen
"hi cCustomClass gui=reverse guifg=#00FF00

" Ignore specific files/directories:
:set wildignore+=*.o,*.d,.git,.svn,*/doxygen-html/*,*/userlevel/*

" Automatic reloading of .vimrc
" autocmd! bufwritepost .vimrc source %

" Better copy & paste
" When you want to paste large blocks of code into vim, press F2 before you
" paste. At the bottom you should see ``-- INSERT (paste) --``.
set pastetoggle=<F2>
set clipboard=unnamed

" Automatically regenerate tag files
" autocmd BufWritePost *.cc,*.hh,*.c,*.h silent! !/usr/bin/ctags -R 2> /dev/null &
"set tags=./tags,./TAGS;$HOME " 1. tags, 2. TAGS, 3.… until $HOME
set tags=tags;/
" }}}
" CtrlP {{{
let g:ctrlp_match_window = 'bottom,order:ttb,min:1,max:10,results:100'
let g:ctrlp_switch_buffer = 0
" let g:ctrlp_working_path_mode = 0
let g:ctrlp_cache_dir = $HOME . '/.cache/ctrlp'
let g:ctrlp_custom_ignore = '\vbuild/|dist/|venv/|target/|\.(o|swp|pyc|egg)$'
" }}}
" The Silver Searcher (ag) {{{
" Urge Vim to use ag for :grep commands
if executable('ag')
	" Note we extract the column as well as the file and line number
	" set grepprg=ag\ --nogroup\ --nocolor\ --column
	" set grepformat=%f:%l:%c%m

	" Use ag in CtrlP for listing files. Lightning fast and respects .gitignore
	" let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'
	let g:ctrlp_user_command = 'ag %s -i --nocolor --nogroup --hidden
	      \ --ignore .git
	      \ --ignore .svn
	      \ --ignore .hg
	      \ --ignore .DS_Store
	      \ --ignore "**/*.pyc"
	      \ -g ""'

	" ag is fast enough that CtrlP doesn't need to cache
	" let g:ctrlp_use_caching = 0

	" Specify the ack.vim plugin to use ag
	" The benefit of combining Ag with Ack is that Ack's Quickfix window has useful short cuts
	let g:ackprg = 'ag --nogroup --nocolor --column'
endif

" bind K to Ack word under cursor
nnoremap K :Ack!<CR>
" nnoremap K :grep! "\b<C-R><C-W>\b"<CR>:cw<CR>
" }}}
" NERDTree {{{
" Start with NERDTree opened
" autocmd VimEnter waits until all initialization is finished (plugins are loaded)
" autocmd VimEnter * NERDTree
" autocmd VimEnter * wincmd p
" let g:nerdtree_tabs_open_on_console_startup=1
" NERDTree on right side
" let g:NERDTreeWinPos = "right"

" Toggle NERDTree accross all tabs:
nmap <F3> :NERDTreeTabsToggle<CR>
" autocmd VimEnter * NERDTreeTabsToggle
" }}}
" AutoGroups {{{
augroup configgroup
	autocmd!
	"autocmd FileType cc setlocal shiftwidth=2 tabstop=2 softtabstop=2 expandtab shiftround
	autocmd FileType c setlocal shiftwidth=2 tabstop=2 softtabstop=2 expandtab shiftround
	"autocmd FileType hh setlocal shiftwidth=2 tabstop=2 softtabstop=2 expandtab shiftround
	autocmd FileType h setlocal shiftwidth=2 tabstop=2

	autocmd FileType python setlocal foldmethod=indent
	autocmd FileType python setlocal shiftwidth=4
	autocmd FileType python setlocal tabstop=4
	autocmd FileType python setlocal softtabstop=4
	autocmd FileType python setlocal expandtab 
	autocmd FileType python setlocal shiftround
	autocmd FileType python setlocal commentstring=#\ %s
	autocmd FileType py setlocal filetype=python 

	autocmd FileType ruby setlocal tabstop=2
	autocmd FileType ruby setlocal shiftwidth=2
	autocmd FileType ruby setlocal expandtab
	autocmd FileType ruby setlocal softtabstop=2
	autocmd FileType ruby setlocal commentstring=#\ %s
	autocmd FileType ruby setlocal shiftround
	autocmd FileType rb setlocal filetype=ruby 

	autocmd FileType java setlocal noexpandtab
	autocmd FileType java setlocal list
	autocmd FileType java setlocal listchars=tab:+\ ,eol:-
	autocmd FileType java setlocal formatprg=par\ -w80\ -T4

	autocmd BufEnter *.click set filetype=click
	autocmd BufEnter *.conf set filetype=click
	autocmd BufEnter *.cfg set filetype=click

	autocmd BufEnter Makefile setlocal noexpandtab

	autocmd BufEnter *.sh setlocal tabstop=2
	autocmd BufEnter *.sh setlocal shiftwidth=2
	autocmd BufEnter *.sh setlocal softtabstop=2
augroup END
" }}}
" Misc plugins {{{
" Use clang autocomplete
" let g:clang_use_library = 1

" Alternate header definition
" let g:alternateExtensions_CC = "hh"
" let g:alternateExtensions_HH = "cc"
let g:alternateSearchPath = 'sfr:../source,sfr:../src,sfr:../include,sfr:../inc,sfr:../../include,sfr:./include'

" Tagbar
nmap <F4> :TagbarToggle<CR>
" }}}
" Easygrep {{{
let g:EasyGrepCommand=1
let g:EasyGrepMode=2
let g:EasyGrepRecursive=1
let g:EasyGrepIgnoreCase=1
let g:EasyGrepJumpToMatch=0
" }}}
" YouCompleteMe {{{
let g:ycm_extra_conf_globlist = ['~/GIT/COAPClientGateway/*','!~/*']
let g:ycm_server_use_vim_stdout = 0
let g:ycm_server_log_level = 'debug'
nnoremap <F5> :YcmForceCompileAndDiagnostics<CR>
nnoremap <F6> :YcmDiags<CR>
" }}}
" syntastic (mainly for python) {{{
let g:syntastic_python_flake8_args = "--max-line-length=160"
let g:syntastic_warning_symbol="⚠"
let g:syntastic_error_symbol="✗"
" }}}
" vim-go {{{
let g:go_doc_keywordprg_enabled = 0 " don't overwrite the mapping for the K key

" let g:go_fmt_autosave = 0 " work-around for go fmt losing vim folds, see https://github.com/fatih/vim-go/issues/502
" }}}
" gvim {{{
" Hide gvim toolbars:
:set guioptions-=T  "remove toolbar
:set guioptions-=r  "remove right-hand scroll bar
:set guioptions-=L  "remove left-hand scroll bar
:set guioptions-=b  "remove horizontal scroll bar

" Resize gvim window via Ctrl F12
map <C-o> :set lines-=1 lines+=1<CR>

" How to make cut/copy/paste in GVim on Ubuntu work with Ctrl+X,Ctrl+C,Ctrl+V?
" http://superuser.com/a/189198/219425
vmap <C-c> "+yi
vmap <C-x> "+c
vmap <C-v> c<ESC>"+p
imap <C-v> <C-r><C-o>+
" }}}
" vim:foldmethod=marker:foldlevel=0
