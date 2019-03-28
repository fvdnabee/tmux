if exists("did_load_filetypes")
  finish
endif

augroup filetypedetect
  " au! commands to set the filetype go here
  au! BufNewFile,BufRead *.cc,*.hh setfiletype c
  au! BufNewFile,BufRead *.py setfiletype py
augroup END
