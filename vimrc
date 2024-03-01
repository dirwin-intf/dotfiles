" be iMproved
set nocompatible

" stop making swap files
set nobackup
set noswapfile

" use the mouse
set mouse=a

" utilize the color capabilities of the terminal
let &t_8f = "[38;2;%lu;%lu;%lum"
let &t_8b = "[48;2;%lu;%lu;%lum"
set t_Co=256
set termguicolors
set background=dark

" backspace over newlines and tabs
set backspace=indent,eol,start

" see line and column numbers, highlight current line that the cursor is on
set ruler
set number
set cursorline

" never automatically wrap lines
set wrap!
set textwidth=0

" override vim's default italics escape sequence to something iterm2 can read (only when gruvbox is the colorscheme)
set t_ZH=[3m
set t_ZR=[23m

" hide the current mode since vim-airline will display it for us
set hidden

" command mode settings
set wildmenu
set showcmd
set cmdheight=2

" search settings
set ignorecase
set smartcase

" always display the statusline
set laststatus=2

" ask to quit instead of just failing outright
set confirm

" spaces, not tabs, 2 spaces long
set expandtab
set tabstop=2
set sts=2
set shiftwidth=2

" prettify my text
filetype indent plugin on
syntax on

" [remaps]
" set leader key to spacebar for easy access
let mapleader="\<Space>"

" insert newlines without entering insert mode
nnoremap <leader>o mzo<esc>`z
nnoremap <leader>O mzO<esc>`z

" equalize without moving the cursor
nnoremap == gg=G``zz

" keep cursor on the centerline when possible
nnoremap j jzz
nnoremap k kzz
vnoremap j jzz
vnoremap k kzz
nnoremap n nzz
nnoremap N Nzz

" escape modes with jk (highly unlikely to type this digraph whilst programming, plus your fingers should always be over it, plus "just kidding")
inoremap jk <esc>
cnoremap jk <esc>

"
nnoremap Y y$

" movement
nnoremap <leader>wh <c-w>h
nnoremap <leader>wj <c-w>j
nnoremap <leader>wk <c-w>k
nnoremap <leader>wl <c-w>l

" move lines
nnoremap <C-j> <esc>:m .+1<cr>==
nnoremap <C-k> <esc>:m .-2<cr>==
inoremap <C-j> <esc>:m .+1<cr>==gi
inoremap <C-k> <esc>:m .-2<cr>==gi

" NERDTree
nnoremap <leader>nt :NERDTreeFocus <cr>
nnoremap .. /\.\. <cr>

" remove trailing white space
nnoremap rmws :%s/\s\+$//e <cr> <bar> :echo('removed trailing whitespace') <cr>

" git gutter movement
nnoremap <leader>gn :GitGutterNextHunk <cr>
nnoremap <leader>gN :GitGutterPrevHunk <cr>
nnoremap <leader>gp :GitGutterPreviewHunk <cr>
nnoremap <leader>gu :GitGutterUndoHunk <cr>

" ALE movement
nnoremap <leader>an :ALENext <cr>
nnoremap <leader>aN :ALEPrevious <cr>

command JsonFormat :%!python3 -m json.tool

" Relative or absolute number lines
function! NumberToggle()
    if(&rnu == 1)
        set nornu
    else
        set rnu
    endif
endfunction

nnoremap ~ :call NumberToggle()<CR>

" plugins
call plug#begin()

" colorschemes and themes
Plug 'gruvbox-community/gruvbox'
Plug 'ajmwagar/vim-deus'
Plug 'NLKNguyen/papercolor-theme'
Plug 'co1ncidence/bliss'
Plug 'sainnhe/everforest'
Plug 'embark-theme/vim'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

" file tree explorer
Plug 'scrooloose/nerdtree'

" text editing
Plug 'wesQ3/vim-windowswap'
Plug 'jiangmiao/auto-pairs'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-commentary'
Plug 'alvan/vim-closetag'
Plug 'wsdjeg/vim-fetch'

" git plugins
Plug 'tpope/vim-fugitive'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'airblade/vim-gitgutter'

" language support
Plug 'pangloss/vim-javascript'
Plug 'elixir-editors/vim-elixir'
Plug 'posva/vim-vue'

" asynchronous linting engine
Plug 'w0rp/ale'

" completion engine
Plug 'ycm-core/YouCompleteMe'

call plug#end()

" everforest settings
let g:everforest_background = 'medium'
let g:everyforest_ui_contrast = 'high'
let g:everyforest_float_style = 'dim'

" gruvbox settings
let g:gruvbox_italic=1
let g:gruvbox_contrast_light = 'light'
let g:gruvbox_contrast_dark = 'hard'

" colorscheme settings
colorscheme embark

" ale settings
let g:ale_fixers = {
\   'javascript': [
\       'eslint',
\   ],
\}


" vim-airline settings
let g:airline_theme = 'embark'
let g:airline_skip_empty_sections = 1
let g:airline_section_y = ''
let g:airline_section_z = '%l/%L : %c'

" closetags options
let g:closetag_filetypes = 'html,vue'

" if nerd tree is the last buffer, exit vim
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
