" Encoding
set encoding=utf-8

" Don't try to be vi compatible
set nocompatible
set noswapfile

set mouse=a

" Helps force plugins to load correctly when it is turned back on below
filetype off

" - For Neovim: ~/.local/share/nvim/plugged
call plug#begin('~/.vim/plugged')

Plug 'Valloric/YouCompleteMe'
Plug 'w0rp/ale'
Plug 'tomtom/tcomment_vim'
Plug 'Quramy/tsuquyomi'
Plug 'SirVer/ultisnips'
" Plug 'Shougo/vimproc'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'nsf/gocode', { 'rtp': 'vim', 'do': '~/.vim/plugged/gocode/vim/symlink.sh' }
Plug 'mgee/lightline-bufferline'
Plug 'alvan/vim-closetag'
Plug 'hail2u/vim-css3-syntax'
Plug 'epilande/vim-es2015-snippets'
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'
Plug 'fatih/vim-go'
Plug 'jparise/vim-graphql'
" Plug 'jaspervdj/stylish-haskell'
Plug 'alx741/vim-hindent'
Plug 'pangloss/vim-javascript' 
Plug 'heavenshell/vim-jsdoc'
Plug 'MaxMEllon/vim-jsx-pretty'
Plug 'moll/vim-node'
Plug 'vim-scripts/auto-pairs-gentle'
Plug 'epilande/vim-react-snippets'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-sensible'
Plug 'honza/vim-snippets'
Plug 'ruanyl/vim-sort-imports'
Plug 'nbouscal/vim-stylish-haskell'
Plug 'tpope/vim-surround'
Plug 'cespare/vim-toml'
Plug 'tpope/vim-unimpaired'
Plug 'ElmCast/elm-vim'
Plug 'mattn/emmet-vim'
" Plug 'eagletmt/ghcmod-vim'
Plug 'neovimhaskell/haskell-vim'
Plug 'rizzatti/dash.vim'
Plug 'junegunn/fzf.vim'
Plug 'junegunn/goyo.vim'
Plug 'itchyny/lightline.vim'
Plug 'rust-lang/rust.vim'
Plug 'wellle/targets.vim'
Plug 'Shougo/unite.vim'
Plug 'Shougo/vimfiler.vim'
Plug 'HerringtonDarkholme/yats.vim'
Plug 'chriskempson/base16-vim'
" Initialize plugin system
call plug#end()


" Put stuff oni related here
if exists('g:gui_oni')
    " Statements here
    set shortmess=a
endif

set cmdheight=4

" For plugins to load correctly
filetype plugin indent on

let g:vim_jsx_pretty_colorful_config = 1 " default 0

" Trigger configuration. Do not use <tab> if you use https://github.com/Valloric/YouCompleteMe.
let g:UltiSnipsExpandTrigger="<C-l>"


let g:gitgutter_map_keys = 0

" set statusline+=%#warningmsg#y
" set statusline+=%{SyntasticStatuslineFlag()}
" set statusline+=%*
"
" let g:syntastic_always_populate_loc_list = 1
" let g:syntastic_auto_loc_list = 1
" let g:syntastic_check_on_open = 1
" let g:syntastic_check_on_wq = 1
" let g:syntastic_javascript_checkers = ['eslint']
" let g:syntastic_haskell_checkers = ['hlint']
" let g:elm_syntastic_show_warnings = 1
let g:elm_setup_keybindings = 0
let g:elm_format_autosave = 1

let g:user_emmet_leader_key='µ' " ALT-M

