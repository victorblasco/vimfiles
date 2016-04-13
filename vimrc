" vimrc
" Author: Codegram
" Source: https://github.com/codegram/vimfiles

if !1 | finish | endif

" Use NeoBundle as the plugin manager

if has('vim_starting')
  set nocompatible
  set runtimepath+=~/.vim/bundle/neobundle.vim
endif

call neobundle#begin(expand('~/.vim/bundle/'))
NeoBundleFetch 'Shougo/neobundle.vim'

" -------
" BUNDLES
" -------

NeoBundle 'tpope/vim-commentary'
NeoBundle 'kien/ctrlp.vim'

" NERDTree
NeoBundle 'scrooloose/nerdtree'
NeoBundle 'Xuyuanp/nerdtree-git-plugin'

NeoBundle 'mattn/webapi-vim'
NeoBundle 'mattn/gist-vim'

NeoBundle 'tpope/vim-fugitive'
NeoBundle 'Townk/vim-autoclose'
NeoBundle 'scrooloose/syntastic'

NeoBundle 'rking/ag.vim'

NeoBundle 'bling/vim-airline'

NeoBundle 'terryma/vim-multiple-cursors'

" Elixir
NeoBundle 'elixir-lang/vim-elixir'

" Go
NeoBundle 'fatih/vim-go'

" Tab for completion
NeoBundle 'ervandew/supertab'

NeoBundle 'airblade/vim-gitgutter'
NeoBundle 'sheerun/vim-polyglot'
NeoBundle 'majutsushi/tagbar'

NeoBundle 'rizzatti/funcoo.vim'
NeoBundle 'rizzatti/dash.vim'

NeoBundle 'gcmt/wildfire.vim'

" Themes
NeoBundle 'sjl/badwolf'
NeoBundle 'ajh17/Spacegray.vim'
NeoBundle 'w0ng/vim-hybrid'

call neobundle#end()

syntax on
filetype plugin indent on

" ----------
" Leader key
" ----------
let mapleader = ","
let maplocalleader = "."

" --------
" Settings
" --------

