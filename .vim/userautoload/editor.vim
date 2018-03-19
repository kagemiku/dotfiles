" tab
set expandtab
set tabstop=4
set shiftwidth=4
set softtabstop=4
set smarttab

autocmd BufNewFile,BufRead,BufReadPre *.coffee set filetype=coffee

augroup fileTypeIndent
    autocmd!
    autocmd BufNewFile,BufRead *.html setlocal tabstop=2 shiftwidth=2 softtabstop=2
    autocmd BufNewFile,BufRead *.coffee setlocal tabstop=2 shiftwidth=2 softtabstop=2
    autocmd BufNewFile,BufRead *.rkt setlocal tabstop=2 shiftwidth=2 softtabstop=2
    autocmd BufNewFile,BufRead *.py setlocal tabstop=2 shiftwidth=2 softtabstop=2
    autocmd BufNewFile,BufRead *.js setlocal tabstop=2 shiftwidth=2 softtabstop=2
    autocmd BufNewFile,BufRead *.yml setlocal tabstop=2 shiftwidth=2 softtabstop=2
    autocmd BufNewFile,BufRead *.yaml setlocal tabstop=2 shiftwidth=2 softtabstop=2
augroup END

" appearance
set showmatch
set list
set listchars=tab:>.,trail:_,eol:↲,extends:>,precedes:<,nbsp:%

augroup fileTypeListChars
    autocmd!
    autocmd BufNewFile,BufRead *.go setlocal nolist
augroup END

" control
set backspace=start,eol,indent
set whichwrap=b,s,[,],,~
source $VIMRUNTIME/macros/matchit.vim

" spell check
set spell
set spelllang=en,cjk

" conceal
set conceallevel=0
