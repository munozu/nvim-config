call plug#begin('~/.local/share/nvim/plugged')

Plug 'scrooloose/nerdtree'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-vinegar'
Plug 'tpope/vim-fugitive'
Plug 'itchyny/lightline.vim'
Plug 'jiangmiao/auto-pairs'
Plug 'chriskempson/base16-vim' 
Plug 'Yggdroot/indentLine'
Plug 'mattn/emmet-vim', { 'for': ['javascript.jsx', 'html', 'css', 'scss'] }
Plug 'ctrlpvim/ctrlp.vim'
Plug 'taohex/lightline-buffer'

call plug#end()
filetype indent on

nmap <c-s-t> :vs<bar>:b#<CR>:wq

" ----- theme --------
set cc=100 " highlight five columns after 'textwidth'
set lazyredraw
set termguicolors
let base16colorspace=256  " Access colors present in 256 colorspace"

colorscheme base16-monokai
set cursorline 
hi ColorColumn ctermbg=darkgrey guibg=darkgrey


" ----- indentline ------
let g:indentLine_char = '│'
let g:indentLine_enabled = 1

" ------- emmet vim ------
let g:user_emmet_install_global = 0
let g:user_emmet_leader_key='<C-z>'
let g:user_emmet_settings = {
\ 'javascript.jsx' : {
\   'extends' : 'jsx',
\ },
\}
autocmd FileType vue,html,css,scss,javascript.jsx EmmetInstall


" ------ Custom Mappings -------
"  leader
let mapleader = ","
let g:mapleader = ","


" Ctrl-s to save
noremap <silent> <C-S>          :update<CR>
vnoremap <silent> <C-S>         <C-C>:update<CR>
inoremap <silent> <C-S>         <C-O>:update<CR>

" Ctrl-o to open file in window
function! ReplaceBuffer(bang, newfile)
  let curbuf = bufnr('%')
  exec "e " . a:newfile
  exec "bd" . a:bang . " " . curbuf
endfunction
command! -nargs=1 -complete=file -bang -bar BDE call ReplaceBuffer('<bang>', <f-args>)<Paste>

" ------- vim splits ------
" navigate splits ctrl+[h,j,k,l]
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

set splitbelow
set splitright


" ------ NERDTree -------
let g:NERDTreeWinSize = 24
let g:NERDTreeMinimalUI = 1
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif


" ------- buffer -------
" This allows buffers to be hidden if you've modified a buffer.
" This is almost a must if you wish to use buffers in this way.
set hidden

" To open a new empty buffer
" This replaces :tabnew which I used to bind to this mapping
nmap <leader>T :enew<cr>

" Move to the next buffer
nmap <leader>l :bnext<CR>

" Move to the previous buffer
nmap <leader>h :bprevious<CR>

" Close the current buffer and move to the previous one
" This replicates the idea of closing a tab
nmap <leader>bq :bp <BAR> bd #<CR>

" Show all open buffers and their status
nmap <leader>ls :ls<CR>

" ------ Ctrlp -----
" Setup some default ignores
let g:ctrlp_custom_ignore = {
  \ 'dir':  '\v[\/](\.(git|hg|svn)|\_site|node_modules)$',
  \ 'file': '\v\.(exe|so|dll|class|png|jpg|jpeg)$',
\}