let g:user_emmet_settings = {
  \  'javascript.jsx' : {
    \      'extends' : 'jsx',
    \  },
		\  'typescript' : {
    \      'extends' : 'tsx',
    \  }
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
" let g:indentLine_char = '│'
" let g:indentLine_enabled = 0

" Add > at current position without closing the current tag, default is ''
"
let g:closetag_close_shortcut = '<leader>>'



set wildignore+=*/tmp/*,*/node_modules/*,*.so,*.swp,*.zip     " MacOSX/Linux


" Turn on syntax highlighting 
syntax on

let $PATH .= (":" . $HOME . "/.cabal/bin" . ":" . $HOME . "/.local/bin")

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

let g:ale_linters = { 
			\'javascript':['eslint'], 
			\'haskell': ['stack-ghc', 'ghc-mod', 'hlint', 'hdevtools', 'hfmt'],
			\}

let g:ale_fixers = {
			\'javascript':['prettier']
			\}

let g:jsdoc_enable_es6 = 1
let g:javascript_plugin_jsdoc = 1


" let g:ale_fix_on_save = 1
let g:ale_javascript_prettier_use_local_config = 1
highlight ALEError ctermbg=0 cterm=underline ctermfg=red
highlight ALEWarning ctermbg=0 cterm=underline ctermfg=red

function! s:base16_customize() abort
  call Base16hi("MatchParen", g:base16_gui05, g:base16_gui03, g:base16_cterm05, g:base16_cterm03, "bold,italic", "")
endfunction

augroup on_change_colorschema
  autocmd!
  autocmd ColorScheme * call s:base16_customize()
augroup END

" augroup FiletypeGroup
"     autocmd!
"     au BufNewFile,BufRead *.js set filetype=javascript.jsx
" 	augroup END


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
set shiftround
set smarttab
set noexpandtab

" Cursor motion
set scrolloff=20
set backspace=indent,eol,start
set matchpairs+=<:> " use % to jump between pairs runtime! macros/matchit.vim


" Allow hidden buffers
set hidden
"
" Rendering
set ttyfast

" Last line
" uncomment for native vim
set showcmd 
set showmode
" Status bar
set laststatus=2


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
" set t_Co=256
let &t_8f="\<Esc>[38;2;%lu;%lu;%lum"
let &t_8b="\<Esc>[48;2;%lu;%lu;%lum"
set termguicolors
colorscheme base16-material
if filereadable(expand("~/.vimrc_background"))
  let base16colorspace=256
  source ~/.vimrc_background
endif
" set cursorline 
hi clear Cursorline 
hi CursorlineNR cterm=bold 
set colorcolumn=120
set splitright
set splitbelow

" Triger `autoread` when files changes on disk
" https://unix.stackexchange.com/questions/149209/refresh-changed-content-of-file-opened-in-vim/383044#383044
" https://vi.stackexchange.com/questions/13692/prevent-focusgained-autocmd-running-in-command-line-editing-mode
autocmd FocusGained,BufEnter,CursorHold,CursorHoldI * if mode() != 'c' | checktime | endif
" Notification after file change
" https://vi.stackexchange.com/questions/13091/autocmd-event-for-autoread
autocmd FileChangedShellPost *
			\ echohl WarningMsg | echo "File changed on disk. Buffer reloaded." | echohl None

" if &term =~ 'screen-256color'
" 	" disable background color erase
" 	set t_ut=
" endif

" lightline buffeo 
set hidden  " allow buffer switching without saving
set showtabline=2  " always show tabline

" use lightline-buffer in lightline
let g:lightline = {
			\ 'tabline': { 'left': [[ 'buffers' ]], 'right': [[ 'close' ]] },
			\ 'component_expand': { 'buffers': 'lightline#bufferline#buffers' },
			\ 'component_type': {'buffers': 'tabsel' },
			\ 'component_function': {
			\		'filename': 'LightlineFilename',
			\ },
			\ 'component': {
			\   'separator': '',
			\ },
			\ 'active': {
			\   'left': [ [ 'mode', 'paste' ],
			\             ['readonly', 'filename', 'modified', '' ] ]
			\ },
			\ }

"'time': %{strftime('%R', getftime(expand('%')))}


let g:lightline#bufferline#show_number  = 1
let g:lightline#bufferline#shorten_path = 1
let g:lightline#bufferline#unnamed      = '[No Name]'

function! LightlineFilename()
	return &filetype ==# 'vimfiler' ? vimfiler#get_status_string() :
				\ &filetype ==# 'unite' ? unite#get_status_string() :
        \ &filetype ==# 'vimshell' ? vimshell#get_status_string() :
        \ expand('%:t') !=# '' ? expand('%:t') : '[No Name]'
endfunction
let g:unite_force_overwrite_statusline = 0
let g:vimfiler_force_overwrite_statusline = 0
let g:vimshell_force_overwrite_statusline = 0

" no concealing qotes in json
let g:ycm_always_populate_location_list = 1
let g:ycm_semantic_triggers = {
     \ 'elm' : ['.'],
		 \ 'haskell' : ['.'],
		 \ 'typescript,javascript' : ['.'],
		 \ 'rust' : [ '.', '::'],
     \}

let g:ycm_rust_src_path = '/Users/jake.munoz/rustc-1.31.1/src'

" Disable haskell-vim omnifunc
let g:haskellmode_completion_ghc = 1
let g:haskell_classic_highlighting = 0
let g:hindent_on_save = 1
let g:hindent_indent_size = 4

au BufRead,BufNewFile *.js set filetype=javascript.jsx
" au BufRead,BufNewFile *.tsx set filetype=typescript.tsx
au BufRead,BufNewFile *.md setlocal spell nolist

" autocmd FileType haskell setlocal omnifunc=necoghc#omnifunc expandtab
autocmd FileType elm,haskell setlocal sw=4 ts=4 nolist expandtab
autocmd FileType md setlocal spell nolist

autocmd FileType rust setlocal sw=4 ts=4 expandtab


let g:haskell_enable_quantification = 1   " to enable highlighting of `forall`
let g:haskell_enable_recursivedo = 1      " to enable highlighting of `mdo` and `rec`
let g:haskell_enable_arrowsyntax = 1      " to enable highlighting of `proc`
let g:haskell_enable_pattern_synonyms = 1 " to enable highlighting of `pattern`
let g:haskell_enable_typeroles = 1        " to enable highlighting of type roles
let g:haskell_enable_static_pointers = 1  " to enable highlighting of `static`
let g:haskell_backpack = 1                " to enable highlighting of backpack keywords

" ----- hindent & stylish-haskell -----

" Indenting on save is too aggressive for me
" let g:hindent_on_save = 0

" Helper function, called below with mappings
function! HaskellFormat(which) abort
  if a:which ==# 'hindent' || a:which ==# 'both'
    :Hindent
  endif
  if a:which ==# 'stylish' || a:which ==# 'both'
    silent! exe 'undojoin'
    silent! exe 'keepjumps %!stylish-haskell'
  endif
endfunction

augroup VimCSS3Syntax
  autocmd!

  autocmd FileType css,js,javascript.jsx setlocal iskeyword+=-
augroup END


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
let g:lightline_buffer_excludes = ['vimfiler', 'terminal']

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

let g:vimfiler_as_default_explorer = 1
function! s:vimfiler_settings()
  nnoremap <buffer>s :<C-u>call vimfiler#mappings#do_switch_action('split')<CR>
  nnoremap <buffer>v :<C-u>call vimfiler#mappings#do_switch_action('vsplit')<CR>
endfunction

highlight Comment cterm=italic

" nnoremap <Leader>ht :GhcModType<cr>
" nnoremap <Leader>htc :GhcModTypeClear<cr>

nnoremap <Leader>bq :lclose<CR>:bdelete<CR>
nnoremap <leader>g :GFiles<cr>
nnoremap <Space>t :GFiles?<cr>
nnoremap <leader>b :Buffers<cr>
nnoremap <leader>f :Files<cr>
nnoremap <leader>ag :Rg<cr>
nnoremap <leader>r :e!<cr>
nnoremap <leader>c :Commits<cr>
nnoremap - :VimFilerExplorer <CR>
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

" JsDoc
nnoremap <C-l> :JsDoc<CR>

" Ctrl-s to save
noremap <silent> <F6>          :update<CR>
vnoremap <silent> <F6>         <C-C>:update<CR>
noremap <silent> <Leader>s :update<CR>:e!<CR>
vnoremap <silent> <Leader>s :update<CR>:e!<CR>

" mapping ctrl-backspace doesn't work in terminal vim this is a workaround
inoremap ˙ <C-w>

inoremap <C-Space> <C-x><C-o>

nnoremap <silent> <Leader>= :exe "vertical resize +10"<CR>
nnoremap <silent> <Leader>- :exe "vertical resize -10"<CR>
nnoremap <silent> <Leader>0 <C-w>=

" fix indentation
nnoremap <silent> == =apg;

nnoremap p p==g;

"Close every window in the current tabview but the current one
nnoremap <Leader>o <C-w>o
nnoremap <Leader>h :bprev<CR>
nnoremap <Leader>l :bnext<CR>
nnoremap <Leader>bq :bp\|bd #<CR>

nnoremap <silent> <C-h> :TmuxNavigateLeft<cr>
nnoremap <silent> <C-j> :TmuxNavigateDown<cr>
nnoremap <silent> <C-k> :TmuxNavigateUp<cr>
nnoremap <silent> <C-l> :TmuxNavigateRight<cr>

nnoremap <silent> <C-\> :ter<cr>

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

map <leader><space> :let @/=''<cr> " clear search

" Formatting
map <leader>q gqip
nnoremap gd :YcmCompleter GoTo<CR>
nnoremap <leader>d :YcmCompleter GetDoc<CR>

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
let g:AutoPairsShortcutFastWrap = '<C-e>'
let g:AutoPairs = {'|':'|','(':')', '[':']', '{':'}',"'":"'",'"':'"', '`':'`'}
