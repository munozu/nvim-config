" Encoding
set encoding=utf-8

" Don't try to be vi compatible
set nocompatible
set noswapfile

" Helps force plugins to load correctly when it is turned back on below
filetype off

" TODO: Load plugins here (pathogen or vundle)
" Specify a directory for plugins
" - For Neovim: ~/.local/share/nvim/plugged
" - Avoid using standard Vim directory names like 'plugin'
call plug#begin('~/.vim/plugged')

Plug 'junegunn/goyo.vim'
Plug 'chriskempson/base16-vim'
Plug 'tpope/vim-sensible'
" Plug 'tpope/vim-commentary'
Plug 'tomtom/tcomment_vim'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-fugitive'
Plug 'pangloss/vim-javascript'
Plug 'MaxMEllon/vim-jsx-pretty'
Plug 'Valloric/YouCompleteMe'
Plug 'SirVer/ultisnips'
Plug 'epilande/vim-es2015-snippets'
Plug 'epilande/vim-react-snippets'
Plug 'honza/vim-snippets'
Plug 'itchyny/lightline.vim'
Plug 'taohex/lightline-buffer'
Plug 'christoomey/vim-tmux-navigator'
Plug 'vim-scripts/auto-pairs-gentle'
Plug 'alvan/vim-closetag'
Plug 'airblade/vim-gitgutter'
Plug 'moll/vim-node'
Plug 'jparise/vim-graphql'
" Plug 'Yggdroot/indentLine'
Plug 'nathanaelkane/vim-indent-guides'
Plug 'ternjs/tern_for_vim'
Plug 'mattn/emmet-vim'
Plug 'vim-syntastic/syntastic'
Plug 'rizzatti/dash.vim'
Plug 'Shougo/unite.vim'
Plug 'Shougo/vimfiler.vim'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'tpope/vim-unimpaired'
Plug 'fatih/vim-go'
Plug 'nsf/gocode', { 'rtp': 'vim', 'do': '~/.vim/plugged/gocode/vim/symlink.sh' }
Plug 'ruanyl/vim-sort-imports'

" Initialize plugin system
call plug#end()

" For plugins to load correctly
filetype plugin indent on

let g:vim_jsx_pretty_colorful_config = 1 " default 0

" Trigger configuration. Do not use <tab> if you use https://github.com/Valloric/YouCompleteMe.
let g:UltiSnipsExpandTrigger="<C-l>"


let g:gitgutter_map_keys = 0

set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 1
let g:syntastic_javascript_checkers = ['eslint']

let g:user_emmet_leader_key='<C-m>' " <tab><leader> 
let g:user_emmet_settings = {
  \  'javascript.jsx' : {
    \      'extends' : 'jsx',
    \  },
  \}

" filenames like *.xml, *.html, *.xhtml, ...
" These are the file extensions where this plugin is enabled.
"
let g:closetag_filenames = '*.html,*.xhtml,*.phtml'

" filenames like *.xml, *.xhtml, ...
" This will make the list of non-closing tags self-closing in the specified files.
"
let g:closetag_xhtml_filenames = '*.xhtml,*.js,*.jsx'

" integer value [0|1]
" This will make the list of non-closing tags case-sensitive (e.g. `<Link>` will be closed while `<link>` won't.)
"
let g:closetag_emptyTags_caseSensitive = 1

" Shortcut for closing tags, default is '>'
"
let g:closetag_shortcut = '>'



" Add > at current position without closing the current tag, default is ''
"
let g:closetag_close_shortcut = '<leader>>'

au BufRead,BufNewFile *.js set filetype=javascript.jsx