set autoindent
set autoread
set backspace=indent,eol,start
set binary
set cinoptions=:0,(s,u0,U1,g0,t0
set completeopt=menuone,preview
set expandtab
set foldcolumn=0
set foldlevel=9
set foldmethod=indent
set hidden
set history=1000
set hlsearch
set ignorecase
set incsearch
set gdefault
set laststatus=2
set list
set listchars=trail:·
set modelines=5
set nobackup
set noeol
set nofoldenable
set noswapfile
set number
set numberwidth=4
set ruler
set shell=/bin/bash
set shiftwidth=2
set showcmd
set showmatch
set smartcase
set tabstop=2
set softtabstop=2
set title
set encoding=utf-8
set scrolloff=3
set autoindent
set smartindent
set showmode
set wildmenu
set wildmode=list:longest
set visualbell
set cursorline
set ttyfast
set textwidth=78
set wildignore+=.svn,CVS,.git,.hg,*.o,*.a,*.class,*.mo,*.la,*.so,*.obj,*.swp,*.jpg,*.png,*.xpm,*.gif,.gitkeep,.DS_Store
set textwidth=79
set formatoptions=n
set colorcolumn=79
set tw=79
set t_Co=256
set iskeyword+=_

" Improve performance (due to syntax highlighting)
set nocursorcolumn
set nocursorline
set norelativenumber
syntax sync minlines=50
set synmaxcol=120

if has("gui_running")
  set guioptions-=T " no toolbar
  set guioptions-=m " no menus
  set guioptions-=r " no scrollbar on the right
  set guioptions-=R " no scrollbar on the right
  set guioptions-=l " no scrollbar on the left
  set guioptions-=b " no scrollbar on the bottom
  set guioptions=aiA
  set mouse=v
endif

autocmd BufWritePre * :%s/\s\+$//e " strip trailing whitespace

" ------------
" Vim Mappings
" ------------

nnoremap <up> <nop>
nnoremap <down> <nop>
nnoremap <left> <nop>
nnoremap <right> <nop>
inoremap <up> <nop>
inoremap <down> <nop>
inoremap <left> <nop>
inoremap <right> <nop>

nnoremap j gj
nnoremap k gk

imap jk <ESC>

" Search
nmap <Space> /
nnoremap / /\v
vnoremap / /\v

" Clear search
nnoremap <leader><space> :noh<cr>

" Saving and buffer stuff
nmap <leader><ESC> :q!<CR>
nmap <leader>q :wqa!<CR>
nmap <leader>w :w!<CR>
nmap <leader>e :wa!<CR>

" Switch between / delete buffers
noremap <tab> :bn<CR>
noremap <S-tab> :bp<CR>
nmap <leader>d :bd<CR>

" Splits
nnoremap <leader>v :vs<CR> <C-w>l
nnoremap <leader>x :sp<CR> <C-w>j
nnoremap <leader>d :hide<CR>
" nnoremap <leader>f :only<CR>
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

" Paste mode
set pastetoggle=<F2>

" Copy to clipboard with Ctrl-C
map <C-c> "+y<CR>"

" Rename current file
function! RenameFile()
  let old_name = expand('%')
  let new_name = input('New file name: ', expand('%'))
  if new_name != '' && new_name != old_name
    exec ':saveas ' . new_name
    exec ':silent !rm ' . old_name
    redraw!
  endif
endfunction
map <leader>n :call RenameFile()<cr>

" Open current split in a new tab
function! OpenCurrentAsNewTab()
  let l:currentPos = getcurpos()
  tabedit %
  call setpos(".", l:currentPos)
endfunction
nmap <leader>f :call OpenCurrentAsNewTab()<CR>

" ------------------------
" Plugin settings/mappings
" ------------------------

" Ag
nmap <leader>a :Ag
let g:ag_working_path_mode = 'r'

" Rotating among results
map <C-n> :cn<CR>
map <C-p> :cp<CR>

" Fugitive (Git)
nmap <leader>gs :Gstatus<CR>
nmap <leader>gc :Gcommit<CR>
vmap <leader>gb :Gblame<CR>

" GitGutter
nmap gh <Plug>GitGutterNextHunk
nmap gH <Plug>GitGutterPrevHunk

" Vim Gist
let g:gist_clip_command = 'pbcopy'
" let g:gist_clip_command = 'xclip -selection clipboard'
let g:gist_detect_filetype = 1
let g:gist_open_browser_after_post = 1
let g:gist_post_private = 1

" Tagbar
nnoremap <silent> <Leader>b :TagbarToggle<CR>

" Ctrlp.vim
let g:ctrlp_map = '<leader>o'
let g:ctrlp_working_path_mode = 'ra'
map <leader>c :CtrlPTag<cr>

" AutoClose
let g:AutoClosePairs = {'(': ')', '{': '}', '[': ']', '"': '"', "'": "'", '#{': '}'}
let g:AutoCloseProtectedRegions = ["Character"]

" Ctags
" You can use Ctrl-] to jump to a function.... Ctrl-p will jump back
map <C-\> :tab split<CR>:exec("tag ".expand("<cword>"))<CR>

" You can cycle through multiple function definitions using
" these mappings. This maps to my windows key + left/right arrows
map <F7> :tnext<CR>
map <F9> :tprev<CR>

" Syntastic
let g:syntastic_check_on_open=1
let g:syntastic_echo_current_error=0
let g:syntastic_auto_jump=0
let g:syntastic_auto_loc_list=0

" Wildfire
nmap <leader>s <Plug>(wildfire-quick-select)

" NERDTree
map <leader>p :NERDTreeToggle<CR>

" vim-airline
set laststatus=2
let g:airline_powerline_fonts = 1

" vim-multiple-cursos
let g:multi_cursor_next_key='<C-n>'
let g:multi_cursor_prev_key='<C-p>'
let g:multi_cursor_skip_key='<C-x>'
let g:multi_cursor_quit_key='<Esc>'

" vim-go
let g:go_fmt_command = "goimports"

" --------------------
" CUSTOM CONFIGURATION
" --------------------
let my_home = expand("$HOME/")
if filereadable(my_home . '.vimrc.local')
  source ~/.vimrc.local
endif

if &term =~ '256color'
  " Disable Background Color Erase (BCE) so that color schemes
  " work properly when Vim is used inside tmux and GNU screen.
  " See also http://snk.tuxfamily.org/log/vim-256color-bce.html
  set t_ut=
endif

colorscheme hybrid_reverse

NeoBundleCheck