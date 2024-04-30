" Set the basic sizes
let g:vimspector_terminal_maxwidth = 200
" let g:vimspector_terminal_minwidth = 120

function! s:CustomiseUI()
  " Customise the basic UI...

  " Close the output window
  call win_gotoid( g:vimspector_session_windows.output )
  q
endfunction

function s:SetUpTerminal()
  " Customise the terminal window size/position
  " For some reasons terminal buffers in Neovim have line numbers
  call win_gotoid( g:vimspector_session_windows.terminal )
  set norelativenumber nonumber
  set colorcolumn=
endfunction

augroup MyVimspectorUICustomistaion
  autocmd!
  " autocmd User VimspectorUICreated call s:CustomiseUI()
  autocmd User VimspectorTerminalOpened call s:SetUpTerminal()
augroup END
