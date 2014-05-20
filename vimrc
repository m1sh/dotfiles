" Plugin management
execute pathogen#infect()

" Vim directories
if has("win32")
  let vimdir = $HOME.'\vimfiles'
else
  let vimdir = $HOME.'/.vim'
endif

" Auto-reload .vimrc
autocmd! bufwritepost .vimrc source %

" Backspace
set backspace=2

" Copy/paste
set pastetoggle=<F2>
set clipboard=unnamed

" Mouse ALT+click
" set mouse=a

" Bind <Leader> key
let mapleader = ","

" Quicksave
noremap <Leader>s :update<CR>
vnoremap <Leader>s <C-C>:update<CR>
inoremap <Leader>s <C-O>:update<CR>

" Quickquit
noremap <Leader>q :quit<CR> " Current window
noremap <Leader>Q :qa!<CR> " All windows

" Navigate buffers
set hidden
map <Leader>m :bn<CR>
map <Leader>n :bp<CR>

" Save/Load folds on enter/quit
autocmd BufWinLeave *.* mkview
autocmd BufWinEnter *.* silent loadview

" Disable win alt key
" set guioptions-=m
" set guioptions-=M

" Navigate windows
" map <C-j> <C-w>j
" map <C-k> <C-w>k
" map <C-l> <C-w>l
" map <C-h> <C-w>h

" Disable arrows
no <left> <Nop>
no <right> <Nop>
no <up> <Nop>
no <down> <Nop>
ino <left> <Nop>
ino <right> <Nop>
ino <up> <Nop>
ino <down> <Nop>
vno <left> <Nop>
vno <right> <Nop>
vno <up> <Nop>
vno <down> <Nop>

" Indent blocks
vnoremap > <gv
vnoremap < >gv

" Move lines up or down
nnoremap <C-j> :m .+1<CR>==
nnoremap <C-k> :m .-2<CR>==
inoremap <C-j> <Esc>:m .+1<CR>==gi
inoremap <C-k> <Esc>:m .-2<CR>==gi
vnoremap <C-j> :m '>+1<CR>gv=gv
vnoremap <C-k> :m '<-2<CR>gv=gv

" Highlight and Colorscheme
filetype off
filetype plugin indent on
map <Leader>h :nohl<CR>
syntax enable
colorscheme solarized
set background=light

" Indentation
set autoindent
set smartindent

" Line numbers
set number
set nowrap " No auto-wrap on load
set fo-=t " No auto-wrap when typing
set showbreak=↪ " Line wraps when wrapped

" Tabs to spaces
set tabstop=2
set softtabstop=2
set shiftwidth=2
set shiftround
set expandtab

" Insensitive search
set hlsearch
set incsearch
set ignorecase
set smartcase

" Hide Mode (-- INSERT -- and -- VISUAL --)
set noshowmode

" Disable backup files
set nobackup
set nowritebackup
set noswapfile

" Autocomplete (close preview automatically)
" set omnifunc=syntaxcomplete#Complete
" autocmd CursorMovedI * if pumvisible() == 0|pclose|endif
" autocmd InsertLeave * if pumvisible() == 0|pclose|endif

" jQuery autocomplete
let g:used_javascript_libs = 'jquery'
autocmd BufReadPre *.js let b:javascript_lib_use_jquery = 1

" CtrlP default command
let g:ctrlp_cmd = 'CtrlPMixed'

" Load highlights for special file extentions
au BufNewFile,BufRead *.md set filetype=markdown

" Use html snippets in PHP files
au BufNewFile,BufRead *.php set ft=php.html

" Use CakePHP snippets in ctp files
au BufRead,BufNewFile *.ctp set ft=php.cakephp.html

" Airline buffers
" Status line
set laststatus=2
" Buffers
let g:airline#extensions#tabline#enabled = 1

" UltiSnips
let g:UltiSnipsJumpForwardTrigger='<tab>'
let g:snips_author='Mishal El-Sanie <mishal.el-sanie@dupont.com>'
" let g:UltiSnipsSnippetsDir = vimdir.'/bundle/vim-snippets/UltiSnips'

" PHPDoc (PDV)
nnoremap <C-c> :call pdv#DocumentWithSnip()<CR>
let g:pdv_template_dir = vimdir.'/bundle/pdv/templates_snip'

" If on Windows Else on OS X
if has("win32") " gVim
  set guifont=Meslo\ LG\ S
else " Vim
  let g:airline_powerline_fonts = 1 " Airline symbols
endif