" Use the nearest .git directory as the cwd
" This makes a lot of sense if you are working on a project that is in version
" control. It also supports works with .svn, .hg, .bzr.
let g:ctrlp_working_path_mode = ''
set wildignore+=*/tmp/*,*/node_modules/*,*.so,*.swp,*.zip     " MacOSX/Linux
set wildignore+=*\\tmp\\*,*\\node_modules\\*,*.swp,*.zip,*.exe  " Windowskjh

" Easy bindings for its various modes
nmap <leader>bb :CtrlPBuffer<cr>
nmap <leader>bm :CtrlPMixed<cr>
nmap <leader>bs :CtrlPMRU<cr>

" -------- lightline --------

augroup reload_vimrc
    autocmd!
    autocmd bufwritepost ~/.config/nvim/init.vim nested source ~/.config/nvim/init.vim
augroup END

set t_Co=256

if !has('gui_running')
  set t_Co=256
endif

let g:lightline = {
      \ 'component': {
      \   'readonly': '%{&readonly?"":""}',
      \   'modified': '%{&filetype=="help"?"":&modified?"+":&modifiable?"":"-"}',
      \   'fugitive': '%{exists("*fugitive#head")?fugitive#head():""}'
      \ },
      \ 'component_visible_condition': {
      \   'readonly': '(&filetype!="help"&& &readonly)',
      \   'modified': '(&filetype!="help"&&(&modified||!&modifiable))',
      \   'fugitive': '(exists("*fugitive#head") && ""!=fugitive#head())'
      \ },
      \ 'separator': { 'left': '', 'right': '' },
      \ 'subseparator': { 'left': '|', 'right': '|' }
      \ }
"  bufferline ----
set showtabline=2   " always show tabline

" use lightline-buffer in lightline
" let g:lightline = {
"     \ 'tabline': {
"         \ 'left': [ [ 'bufferinfo' ], [ 'bufferbefore', 'buffercurrent', 'bufferafter' ], ],
"         \ 'right': [ [ 'close' ], ],
"         \ },
"     \ 'component_expand': {
"         \ 'buffercurrent': 'lightline#buffer#buffercurrent2',
"         \ },
"     \ 'component_type': {
"         \ 'buffercurrent': 'tabsel',
"         \ },
"     \ 'component_function': {
"         \ 'bufferbefore': 'lightline#buffer#bufferbefore',
"         \ 'bufferafter': 'lightline#buffer#bufferafter',
"         \ 'bufferinfo': 'lightline#buffer#bufferinfo',
"         \ },
"     \ }

" remap arrow keys
nnoremap <Left> :bprev<CR>
nnoremap <Right> :bnext<CR>

" lightline-buffer ui settings
" replace these symbols with ascii characters if your environment does not support unicode
" let g:lightline_buffer_readonly_icon = ''
" let g:lightline_buffer_modified_icon = '✭'
" let g:lightline_buffer_git_icon = ' '
" let g:lightline_buffer_ellipsis_icon = '..'
" let g:lightline_buffer_expand_left_icon = '◀ '
" let g:lightline_buffer_expand_right_icon = ' ▶'
" let g:lightline_buffer_active_buffer_left_icon = ''
" let g:lightline_buffer_active_buffer_right_icon = ''
" let g:lightline_buffer_separator_icon = ' '

" lightline-buffer function settings
" let g:lightline_buffer_show_bufnr = 1
" let g:lightline_buffer_rotate = 0
" let g:lightline_buffer_fname_mod = ':t'
" let g:lightline_buffer_excludes = ['vimfiler']

" let g:lightline_buffer_maxflen = 30
" let g:lightline_buffer_maxfextlen = 3
" let g:lightline_buffer_minflen = 16
" let g:lightline_buffer_minfextlen = 3
" let g:lightline_buffer_reservelen = 20


" ------ Misc ------
set number
" set relativenumber

"vi copy cut & paste
nmap <C-c> "+yaw
vmap <C-c> "+y
vmap <C-x> "+d
vmap <C-x> "+d

if has('autocmd')
  filetype plugin indent on
endif
if has('syntax') && !exists('g:syntax_on')
  syntax enable
endif

" Use :help 'option' to see the documentation for the given option.
" increment number in line with <C-a>a
set nrformats-=octal 

set ttimeout
set ttimeoutlen=10

set incsearch

" spaces vs tabs
set et sts=2 sw=2 ts=2
set noswapfile
set completeopt=longest,menuone
set ignorecase
set backspace=indent,eol,start

set hid
set laststatus=2
set ruler
set wildmenu

if !&scrolloff
  set scrolloff=1
endif
if !&sidescrolloff
  set sidescrolloff=5
endif
set display+=lastline

if &encoding ==# 'latin1' && has('gui_running')
  set encoding=utf-8
endif

if &listchars ==# 'eol:$'
  set listchars=tab:>\ ,trail:-,extends:>,precedes:<,nbsp:+
endif

if v:version > 703 || v:version == 703 && has("patch541")
  set formatoptions+=j " Delete comment character when joining commented lines
endif

if has('path_extra')
  setglobal tags-=./tags tags-=./tags; tags^=./tags;
endif

if &shell =~# 'fish$' && (v:version < 704 || v:version == 704 && !has('patch276'))
  set shell=/bin/bash
endif

set autoread

if &history < 1000
  set history=1000
endif
if &tabpagemax < 50
  set tabpagemax=50
endif
if !empty(&viminfo)
  set viminfo^=!
endif
set sessionoptions-=options

" Allow color schemes to do bright colors without forcing bold.
" if &t_Co == 8 && $TERM !~# '^linux\|^Eterm'
"   set t_Co=16
" endif

" Load matchit.vim, but only if the user hasn't installed a newer version.
if !exists('g:loaded_matchit') && findfile('plugin/matchit.vim', &rtp) ==# ''
  runtime! macros/matchit.vim
endif

inoremap <C-U> <C-G>u<C-U>

" Visual mode pressing * or # searches for the current selection
" Super useful! From an idea by Michael Naumann
vnoremap <silent> * :call VisualSelection('f')<CR>
vnoremap <silent> # :call VisualSelection('b')<CR>

" Treat long lines as break lines (useful when moving around in them)
map j gj
map k gk

" Map <Space> to / (search) and Ctrl-<Space> to ? (backwards search)
map <space> /
map <c-space> ?

" Disable highlight when <leader><cr> is pressed
map <silent> <leader><cr> :noh<cr>

" Return to last edit position when opening files (You want this!)
autocmd BufReadPost *
     \ if line("'\"") > 0 && line("'\"") <= line("$") |
     \   exe "normal! g`\"" |
     \ endif

" vim:set ft=vim et sw=2:
