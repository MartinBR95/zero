call plug#begin('/home/zero/local/share/nvim/plugged')
Plug 'whatyouhide/vim-gotham'
Plug 'vimwiki/vimwiki'
Plug 'preservim/nerdtree'
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'AndrewRadev/linediff.vim'
Plug 'tpope/vim-obsession'
let g:deoplete#enable_at_startup = 1
call plug#end()
set nocompatible
filetype plugin on
syntax on
inoremap fj <esc>
inoremap jf <esc>
colorscheme gotham256
set number
set ignorecase
set cursorline
set hlsearch
set incsearch
set relativenumber
set nowrap
set shiftwidth=4
set tabstop=4
set splitbelow splitright
set scrolloff=3
set sidescrolloff=3
set spell
set sidescroll=0
set smartcase
" Zoom / Restore window.
function! s:ZoomToggle() abort
    if exists('t:zoomed') && t:zoomed
        execute t:zoom_winrestcmd
        let t:zoomed = 0
    else
        let t:zoom_winrestcmd = winrestcmd()
        resize
        vertical resize
        let t:zoomed = 1
    endif
endfunction
command! ZoomToggle call s:ZoomToggle()
