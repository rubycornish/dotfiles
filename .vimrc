""" VUNDLE SETUP

set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

Plugin 'altercation/vim-colors-solarized'
Plugin 'bling/vim-bufferline'
Plugin 'nelstrom/vim-markdown-folding'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required

""" VUNDLE SETUP END


"-----


""" File encoding set to UTF-8
set encoding=utf-8
set t_Co=256

""" Colours and syntax
syntax enable               " enable syntax processing
set background=light        " make background light
colorscheme solarized       " set colour scheme
let g:solarized_contrast="high"      "default value is normal 
let g:solarized_visibility="high"    "default value is normal
"colorscheme desert
"set guifont=Consolas:h10:cANSI
set guioptions-=T           " switch off the toolbar icons
au BufNewFile,BufFilePre,BufRead *.md set filetype=markdown " add markdown syntax highlighting to .md files
set clipboard=unnamed       " makes copy/paste work as expected on Mac 
 
""" Tab options
set tabstop=2       " number of visual spaces per TAB
set softtabstop=2   " number of spaces in tab when editing
set expandtab       " tabs are spaces
set shiftwidth=2    " makes >> indent 4 spaces
 
""" UI Changes
 
" this function toggles relative numbers
function! NumberToggle()
  if(&relativenumber == 1)
    set norelativenumber
  else
    set relativenumber
  endif
endfunc
 
" map CTRL-N to toggle relative numbers
nnoremap <C-n> :call NumberToggle()<cr>

set showcmd             " show command in bottom bar
set hidden              " allows to switch buffers without saving
set cursorline          " highlight current line
set lazyredraw          " redraw only when we need to.
set showmatch           " highlight matching [{()}]
set backspace=2         " makes backspace delete over indent, eol and start of insert session
let mapleader=" "       " makes space the leader key
let maplocalleader='\' " makes backslash local leader
set ai                  " set autoindent
set scrolloff=3         " Minimum lines to keep above and below cursor

" make jj act as Esc
inoremap jj <Esc>


""" Statusline

set laststatus=2
set statusline=%f         " Path to the file
set statusline+=%=        " Switch to the right side
set statusline+=%l        " Current line
set statusline+=/         " Separator
set statusline+=%L        " Total lines
 
""" Shortcuts to display buffer, tabs, marks and registers
 
nnoremap <leader>b  :pwd \| echo ' ' \| buffers   \| echo ' '<cr>:b
nnoremap <leader>t  :pwd             \| tabs      \| echo ' '<cr>:tab
nnoremap <leader>'  :pwd \| echo ' ' \| marks     \| echo ' '<cr>
nnoremap <leader>"  :       echo ' ' \| registers \| echo ' '<cr>

""" Numbers
set nrformats=          " treat all numbers as decimal, this stops numbers with leading 0s be treated as octal
 
 
""" Search options
 
set ignorecase          " ignores case except for smartcase
set smartcase           " if a search includes an uppercase character than make it case sensitive
set incsearch           " search as characters are entered
set hlsearch            " highlight matches

" turn off search highlight by using leader and <space>
nnoremap <leader><space> :nohlsearch<CR>
 
 
""" Movement
 
" move vertically by visual line
nnoremap j gj
nnoremap k gk
 
" move between windows using control and normal movement keys
nnoremap <c-j> <c-w>j
nnoremap <c-k> <c-w>k
nnoremap <c-h> <c-w>h
nnoremap <c-l> <c-w>l
 
""" Shortcuts
 
" make capital w save as well
nnoremap :W :w
 
 
""" Backups
 
set backupdir=~/.tmp/backup//
set directory=~/.tmp/swp//


""" Sessions

set ssop-=options    " do not store global and local values in a session
set ssop-=folds      " do not store folds
set nofoldenable     " do not open document folded
 
 
""" Spelling
 
" Toggle spelling with F10
nnoremap <F10> :setlocal spell! spelllang=en_gb<CR>


"" Insert date
:nnoremap <F5> "=strftime("%Y-%m-%d ")<CR>P
:inoremap <F5> <C-R>=strftime("%Y-%m-%d ")<CR>

"
"" Open Explorer
nnoremap <leader>k :Explorer<CR>
