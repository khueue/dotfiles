syntax on
set showcmd
set number
set showmatch
set hls
set paste

source $VIMRUNTIME/macros/matchit.vim
let b:match_words = '<%:%>,{:},(:),[:]'

set statusline=%F%=%l,%c
set laststatus=2
set ruler

vmap > >gv
vmap < <gv
vnoremap <tab> >gv
vnoremap <S-tab> <gv

set tabstop=4                   " 4 spaces per tab
set shiftwidth=4                " Indent 4 spaces
set softtabstop=4               " Tab stop at 4 spaces

:se cursorline
:hi CursorLine term=none cterm=none ctermbg=4
:autocmd InsertLeave * hi CursorLine term=none cterm=none ctermbg=4
:autocmd InsertEnter * hi CursorLine term=none cterm=none ctermbg=1 ctermfg=7

:autocmd InsertEnter * set cul
:autocmd InsertLeave * set nocul

set t_Co=256
"colorscheme oceandeep
colorscheme distinguished

autocmd BufWritePre * :%s/\s\+$//e
