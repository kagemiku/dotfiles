" tab
set expandtab
set tabstop=4
set shiftwidth=4
set softtabstop=4
set smarttab

au BufRead,BufNewFile,BufReadPre *.coffee set filetype=coffee

augroup fileTypeIndent
    autocmd!
    autocmd BufNewFile,BufRead *.html setlocal tabstop=2 shiftwidth=2 softtabstop=2
    autocmd BufNewFile,BufRead *.coffee setlocal tabstop=2 shiftwidth=2 softtabstop=2
    autocmd BufNewFile,BufRead *.rkt setlocal tabstop=2 shiftwidth=2 softtabstop=2
augroup END

" appearance
set showmatch
set list
set listchars=tab:>.,trail:_,eol:↲,extends:>,precedes:<,nbsp:%

" control
set backspace=start,eol,indent
set whichwrap=b,s,[,],,~

