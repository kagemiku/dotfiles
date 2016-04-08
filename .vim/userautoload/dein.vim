" plugin installation directory
let s:dein_dir = expand('~/.vim/dein')

" dein.vim directory
let s:dein_repo_dir = s:dein_dir . '/repos/github.com/Shougo/dein.vim'

" if there is no dein.vim, download it.
if &runtimepath !~# '/dein.vim'
    if !isdirectory(s:dein_repo_dir)
        execute '!git clone https://github.com/Shougo/dein.vim' s:dein_repo_dir
    endif
    execute 'set runtimepath^=' . fnamemodify(s:dein_repo_dir, ':p')
endif

" dein.vim's configuration
if dein#load_state(s:dein_dir)
    call dein#begin(s:dein_dir)

    " plugin list file(TOML)
    let s:plugin_dir = expand('~/.vim/plugin')
    let s:toml       = s:plugin_dir . '/dein.toml'
    let s:lazy_toml  = s:plugin_dir . '/dein_lazy.toml'

    " load and cache plugin list files.
    call dein#load_toml(s:toml,      {'lazy': 0})
    call dein#load_toml(s:lazy_toml, {'lazy': 1})

    " configuration end
    call dein#end()
    call dein#save_state()
endif

" if there are plugins not installed, install it.
if dein#check_install()
    call dein#install()
endif

filetype plugin indent on

