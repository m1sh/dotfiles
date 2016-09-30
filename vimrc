" Plugin management
execute pathogen#infect()

" Vim directories
if has("win32")
  let vimdir = $HOME.'\vimfiles'
else
  let vimdir = $HOME.'/.vim'
endif
set autochdir

" Auto-reload .vimrc
autocmd! bufwritepost .vimrc source %

" Backspace
set backspace=2

" Encoding
set encoding=utf-8
set fileencoding=utf-8

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
map <Leader>c :bd<CR>

" Save/Load folds on enter/quit
autocmd BufWinLeave *.* mkview
autocmd BufWinEnter *.* silent loadview

" Remove gVim toolbar
set guioptions-=T

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
set cursorline " Highlight current line + line number

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
" Minitest completion
set completefunc=syntaxcomplete#Complete

" jQuery autocomplete
let g:used_javascript_libs = 'jquery'
autocmd BufReadPre *.js let b:javascript_lib_use_jquery = 1

" CtrlP default command
" let g:ctrlp_cmd = 'CtrlPMixed'
let g:ctrlp_root_markers = ['.ctrlp']
let g:ctrlp_extensions = ['bookmarkdir']
let g:ctrlp_custom_ignore = '\v[\/](attachments|vendor|node_modules|bower_components)$'

" Load highlights for special file extentions
au BufNewFile,BufRead *.md set filetype=markdown

" Use html snippets in PHP files
au BufNewFile,BufRead *.php set ft=php.html
"
" Use blade snippets in PHP files
au BufNewFile,BufRead *.blade.php set ft=blade.html

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
let g:UltiSnipsSnippetsDir = vimdir.'/bundle/snippets/UltiSnips'

" Syntastic
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1

" PHPDoc (PDV)
nnoremap <C-c> :call pdv#DocumentWithSnip()<CR>
let g:pdv_template_dir = vimdir.'/bundle/pdv/templates_snip'

" If on Windows Else on OS X
if has("win32") " gVim
  set guifont=Monaco
  " Defautl window size
  set lines=30
  set columns=150
else " Vim
  set ttimeoutlen=250 " Lag in terminal vim
  let g:airline_powerline_fonts = 1 " Airline symbols
endif

" QuickfixDo
command! -nargs=0 -bar Qargs execute 'args' QuickfixFilenames()
function! QuickfixFilenames()
  " Building a hash ensures we get each buffer only once
  let buffer_numbers = {}
  for quickfix_item in getqflist()
    let buffer_numbers[quickfix_item['bufnr']] = bufname(quickfix_item['bufnr'])
  endfor
  return join(map(values(buffer_numbers), 'fnameescape(v:val)'))
endfunction
