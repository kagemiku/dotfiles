" escape shortcut
inoremap <silent> jj <ESC>
inoremap <silent> <C-j> j

" moving cursor between line
nnoremap j gj
nnoremap k gk
nnoremap <Down> gj
nnoremap <Up> gk

" moving cursor
inoremap <C-d> <delete>
inoremap <C-j> <Down>
inoremap <C-k> <Up>
inoremap <C-h> <Left>
inoremap <C-l> <Right>

" changing active window
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

" changing window size
nnoremap <S-Left> <C-w><
nnoremap <S-Right> <C-w>>
nnoremap <S-Up> <C-w>-
nnoremap <S-Down> <C-w>+

" tab
nnoremap st :<C-u>tabnew<CR>
nnoremap sn gt
nnoremap sp gT
nnoremap sq :<C-u>q<CR>

" completion
inoremap {<Enter> {}<Left><CR><ESC><S-o>

" searching
nnoremap <silent><Esc><Esc> :<C-u>set nohlsearch!<CR>

" convinience
nnoremap <C-g> ggVGy

