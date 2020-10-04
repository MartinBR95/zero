set nocompatible
filetype plugin on
syntax on

call plug#begin('/home/zero/local/share/nvim/plugged')
	Plug 'whatyouhide/vim-gotham'
	Plug 'morhetz/gruvbox'
	Plug 'vimwiki/vimwiki'
	"Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
	Plug 'AndrewRadev/linediff.vim'
	Plug 'tpope/vim-obsession'
	Plug 'mbbill/undotree'
	Plug 'easymotion/vim-easymotion'
	Plug 'rafaqz/ranger.vim'
	Plug 'junegunn/vim-easy-align'
	Plug 'wesQ3/vim-windowswap'
	Plug 'chrisbra/Recover.vim'
	Plug 'neovim/nvim-lspconfig'
call plug#end()

let mapleader                    = " "
let g:deoplete#enable_at_startup = 1
let g:undotree_ShortIndicators   = 1
let g:gruvbox_contrast_dark      = "hard"
let g:undotree_WindowLayout      = 2
let g:undotree_DiffpanelHeight   = 5
let g:EasyMotion_smartcase       = 1

inoremap fj <esc>
inoremap jf <esc>
nmap <Leader>h <C-w>h
nmap <Leader>j <C-w>j
nmap <Leader>k <C-w>k
nmap <Leader>l <C-w>l
nmap <Leader>f <Plug>(easymotion-s2)
nmap <Leader>nt :NERDTreeToggle<CR>
nmap <Leader>z :ZoomToggle<CR>
nmap <Leader>u :UndotreeToggle<CR>
nnoremap <expr> <C-J> &diff ? ']czz' : '<C-W>j'
nnoremap <expr> <C-k> &diff ? '[czz' : '<C-W>k'
nnoremap <expr> <C-h> &diff ? ':diffget<enter>' : '<C-W>h'
nnoremap <expr> <C-l> &diff ? ':diffput<enter>' : '<C-W>l'
map <leader>rr  :RangerEdit<cr>
map <leader>rv  :RangerVSplit<cr>
map <leader>rs  :RangerSplit<cr>
map <leader>rt  :RangerTab<cr>
map <leader>rd  :RangerCD<cr>
map <leader>rld :RangerLCD<cr>
map <leader>wi  :VimwikiIndex<cr>

"colorscheme gotham256
colorscheme gruvbox

set nobackup
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
set sidescrolloff=30
set sidescroll=0
set backupdir=~/.config/nvim/tmp/backup
hi Normal guibg=NONE ctermbg=NONE

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