set wildignore+=*/tmp/*,*/node_modules/*,*.so,*.swp,*.zip     " MacOSX/Linux


" Turn on syntax highlighting 
syntax on

let g:go_fmt_command = "goimports"
let g:go_highlight_functions = 1
let g:go_highlight_function_arguments = 1
let g:go_highlight_function_calls = 1
let g:go_highlight_types = 1
let g:go_highlight_extra_types = 1
let g:go_highlight_fields = 1
let g:go_highlight_variable_declarations = 1
let g:go_highlight_variable_assignments = 1
let g:go_highlight_operators = 1
let g:go_metalinter_enabled = ['vet', 'golint', 'errcheck']
let g:go_metalinter_autosave = 1
let g:go_metalinter_autosave_enabled = ['vet', 'golint']
let g:go_metalinter_deadline = "5s"

" <leader>t runs go test
autocmd FileType go nmap <leader>t  <Plug>(go-test)

set synmaxcol=120
set wrap
set wrapmargin=0

if has("autocmd") && exists("+omnifunc")
  autocmd Filetype *
        \ if &omnifunc == "" |
        \   setlocal omnifunc=syntaxcomplete#Complete |
        \ endif
endif

" backup to ~/.tmp
set backup
set backupdir=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp
set backupskip=/tmp/*,/private/tmp/*
set directory=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp
set writebackup

highlight ALEWarning ctermbg=DarkMagenta

let g:lightline = {
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ],
      \             [ 'gitbranch', 'readonly', 'filename', 'modified' ] ]
      \ },
      \ 'component_function': {
      \   'gitbranch': 'fugitive#head'
      \ },
      \ }

" TODO: Pick a leader key
let mapleader = ","

" Security
set modelines=0
set directory^=$HOME/.vim/tmp//

" Show line numbers
set number
" set relativenumber

" Show file stats
set ruler

" no visualbell
set t_vb=


" Whitespace
set textwidth=99
set formatoptions=tcqrn1
set tabstop=2
set shiftwidth=2
set softtabstop=2
set noexpandtab
set shiftround
set smarttab

" Cursor motion
set scrolloff=20
set backspace=indent,eol,start
set matchpairs+=<:> " use % to jump between pairs runtime! macros/matchit.vim
set mouse=a


" Allow hidden buffers
set hidden
"
" Rendering
set ttyfast

" Status bar
set laststatus=2

" Last line
set showmode
set showcmd

set hlsearch
set incsearch

set ignorecase
set smartcase
set showmatch

" let g:indent_guides_enable_on_vim_startup = 1
" let g:indent_guides_start_level=2
" " let g:indent_guides_guide_size=2
" hi IndentGuidesEven ctermbg=236
" hi IndentGuidesOdd ctermbg=232


" Visualize tabs and newlines
set listchars=tab:\·\ ,trail:~,precedes:←,extends:→,eol:¬,nbsp:·
if has('patch-7.4.710')
	set listchars+=space:·
endif
set list

" Color scheme (terminal)
set background=dark
set t_Co=256
set term=xterm-256color
colorscheme base16-monokai
if filereadable(expand("~/.vimrc_background"))
  let base16colorspace=256
  source ~/.vimrc_background
endif
set termguicolors
set cursorline
set colorcolumn=120
set splitright
set splitbelow

if &term =~ 'screen-256color'
    " disable background color erase
    set t_ut=
endif

" lightline buffeo 
set hidden  " allow buffer switching without saving
set showtabline=2  " always show tabline

" use lightline-buffer in lightline
let g:lightline = {
    \ 'tabline': {
    \   'left': [ [ 'bufferinfo' ],
    \             [ 'separator' ],
    \             [ 'bufferbefore', 'buffercurrent', 'bufferafter' ], ],
    \   'right': [ [ 'close' ], ],
    \ },
    \ 'component_expand': {
    \   'buffercurrent': 'lightline#buffer#buffercurrent',
    \   'bufferbefore': 'lightline#buffer#bufferbefore',
    \   'bufferafter': 'lightline#buffer#bufferafter',
    \ },
    \ 'component_type': {
    \   'buffercurrent': 'tabsel',
    \   'bufferbefore': 'raw',
    \   'bufferafter': 'raw',
    \ },
    \ 'component_function': {
    \   'bufferinfo': 'lightline#buffer#bufferinfo',
    \ },
    \ 'component': {
    \   'separator': '',
    \ },
    \ }

" no concealing qotes in json

" lightline-buffer ui settings
" replace these symbols with ascii characters if your environment does not support unicode
let g:lightline_buffer_logo = ' '
let g:lightline_buffer_readonly_icon = ''
let g:lightline_buffer_modified_icon = '✭'
let g:lightline_buffer_git_icon = ' '
let g:lightline_buffer_ellipsis_icon = '..'
let g:lightline_buffer_expand_left_icon = '◀ '
let g:lightline_buffer_expand_right_icon = ' ▶'
let g:lightline_buffer_active_buffer_left_icon = ''
let g:lightline_buffer_active_buffer_right_icon = ''
let g:lightline_buffer_separator_icon = '  '

" enable devicons, only support utf-8
" require <https://github.com/ryanoasis/vim-devicons>
let g:lightline_buffer_enable_devicons = 1

" lightline-buffer function settings
let g:lightline_buffer_show_bufnr = 1

" :help filename-modifiers
let g:lightline_buffer_fname_mod = ':t'

" hide buffer list
let g:lightline_buffer_excludes = ['vimfiler']

" max file name length
let g:lightline_buffer_maxflen = 30

" max file extension length
let g:lightline_buffer_maxfextlen = 3

" min file name length
let g:lightline_buffer_minflen = 16

" min file extension length
let g:lightline_buffer_minfextlen = 3

" reserve length for other component (e.g. info, close)
let g:lightline_buffer_reservelen = 20


" GO STUFF 
let g:go_highlight_types = 1
let g:go_highlight_extra_types = 1
let g:go_highlight_fields = 1
let g:go_highlight_functions = 1
let g:go_highlight_function_calls = 1
let g:go_highlight_operators = 1
let g:go_fmt_command = "goimports"

function! s:vimfiler_settings()
  nnoremap <buffer>s :<C-u>call vimfiler#mappings#do_switch_action('split')<CR>
  nnoremap <buffer>v :<C-u>call vimfiler#mappings#do_switch_action('vsplit')<CR>
endfunction

nnoremap <Leader>bq :lclose<CR>:bdelete<CR>
nnoremap <leader>g :GFiles<cr>
nnoremap <leader>b :Buffers<cr>
nnoremap <leader>f :Files<cr>
nnoremap <leader>ag :Ag<cr>
nnoremap <leader>r :e!<cr>
nnoremap <leader>c :Commits<cr>
nnoremap - :VimFiler <CR>
nnoremap ; :
nnoremap <leader>, ;

nnoremap ]] ]}
nnoremap [[ [{

" remap arrow keys
nnoremap <Left> :bprev<CR>
nnoremap <Right> :bnext<CR>
nnoremap <Up> <C-U>
nnoremap <Down> <C-D>

"vi copy cut & paste
nmap <C-c> "+yaw
vmap <C-c> "+y
vmap <C-x> "+d
vmap <C-x> "+d


" Ctrl-s to save
noremap <silent> <F6>          :update<CR>
vnoremap <silent> <F6>         <C-C>:update<CR>
inoremap <silent> <F6>         <C-O>:update<CR>
noremap <silent> <Leader>s         :update<CR>
vnoremap <silent> <Leader>s        :update<CR>
inoremap <silent> <Leader>s        :update<CR>

inoremap <Leader>w <C-W>
inoremap <Space><Tab> <C-x><C-o>

nnoremap <silent> <Leader>= :exe "vertical resize +10"<CR>
nnoremap <silent> <Leader>- :exe "vertical resize -10"<CR>
nnoremap <silent> <Leader>0 <C-w>=

" fix indentation
nnoremap <silent> == =ap


"Close every window in the current tabview but the current one
nnoremap <Leader>o <C-w>o
nnoremap <Leader>h :bprev<CR>
nnoremap <Leader>l :bnext<CR>
nnoremap <Leader>bq :bp\|bd #<CR>

nnoremap <silent> <C-h> :TmuxNavigateLeft<cr>
nnoremap <silent> <C-j> :TmuxNavigateDown<cr>
nnoremap <silent> <C-k> :TmuxNavigateUp<cr>
nnoremap <silent> <C-l> :TmuxNavigateRight<cr>
nnoremap <silent> <C-\> :TmuxNavigatePrevious<cr>

nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>
" Move up/down editor lines
nnoremap j gj
nnoremap k gk

" Searching
nnoremap / /\v
vnoremap / /\v

tnoremap <C-N>N <C-\><C-N>

map <leader><space> :let @/=''<cr> " clear search

" Formatting
map <leader>q gqip
nnoremap gd :YcmCompleter GoTo<CR>

" LINUX/WIN
" nnoremap <A-j> :m .+1<CR>==
" nnoremap <A-k> :m .-2<CR>==
" inoremap <A-j> <Esc>:m .+1<CR>==gi
" inoremap <A-k> <Esc>:m .-2<CR>==gi
" vnoremap <A-j> :m '>+1<CR>gv=gv
" vnoremap <A-k> :m '<-2<CR>gv=gv

" MACOS 
" ∆ === Alt + J
" ˚ === Alt + K
nnoremap ∆ :m .+1<CR>==
nnoremap ˚ :m .-2<CR>==
inoremap ∆ <Esc>:m .+1<CR>==gi
inoremap ˚ <Esc>:m .-2<CR>==gi
vnoremap ∆ :m '>+1<CR>gv=gv
vnoremap ˚ :m '<-2<CR>gv=gv
