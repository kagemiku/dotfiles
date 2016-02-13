"""" .vimrc


"""" 基本設定
set nocompatible                    " vi互換動作の無効
set runtimepath+=~/.vim/            " 自動的にファイルを読み込むパスを設定 ~/.vim/userautoload/*vim
runtime! userautoload/*.vim
set mouse=a                         " マウス機能有効化
set cursorline                      " カーソルラインの強調表示を有効化
set number                          " 行番号を表示
set ruler                           " 行・列の番号を表示
set laststatus=2                    " ステータスラインを常に表示
set statusline=%F%r%h%=             " ステータスラインの内容
set showmatch                       " 対応する括弧を強調表示
"set matchpairs& matchpairs+=<:>     " 対応括弧に<,>を追加
"set list                            " 制御文字を表示
set clipboard=unnamed,unnamedplus   " OSのクリップボードを利用する
set visualbell t_vb=                " ビープ音を無効にする
set noerrorbells                    " エラーメッセージの表示時にビープを鳴らさない

" [Backspace] で既存の文字を削除できるように設定
"  start - 既存の文字を削除できるように設定
"  eol - 行頭で[Backspace]を使用した場合上の行と連結
"  indent - オートインデントモードでインデントを削除できるように設定
set backspace=start,eol,indent

" 特定のキーに行頭および行末の回りこみ移動を許可する設定
"  b - [Backspace]  ノーマルモード ビジュアルモード
"  s - [Space]      ノーマルモード ビジュアルモード
"   - [→]          ノーマルモード ビジュアルモード
"  [ - [←]          挿入モード 置換モード
"  ] - [→]          挿入モード 置換モード
"  ~ - ~            ノーマルモード
set whichwrap=b,s,[,],,~

syntax enable                   " シンタックスハイライト有効化 (背景黒向け。白はコメントアウトされている設定を使用)
highlight Normal ctermbg=black ctermfg=grey
highlight StatusLine term=none cterm=none ctermfg=black ctermbg=grey
highlight CursorLine term=none cterm=none ctermfg=none ctermbg=none
"highlight Normal ctermbg=grey ctermfg=black
"highlight StatusLine term=none cterm=none ctermfg=grey ctermbg=black
"highlight CursorLine term=none cterm=none ctermfg=darkgray ctermbg=none

" 全角スペースのハイライト
function! ZenkakuSpace()
    highlight ZenkakuSpace cterm=underline ctermfg=lightblue guibg=darkgray
endfunction

if has('syntax')
    augroup ZenkakuSpace
        autocmd!
        autocmd ColorScheme * call ZenkakuSpace()
        autocmd VimEnter,WinEnter,BufRead * let w:m1=matchadd('ZenkakuSpace', '　')
    augroup END
    call ZenkakuSpace()
endif

" 最後のカーソル位置を復元
if has("autocmd")
    autocmd BufReadPost *
    \ if line("'\"") > 0 && line ("'\"") <= line("$") |
    \ exe "normal! g'\"" |
    \ endif
endif

"""" コマンド関連
set wildmenu wildmode=list:longest,full     " TABキーによるファイル名保管を有効化


"""" ファイル関連
set confirm             " 保存されてないファイルがあるなら終了前に保存確認
set hidden              " 保存されていないファイルがあるときでも別のファイルを開く
set autoread            " 外部でファイルが変更されたなら読みなおす


"""" 検索/置換関連
set incsearch                       " インクリメンタル検索を有効化
set nohlsearch                      " 検索キーワードをハイライトしないように設定
set wildmenu wildmode=list:full     " 補完時の一覧表示機能有効化
set wrapscan                        " 最終行まで検索したら先頭行に戻る
set gdefault                        " 置換時gオプションを有効化


"""" タブ関連
set smartindent                     " オートインデントの設定
set expandtab                       " タブをスペースに展開
set tabstop=4                       " 画面に表示されるタブ幅
set shiftwidth=4                    " インデント幅をスペース4つ分に
set softtabstop=4                   " 連続した空白に対してタブキーやバックスペースキーでカーソルが動く幅
set smarttab                        " タブが押された場合にtabstopではなくshiftwidthの数だけインデントする

"""" remove trailing whitespace
autocmd BufWritePre * :%s/\s\+$//ge

"""" カラー設定
set background=dark                     " 背景を黒に
colorscheme solarized                   " カラースキームcolarizedを適用
"let g:solarized_visibility = "high"    " 輝度を高くする
"let g:solarized_contrast = "high"      " コントラストを高くする
"let g:solarized_termtrans=0
"let g:solarized_termcolors=256


"""" キーバインディング
" jjをESCに割当
inoremap <silent> jj <ESC>
inoremap <silent> <C-j> j

" カーソルを表示行移動する
nnoremap j gj
nnoremap k gk
nnoremap <Down> gj
nnoremap <Up> gk

" 挿入モードでのカーソル移動
inoremap <C-d> <delete>
inoremap <C-j> <Down>
inoremap <C-k> <Up>
inoremap <C-h> <Left>
inoremap <C-l> <Right>

" Ctrl+hjklでウィンドウ間を移動
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

" Shift+カーソルキーでウィンドウサイズを変更
nnoremap <S-Left> <C-w><<CR>
nnoremap <S-Right> <C-w>><CR>
nnoremap <S-Up> <C-w>-<CR>
nnoremap <S-Down> <C-w>+<CR>

" タブ
nnoremap st :<C-u>tabnew<CR>
nnoremap sn gt
nnoremap sp gT
nnoremap sq :<C-u>q<CR>

" Enterで閉括弧補間かつ改行
inoremap {<Enter> {}<Left><CR><ESC><S-o>
inoremap [<Enter> []<Left><CR><ESC><S-o>
inoremap (<Enter> ()<Left><CR><ESC><S-o>

" 通常補間
"inoremap { {}<LEFT>
"inoremap [ []<LEFT>
"inoremap ( ()<LEFT>
"inoremap " ""<LEFT>
"inoremap ' ''<LEFT>
"inoremap < <><LEFT>

" makeコマンドの割り当て
" nmap <C-B> :make build
" imap <C-B> :make build
" nmap <C-R> :make run
" imap <C-R> :make run

" 全選択&ヤンク
nnoremap <C-g> ggVGy


"""" NeoBundle
" NeoBundle がインストールされていない時、
" もしくは、プラグインの初期化に失敗した時の処理
function! s:WithoutBundles()
colorscheme solarized
" その他の処理
endfunction

" NeoBundle よるプラグインのロードと各プラグインの初期化
function! s:LoadBundles()
" 読み込むプラグインの指定
NeoBundle 'Shougo/neobundle.vim'
NeoBundle 'Shougo/neocomplcache'
NeoBundle 'tpope/vim-surround'
NeoBundle 'terryma/vim-multiple-cursors'
NeoBundle 'scrooloose/syntastic'
NeoBundle 'scrooloose/nerdtree'
NeoBundle 'thinca/vim-quickrun'
NeoBundle 'tomtom/tcomment_vim'
NeoBundle 'jacquesbh/vim-showmarks'
NeoBundle 'justmao945/vim-clang'
NeoBundle 'elixir-lang/vim-elixir'
NeoBundle 'alpaca-tc/alpaca_powertabline'
NeoBundle 'Lokaltog/powerline', { 'rtp' : 'powerline/bindings/vim'}
NeoBundle 'Lokaltog/powerline-fontpatcher'
NeoBundle 'vim-airline/vim-airline'
NeoBundle 'vim-airline/vim-airline-themes'
NeoBundle 'tpope/vim-fugitive'
NeoBundle 'kannokanno/previm'
NeoBundle 'mattn/emmet-vim'
NeoBundle 'rust-lang/rust.vim'
"NeoBundle 'racer-rust/vim-racer'

" プラグインの設定

" set clang options for vim-clang
let g:clang_c_options = '-std=c11'
let g:clang_cpp_options = '-std=c++1z -stdlib=libc++ --pedantic-errors'

" set powerline options
let g:powerline_symbols = 'fancy'
"
" set airline options
let g:airline_theme='solarized'
let g:airline_powerline_fonts = 1
set laststatus=2
let g:airline_detect_modified = 1
let g:airline#extensions#branch#enabled = 0
let g:airline#extensions#readonly#enabled = 0
let g:airline_section_b =
    \ '%{airline#extensions#branch#get_head()}' .
    \ '%{""!=airline#extensions#branch#get_head()?("  " . g:airline_left_alt_sep . " "):""}' .
    \ '%t%( %M%)'
let g:airline_section_c = ''

" set previm
nnoremap <C-p> :PrevimOpen<CR>
let g:previm_open_cmd = 'open -a "Google Chrome"'
augroup PrevimSettings
    autocmd!
    autocmd BufNewFile,BufRead *.{md,mdwn,mkd,mkdn,mark*} set filetype=markdown
augroup END

" set neocomplcache options
" Disable AutoComplPop.
let g:acp_enableAtStartup = 0
" Use neocomplcache.
let g:neocomplcache_enable_at_startup = 1
" Use smartcase.
let g:neocomplcache_enable_smart_case = 1
" Set minimum syntax keyword length.
let g:neocomplcache_min_syntax_length = 3
let g:neocomplcache_lock_buffer_name_pattern = '\*ku\*'

" Enable heavy features.
" Use camel case completion.
"let g:neocomplcache_enable_camel_case_completion = 1
" Use underbar completion.
"let g:neocomplcache_enable_underbar_completion = 1

" racer
"let g:rustfmt_autosave = 1
"let g:rustfmt_command = '$HOME/.cargo/bin/rustfmt'
"let g:racer_cmd = '$HOME/.cargo/bin/racer'
"let $RUST_SRC_PATH="/usr/local/src/rustc-1.5.0/src"

" Define dictionary.
let g:neocomplcache_dictionary_filetype_lists = {
    \ 'default' : '',
    \ 'vimshell' : $HOME.'/.vimshell_hist',
    \ 'scheme' : $HOME.'/.gosh_completions'
        \ }

" Define keyword.
if !exists('g:neocomplcache_keyword_patterns')
    let g:neocomplcache_keyword_patterns = {}
endif
let g:neocomplcache_keyword_patterns['default'] = '\h\w*'

" Plugin key-mappings.
inoremap <expr><C-g>     neocomplcache#undo_completion()
inoremap <expr><C-l>     neocomplcache#complete_common_string()

" Recommended key-mappings.
" <CR>: close popup and save indent.
inoremap <silent> <CR> <C-r>=<SID>my_cr_function()<CR>
function! s:my_cr_function()
  return neocomplcache#smart_close_popup() . "\<CR>"
  " For no inserting <CR> key.
  "return pumvisible() ? neocomplcache#close_popup() : "\<CR>"
endfunction
" <TAB>: completion.
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
" <C-h>, <BS>: close popup and delete backword char.
inoremap <expr><C-h> neocomplcache#smart_close_popup()."\<C-h>"
inoremap <expr><BS> neocomplcache#smart_close_popup()."\<C-h>"
inoremap <expr><C-y>  neocomplcache#close_popup()
inoremap <expr><C-e>  neocomplcache#cancel_popup()
" Close popup by <Space>.
"inoremap <expr><Space> pumvisible() ? neocomplcache#close_popup() : "\<Space>"

" For cursor moving in insert mode(Not recommended)
"inoremap <expr><Left>  neocomplcache#close_popup() . "\<Left>"
"inoremap <expr><Right> neocomplcache#close_popup() . "\<Right>"
"inoremap <expr><Up>    neocomplcache#close_popup() . "\<Up>"
"inoremap <expr><Down>  neocomplcache#close_popup() . "\<Down>"
" Or set this.
"let g:neocomplcache_enable_cursor_hold_i = 1
" Or set this.
"let g:neocomplcache_enable_insert_char_pre = 1

" AutoComplPop like behavior.
"let g:neocomplcache_enable_auto_select = 1

" Shell like behavior(not recommended).
"set completeopt+=longest
"let g:neocomplcache_enable_auto_select = 1
"let g:neocomplcache_disable_auto_complete = 1
"inoremap <expr><TAB>  pumvisible() ? "\<Down>" : "\<C-x>\<C-u>"

" Enable omni completion.
autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags

" Enable heavy omni completion.
if !exists('g:neocomplcache_omni_patterns')
  let g:neocomplcache_omni_patterns = {}
endif
if !exists('g:neocomplcache_force_omni_patterns')
  let g:neocomplcache_force_omni_patterns = {}
endif
let g:neocomplcache_omni_patterns.php =
\ '[^. \t]->\%(\h\w*\)\?\|\h\w*::\%(\h\w*\)\?'
let g:neocomplcache_omni_patterns.c =
\ '[^.[:digit:] *\t]\%(\.\|->\)\%(\h\w*\)\?'
let g:neocomplcache_omni_patterns.cpp =
\ '[^.[:digit:] *\t]\%(\.\|->\)\%(\h\w*\)\?\|\h\w*::\%(\h\w*\)\?'

" syntastic.vim setting.
if executable("clang++")
  let g:syntastic_cpp_compiler = 'clang++'
  let g:syntastic_cpp_compiler_options = '--std=c++11 --stdlib=libc++'
  let g:quickrun_config = {}
  let g:quickrun_config['cpp/clang++11'] = {
      \ 'cmdopt': '--std=c++11 --stdlib=libc++',
      \ 'type': 'cpp/clang++'
    \ }
  let g:quickrun_config['cpp'] = {'type': 'cpp/clang++11'}
endif

" For perlomni.vim setting.
" https://github.com/c9s/perlomni.vim
let g:neocomplcache_omni_patterns.perl =
\ '[^. \t]->\%(\h\w*\)\?\|\h\w*::\%(\h\w*\)\?'
" end neocomplcache

endfunction

" marksの設定
" marks
set viminfo='50,\"1000,:0,n~/.vim/viminfo
set foldmethod=marker
let g:showmarks_marks_notime = 1
let g:unite_source_mark_marks = '01abcABCDEFGHIJKLNMOPQRSTUVWXYZ'
let g:showmarks_enable       = 0
if !exists('g:markrement_char')
    let g:markrement_char = [
    \     'A', 'B', 'C', 'D', 'E', 'F', 'G', 'H', 'I', 'J', 'K', 'L', 'M',
    \     'N', 'O', 'P', 'Q', 'R', 'S', 'T', 'U', 'V', 'W', 'X', 'Y', 'Z',
    \     'a', 'b', 'c', 'd', 'e', 'f', 'g', 'h', 'i', 'j', 'k', 'l', 'm',
    \     'n', 'o', 'p', 'q', 'r', 's', 't', 'u', 'v', 'w', 'x', 'y', 'z'
    \ ]
en

fu! s:AutoMarkrement()
    if !exists('b:markrement_pos')
        let b:markrement_pos = 0
    else
        let b:markrement_pos = (b:markrement_pos + 1) % len(g:markrement_char)
    en
    exe 'mark' g:markrement_char[b:markrement_pos]
    echo 'marked' g:markrement_char[b:markrement_pos]
endf

aug show-marks-sync
        au!
        au BufReadPost * sil! ShowMarksOnce
aug END

nn [Mark] <Nop>
nm <leader>m [Mark]
nn <silent> [Mark]m :Unite mark<CR>
nn [Mark] :<C-u>call <SID>AutoMarkrement()<CR><CR>:ShowMarksOnce<CR>
com! -bar MarksDelete sil :delm! | :delm 0-9A-Z | :wv! | :ShowMarksOnce
nn <silent>[Mark]d :MarksDelete<CR>
"


" NeoBundle がインストールされているなら LoadBundles() を呼び出す
" そうでないなら WithoutBundles() を呼び出す
function! s:InitNeoBundle()
if isdirectory(expand("~/.vim/bundle/neobundle.vim/"))
filetype plugin indent off
if has('vim_starting')
set runtimepath+=~/.vim/bundle/neobundle.vim/
endif
try
call neobundle#begin(expand('~/.vim/bundle/'))
call s:LoadBundles()
call neobundle#end()
catch
call s:WithoutBundles()
endtry
else
call s:WithoutBundles()
endif

filetype indent plugin on
syntax on
endfunction

call s:InitNeoBundle()

