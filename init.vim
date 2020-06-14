set nocompatible
filetype plugin on
syntax on

call plug#begin('/home/zero/local/share/nvim/plugged')
	Plug 'whatyouhide/vim-gotham'
	Plug 'morhetz/gruvbox'
	Plug 'vimwiki/vimwiki'
	Plug 'preservim/nerdtree'
	Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
	Plug 'AndrewRadev/linediff.vim'
	Plug 'tpope/vim-obsession'
	Plug 'mbbill/undotree'
	Plug 'easymotion/vim-easymotion'
call plug#end()

let mapleader = " "
let g:deoplete#enable_at_startup = 1
let g:undotree_ShortIndicators = 1
let g:gruvbox_contrast_dark = "hard"

inoremap fj <esc>
inoremap jf <esc>
nmap <Leader>h <C-w>h
nmap <Leader>j <C-w>j
nmap <Leader>k <C-w>k
nmap <Leader>l <C-w>l
nmap <Leader>f <Plug>(easymotion-s2)
nmap <Leader>nt :NERDTreeFind<CR>

"colorscheme gotham256
colorscheme gruvbox

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
" Disable auto tabulation when pasting
let &t_SI .= "\<Esc>[?2004h"
let &t_EI .= "\<Esc>[?2004l"

inoremap <special> <expr> <Esc>[200~ XTermPasteBegin()

function! XTermPasteBegin()
  set pastetoggle=<Esc>[201~
  set paste
  return ""
endfunction
