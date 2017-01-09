""" Package loader
execute pathogen#infect()


""" List of packages for git
"https://github.com/altercation/vim-colors-solarized
"https://github.com/tpope/vim-fireplace
"https://github.com/vim-pandoc/vim-pandoc
"https://github.com/vim-pandoc/vim-pandoc-syntax
"https://github.com/JamshedVesuna/vim-markdown-preview
"https://github.com/wlangstroth/vim-racket
 

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
 
 
""" Tab options
set tabstop=4       " number of visual spaces per TAB
set softtabstop=4   " number of spaces in tab when editing
set expandtab       " tabs are spaces
 
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
set wildmenu            " visual autocomplete for command menu set wildmode=longest:full,full "makes the completion menu show up on first tab with the longest completion first, the second tab will complete with that longest term
set wildcharm=<C-y>     " this sets the wildcharm as Ctrl y
set lazyredraw          " redraw only when we need to.
filetype indent on      " load filetype-specific indent files
set showmatch           " highlight matching [{()}]
set backspace=2         " makes backspace delete over indent, eol and start of insert session
let mapleader=" "       " makes space the leader key
set ai                  " set autoindent
set scrolloff=3         " Minimum lines to keep above and below cursor


""" Statusline

set laststatus=2
set statusline=%f         " Path to the file
set statusline+=%=        " Switch to the right side
set statusline+=%l        " Current line
set statusline+=/         " Separator
set statusline+=%L        " Total lines
 
""" Buffers
 
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
 
 
""" Spelling
 
" Toggle spelling with F10
nnoremap <F10> :setlocal spell! spelllang=en_uk<CR>


""" Insert date
:nnoremap <F5> "=strftime("%Y-%m-%d ")<CR>P
:inoremap <F5> <C-R>=strftime("%Y-%m-%d ")<CR>


""" Mark task as done by prepending x and date then sorting the file
:nnoremap <F6> Ix<Space><C-R>=strftime("%Y-%m-%d ")<CR><ESC>:sort<CR>


""" Explorer
nnoremap <leader>k :Explore<CR>


""" Make md files be treated as markdown 
autocmd BufNewFile,BufRead *.md set filetype=markdown


""" Remove the gutter column from pandoc-markdown
let g:pandoc#folding#fdc = 0
