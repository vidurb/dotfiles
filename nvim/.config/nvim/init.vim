" Plugins
call plug#begin()

" Functional
Plug 'tpope/vim-fugitive'
Plug 'christoomey/vim-tmux-navigator'
Plug 'scrooloose/nerdtree'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'sjl/gundo.vim'
Plug 'sgur/vim-editorconfig'
Plug 'pangloss/vim-javascript'
Plug 'dag/vim-fish'
Plug 'mattn/emmet-vim'

" Syntax
Plug 'gabrielelana/vim-markdown'
Plug 'neoclide/coc.nvim', {'tag': '*', 'do': './install.sh'}

" Display
Plug 'luochen1990/rainbow'
Plug 'nathanaelkane/vim-indent-guides'
Plug 'bling/vim-airline'
Plug 'godlygeek/csapprox'
Plug 'chrisbra/Colorizer'

" Theme
Plug 'arcticicestudio/nord-vim'

call plug#end()  

set nu          
set autoindent    " useful when writing code to maintain indenting
                  "  goes back one indent while still in insert mode

set smartindent   " starts indenting based on language of code 
set ignorecase    " causes searches to be case insensitive
set smartcase     " case sensitive search when item has an upper case letter
set incsearch     " starts search as you type the search pattern
set nohlsearch    " future matches aren't highlighted

set backspace=indent,eol,start  " backspace key acts like standard text editor 

set showmatch     " matches { [ and ( as your type

set shiftround    " maintains indent when tabs and spaces are mixed
   
set noerrorbells  " errors won't make noise
set visualbell    " screen flashes moving beyond begin/end and unmatched close

" Show the mode
set showmode      " reports when inserting, otherwise, you are in command mode
set report=0      " reports changes involving more than 0 lines
set ruler	  " reports line and column number
" Show syntax
syntax on         " colors keywords in language

" Tab completion works properly (UNIX Style) and shows menu of possible options.
set wildmenu
set wildmode=longest,list,full
set wildignore=*.o,*.bak,*.data,*.class

" Gundo
nnoremap <F5> :GundoToggle<CR>

" Removing this stuff until I can figure it out
"let g:airline#extensions#tabline#enabled = 1
"let g:airline#extensions#tabline#fnamemod = 1
"let g:syntastic_always_populate_loc_list = 1
"let g:syntastic_auto_loc_list = 1
"let g:syntastic_check_on_open = 1
"let g:syntastic_check_on_wq = 0
"let g:syntastic_cpp_check_header = 1

" Theme
colorscheme nord 

set shiftwidth=4
set softtabstop=4
set expandtab

" Get colors right in TUI
if has("termguicolors")
	set termguicolors
endif

" Stop highlighting being deleted on bufleave
let g:colorizer_disable_bufleave = 1
let g:colorizer_use_virtual_text = 1

" Set correct node version for coc.vim
let g:coc_node_path = '/home/vidur/.asdf/shims/node'

" filetype settings
autocmd FileType json syntax match Comment +\/\/.\+$+
