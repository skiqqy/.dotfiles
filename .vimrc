" misc {{{
set updatetime=100
" }}}

" vim-plug {{{
call plug#begin('~/.vim/plugged')
Plug 'morhetz/gruvbox'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'rhysd/vim-clang-format'
Plug 'valloric/vim-indent-guides'
call plug#end()
" }}}

" Colors {{{
"GRUVBOX
colorscheme gruvbox
set background=dark

"MONOKAI DARK
"colorscheme monokai

"SPACE-VIM-DARK
"colorscheme space-vim-dark
"hi Comment cterm=italic
" }}}

" KEYBINDS {{{
nnoremap \ :noh<return>
nnoremap <C-\> :ToggleNumber()<CR>
nnoremap <C-l> :IndentGuidesToggle<return>
"space open/closes folds
nnoremap <space> za 
nnoremap <Tab> :bnext<CR>
nnoremap <S-Tab> :bprevious<CR>
nnoremap <S-x> :bdelete<CR>
" }}}

" ALL SETS {{{
set number
set relativenumber
"TAB SETTINGS
set tabstop=2     " Size of a hard tabstop (ts).
set shiftwidth=2  " Size of an indentation (sw).
set expandtab     " Always uses spaces instead of tab characters (et).
set softtabstop=0 " Number of spaces a <Tab> counts for. When 0, featuer is off (sts).
set autoindent    " Copy indent from current line when starting a new line.
set smarttab      " Inserts blanks on a <Tab> key (as per sw, ts and sts).
"END TAB SETTINGS
"FOLD SETTINGS
set foldenable
set foldlevelstart=10
set foldnestmax=10
set foldmethod=indent
"END FOLD SETTINGS
syntax enable
set cursorline
set wildmenu
set modelines=1
" }}}

" air-line {{{
let g:Powerline_symbols = 'fancy'
let g:airline_theme='base16'
let g:airline_solorized_bg='dark'
set t_Co=256

let g:airline#extensions#tabline#enabled = 1
let g:airline_powerline_fonts = 1
let g:airline#extensions#syntastic#enabled = 1
set laststatus=2
let g:airline_symbols={}

if !exists('g:airline_symbols')
    let g:airline_symbols = {}
endif

" unicode symbols
"let g:airline_left_sep = '»'
"let g:airline_left_sep = '▶'
"let g:airline_right_sep = '«'
"let g:airline_right_sep = '◀'
let g:airline_symbols.linenr = '␊'
let g:airline_symbols.linenr = '␤'
let g:airline_symbols.linenr = '¶'
let g:airline_symbols.branch = '⎇'
let g:airline_symbols.paste = 'ρ'
let g:airline_symbols.paste = 'Þ'
let g:airline_symbols.paste = '∥'
let g:airline_symbols.whitespace = 'Ξ'
" }}}

"vim:foldmethod=marker:foldlevel=0
