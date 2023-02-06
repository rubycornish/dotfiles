""" Plugin manager

call plug#begin()

" Vim Git plugin
Plug 'tpope/vim-fugitive'

" Python autocomplete
Plug 'davidhalter/jedi-vim'

" Ale linter
Plug 'dense-analysis/ale'

" Black Python code formatting
Plug 'psf/black', { 'branch': 'stable' }

" Markdown
Plug 'preservim/vim-markdown'

" Fuzzy file search
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }


call plug#end()


""" Not sure if this is needed still?
filetype plugin on


""" Colours and syntax
syntax enable               " enable syntax processing


""" Tab options
set tabstop=4       " number of visual spaces per TAB
set softtabstop=4   " number of spaces in tab when editing
set expandtab       " tabs are spaces
set shiftwidth=4    " makes >> indent 4 spaces


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
nnoremap <C-m> :call NumberToggle()<cr>

set showcmd             " show command in bottom bar
set hidden              " allows to switch buffers without saving
set showmatch           " highlight matching [{()}]
set backspace=2         " makes backspace delete over indent, eol and start of insert session
let mapleader=" "       " makes space the leader key
let maplocalleader='\'  " makes backslash local leader
set ai                  " set autoindent
set scrolloff=3         " Minimum lines to keep above and below cursor
autocmd InsertLeave * update    "  Write the buffer automatically on leaving insert mode.

" enable autocompletion of vim commands
set wildmenu
set wildmode=longest:full,full

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


""" Shortcuts

" make capital w save as well
nnoremap :W :w

" Move list element up and down
nnoremap <A-j> :m .+1<CR>
nnoremap <A-k> :m .-2<CR>
vnoremap <A-j> :m '>+1<CR>gv
vnoremap <A-k> :m '<-2<CR>gv


""" Backups

set backupdir=~/.tmp/backup//
set directory=~/.tmp/swp//


""" Sessions

"set ssop-=options    " do not store global and local values in a session

""" Folds
"set ssop-=folds      " do not store folds
"set nofoldenable     " do not open document folded


""" Spelling
" Toggle spelling with F10
nnoremap <F10> :setlocal spell! spelllang=en_gb<CR>


""" Insert date
nnoremap <F5> "=strftime("%Y-%m-%d ")<CR>P
inoremap <F5> <C-R>=strftime("%Y-%m-%d ")<CR>


""" Run Python script
" nnoremap <F5> :w<CR>:!pipenv run python %<CR>

""" Ale config
"let g:ale_linters = {'python': ['flake8', 'pydocstle', 'mypy']}
let g:ale_fixers = {'*': ['remove_trailing_lines', 'trim_whitespace'], 'python': ['black', 'isort']}
let g:ale_fix_on_save = 1
let g:ale_exclude_highlights = ['line too long']

""" File explorer
nnoremap <C-n> :Lexplore<CR>
let g:netrw_winsize = 30
"let g:netrw_banner = 0
