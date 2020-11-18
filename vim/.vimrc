" vim: set foldmethod=marker foldlevel=0 nomodeline:
"*****************************************************************************
"" Vim-PLug {{{
"*****************************************************************************

let vimplug_exists=expand('~/.vim/autoload/plug.vim')

if !filereadable(vimplug_exists)
  if !executable("curl")
    echoerr "You have to install curl or first install vim-plug yourself!"
    execute "q!"
  endif
  echo "Installing Vim-Plug..."
  echo ""
  silent exec "!\curl -fLo " . vimplug_exists . " --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim"
  let g:not_finish_vimplug = "yes"

  autocmd VimEnter * PlugInstall
endif

" Required:
call plug#begin(expand('~/.vim/plugged'))

"*****************************************************************************
"" Plug install packages
"*****************************************************************************

" Project/Filetree Browsing
Plug 'scrooloose/nerdtree'
Plug 'jistr/vim-nerdtree-tabs'

" Buffer/File Browsing
Plug 'vim-scripts/grep.vim', { 'on': 'Rgrep' }
if isdirectory('/usr/local/opt/fzf')
  Plug '/usr/local/opt/fzf' | Plug 'junegunn/fzf.vim'
else
  Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --bin' }
  Plug 'junegunn/fzf.vim'
endif

" Code Browsing
Plug 'ludovicchabant/vim-gutentags'
Plug 'zedtang/cscope_maps'
Plug 'majutsushi/tagbar', { 'on': 'TagbarToggle' }

" Writing Code
Plug 'ycm-core/YouCompleteMe'
Plug 'w0rp/ale'
Plug 'puremourning/vimspector'
Plug 'sheerun/vim-polyglot'
Plug 'jiangmiao/auto-pairs'
Plug 'Yggdroot/indentLine'
Plug 'kana/vim-textobj-user'
Plug 'kana/vim-textobj-indent'
Plug 'kana/vim-textobj-syntax'
Plug 'kana/vim-textobj-function', { 'for':['c', 'cpp', 'vim', 'java'] }
Plug 'sgur/vim-textobj-parameter'
Plug 'Shougo/echodoc.vim'
Plug 'ntpeters/vim-better-whitespace'
Plug 'thirtythreeforty/lessspace.vim'

" Vim Functionality
Plug 'henrik/vim-indexed-search'
Plug 'tpope/vim-unimpaired'
Plug 'tpope/vim-surround'
Plug 'easymotion/vim-easymotion'
Plug 'mg979/vim-visual-multi', {'branch': 'master'}
Plug 'junegunn/vim-easy-align'
Plug 'wellle/targets.vim'
Plug 'tpope/vim-repeat'
Plug 'mhinz/vim-sayonara', {'on': 'Sayonara'}
Plug 'arthurxavierx/vim-caser'
Plug 'pbrisbin/vim-mkdir'
Plug 'skywind3000/asynctasks.vim'
Plug 'skywind3000/asyncrun.vim'
Plug 'mbbill/undotree', { 'on': 'UndotreeToggle' }
Plug 'myusuf3/numbers.vim'
Plug 'szw/vim-maximizer'

" Source Control Integration
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'
Plug 'tpope/vim-rhubarb' " required by fugitive to :Gbrowse
Plug 'junegunn/gv.vim'

" Comments
Plug 'tpope/vim-commentary'

" Misc
Plug 'mhinz/vim-startify'
Plug 'ianding1/leetcode.vim'
Plug 'xolox/vim-notes', { 'on': ['Note', 'SearchNotes', 'DeleteNotes', 'RecentNotes'] }

let g:make = 'gmake'
if exists('make')
  let g:make = 'make'
endif
Plug 'Shougo/vimproc.vim', {'do': g:make}

" Snippets
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'

" Color
Plug 'NLKNguyen/papercolor-theme'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'vim-scripts/CSApprox'
Plug 'ryanoasis/vim-devicons'

"*****************************************************************************
"" Lang bundles
"*****************************************************************************

" C/C++
Plug 'vim-scripts/c.vim', {'for': ['c', 'cpp', 'make']}
Plug 'ludwig/split-manpage.vim'
Plug 'zedtang/a.vim', {'for': ['c', 'cpp']}
Plug 'justinmk/vim-syntax-extra'
Plug 'octol/vim-cpp-enhanced-highlight', {'for': 'cpp'}

" Go
Plug 'fatih/vim-go', {'for': 'go', 'do': ':GoInstallBinaries'}

" Python
Plug 'hdima/python-syntax', {'for': 'python'}
Plug 'raimon49/requirements.txt.vim', {'for': 'requirements'}

" LaTex
Plug 'lervag/vimtex', {'for': 'tex'}

" Markdown
Plug 'godlygeek/tabular'
Plug 'plasticboy/vim-markdown', { 'for': 'markdown' }
Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install() }, 'for': 'markdown', 'on': 'MarkdownPreview' }
Plug 'dhruvasagar/vim-table-mode', { 'for': 'markdown' }
Plug 'vim-pandoc/vim-pandoc'
Plug 'vim-pandoc/vim-pandoc-syntax'
Plug 'vim-pandoc/vim-pandoc-after'

"*****************************************************************************
"*****************************************************************************

" Include user's extra bundle
if filereadable(expand("~/.vimrc.local.bundles"))
  source ~/.vimrc.local.bundles
endif

call plug#end()

" Required:
filetype plugin indent on

" }}}
"*****************************************************************************
"" Basic Setup {{{
"*****************************************************************************"

" Map leader to space
let mapleader=' '

set encoding=utf-8
set fileencoding=utf-8
set fileencodings=utf-8
set lazyredraw
set backspace=indent,eol,start
set updatetime=100
set timeout timeoutlen=500 ttimeoutlen=100
set autoindent
set smartindent
set tabstop=4
set shiftwidth=4
set expandtab
set smarttab
set hidden
set hlsearch
set incsearch
set ignorecase
set smartcase
set autoread
set foldlevelstart=99
set grepformat=%f:%l:%c:%m,%f:%l:%m
set nobackup
set noswapfile
set virtualedit=block
set nojoinspaces
set mouse=a
set nostartofline
set nrformats=hex
set fileformats=unix,dos,mac
set shortmess+=c
set complete-=i
set tags=./tags;,tags
set cscopeprg=gtags-cscope
set cscopequickfix=s-,c-,d-,i-,t-,e-,g-,a-
set cscopetagorder=1
set cscopeverbose

" diff mode
if &diff
  set noreadonly
  set diffopt=filler,vertical
endif

" Save edit history for undo
if !isdirectory($HOME."/.vim/undodir")
  call mkdir($HOME."/.vim/undodir", "", 0700)
endif
set undodir=~/.vim/undodir
set undofile

if exists('$SHELL')
  set shell=$SHELL
else
  set shell=/bin/sh
endif

" Completion options
set completeopt=menu,menuone
if has('patch-8.0.1000')
  set completeopt=menu,menuone,noselect
endif

" Disable visualbell
set noerrorbells visualbell t_vb=
if has('autocmd')
  autocmd GUIEnter * set visualbell t_vb=
endif

" }}}
"*****************************************************************************
"" Visual Settings {{{
"*****************************************************************************

" Use block cursor in normal mode, vertical bar in insert mode
if exists('$TMUX')
  let &t_SI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=1\x7\<Esc>\\"
  let &t_EI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=0\x7\<Esc>\\"
else
  let &t_SI = "\<Esc>]50;CursorShape=1\x7"
  let &t_EI = "\<Esc>]50;CursorShape=0\x7"
endif

" Use 24-bit (true-color) mode in Vim/Neovim
if (has("nvim"))
  let $NVIM_TUI_ENABLE_TRUE_COLOR=1
endif
if (has("termguicolors"))
  let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
  let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
  set termguicolors
endif

set mousemodel=popup
set t_Co=256
set guioptions=egmrti
set guifont=JetBrainsMonoNerdFontComplete-Regular:h14

let g:PaperColor_Theme_Options = {
      \   'language': {
      \     'python': {
      \       'highlight_builtins' : 1
      \     },
      \     'cpp': {
      \       'highlight_standard_library': 1
      \     },
      \     'c': {
      \       'highlight_builtins' : 1
      \     }
      \   }
      \ }

if has("gui_running")
  if has("gui_mac") || has("gui_macvim")
    set guifont=JetBrainsMonoNerdFontComplete-Regular:h14
    set antialias
    set transparency=7
  endif
else
  let g:CSApprox_loaded = 1
  if $COLORTERM == 'gnome-terminal'
    set term=gnome-256color
  else
    if $TERM == 'xterm'
      set term=xterm-256color
    endif
  endif
endif

if &term =~ '256color'
  set t_ut=
endif

let no_buffers_menu=1

syntax enable
syntax on
set ruler
set number
set relativenumber
set nocursorline
set noshowmode

set background=light
silent! colorscheme PaperColor

" Disable the blinking cursor.
set guicursor=a:blinkon0
set scrolloff=5

" Status bar
set laststatus=2

" Use modeline overrides
set modeline
set modelines=10

set title
set titleold="Terminal"
set titlestring=%F

set statusline=%F%m%r%h%w%=(%{&ff}/%Y)\ (line\ %l\/%L,\ col\ %c)\

if exists("*fugitive#statusline")
  set statusline+=%{fugitive#statusline()}
endif

" vim-airline
let g:airline_theme = 'papercolor'
let g:airline_powerline_fonts = 1
let g:airline#extensions#branch#enabled = 1
let g:airline#extensions#ale#enabled = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tagbar#enabled = 1
let g:airline#extensions#gutentags#enabled = 1
let g:airline#extensions#virtualenv#enabled = 1
let g:airline_skip_empty_sections = 1
if !exists('g:airline_symbols')
  let g:airline_symbols = {}
endif
if !exists('g:airline_powerline_fonts')
  let g:airline#extensions#tabline#left_sep = ' '
  let g:airline#extensions#tabline#left_alt_sep = '|'
  let g:airline_left_sep          = '▶'
  let g:airline_left_alt_sep      = '»'
  let g:airline_right_sep         = '◀'
  let g:airline_right_alt_sep     = '«'
  let g:airline#extensions#branch#prefix     = '⤴' "➔, ➥, ⎇
  let g:airline#extensions#readonly#symbol   = '⊘'
  let g:airline#extensions#linecolumn#prefix = '¶'
  let g:airline#extensions#paste#symbol      = 'ρ'
  let g:airline_symbols.linenr    = '␊'
  let g:airline_symbols.branch    = '⎇'
  let g:airline_symbols.paste     = 'ρ'
  let g:airline_symbols.paste     = 'Þ'
  let g:airline_symbols.paste     = '∥'
  let g:airline_symbols.whitespace = 'Ξ'
else
  let g:airline#extensions#tabline#left_sep = ''
  let g:airline#extensions#tabline#left_alt_sep = ''
  " powerline symbols
  let g:airline_left_sep = ''
  let g:airline_left_alt_sep = ''
  let g:airline_right_sep = ''
  let g:airline_right_alt_sep = ''
  let g:airline_symbols.branch = ''
  let g:airline_symbols.readonly = ''
  let g:airline_symbols.linenr = ''
endif

" IndentLine
let g:indentLine_enabled = 1
let g:indentLine_concealcursor = 0
let g:indentLine_faster = 1
let g:indentLine_char_list = ['|', '¦', '┆', '┊']
let g:indent_guides_auto_colors = 1
let g:indentLine_fileTypeExclude = [
      \'markdown',
      \'startify',
      \'tagbar'
      \ ]

" fzf.vim
let g:fzf_colors = {
      \ 'fg':      ['fg', 'Normal'],
      \ 'bg':      ['bg', 'Normal'],
      \ 'hl':      ['fg', 'Comment'],
      \ 'fg+':     ['fg', 'CursorLine', 'CursorColumn', 'Normal'],
      \ 'bg+':     ['bg', 'CursorLine', 'CursorColumn'],
      \ 'hl+':     ['fg', 'Statement'],
      \ 'info':    ['fg', 'PreProc'],
      \ 'border':  ['fg', 'Ignore'],
      \ 'prompt':  ['fg', 'Conditional'],
      \ 'pointer': ['fg', 'Exception'],
      \ 'marker':  ['fg', 'Keyword'],
      \ 'spinner': ['fg', 'Label'],
      \ 'header':  ['fg', 'Comment']
      \ }

" }}}
"*****************************************************************************
"" Functions & Commands {{{
"*****************************************************************************

if !exists('*s:setupWrapping')
  function s:setupWrapping()
    set wrap
    set wrapmargin=2
    set textwidth=79
  endfunction
endif

function! FixMeTag()
  return "FIXME: [tjiaheng ".strftime("%Y-%m-%d")."]"
endfunction

" Define new accents
function! AirlineThemePatch(palette)
  " [ guifg, guibg, ctermfg, ctermbg, opts ].
  " See "help attr-list" for valid values for the "opt" value.
  " http://vim.wikia.com/wiki/Xterm256_color_names_for_console_Vim
  let a:palette.accents.running = [ '', '', '', '', '' ]
  let a:palette.accents.success = [ '#00ff00', '' , 'green', '', '' ]
  let a:palette.accents.failure = [ '#ff0000', '' , 'red', '', '' ]
endfunction

" Change color of the relevant section according to g:asyncrun_status, a global variable exposed by AsyncRun
" 'running': default, 'success': green, 'failure': red
function! Get_asyncrun_running()
  let async_status = g:asyncrun_status
  if async_status != g:async_status_old
    if async_status == 'running'
      call airline#parts#define_accent('asyncrun_status', 'running')
    elseif async_status == 'success'
      call airline#parts#define_accent('asyncrun_status', 'success')
    elseif async_status == 'failure'
      call airline#parts#define_accent('asyncrun_status', 'failure')
    endif
    let g:airline_section_x = airline#section#create(['asyncrun_status'])
    AirlineRefresh
    let g:async_status_old = async_status
  endif
  return async_status
endfunction

function! GotoWindow(id)
  call win_gotoid(a:id)
  MaximizerToggle
endfunction

" }}}
"*****************************************************************************
"" Mappings {{{
"*****************************************************************************

" terminal emulation
nnoremap <silent><leader>sh :terminal<CR>

" Split
set splitbelow
set splitright
noremap <Leader>h :<C-u>split<CR>
noremap <Leader>v :<C-u>vsplit<CR>

" Set working directory
nnoremap <leader>. :lcd %:p:h<CR>

" Opens an edit command with the path of the currently edited file filled in
noremap <Leader>e :e <C-R>=expand("%:p:h") . "/" <CR>

" Opens a tab edit command with the path of the currently edited file filled
noremap <Leader>te :tabe <C-R>=expand("%:p:h") . "/" <CR>

" Copy/Paste/Cut
if has('unnamedplus')
  set clipboard=unnamed,unnamedplus
endif

noremap YY "+y<CR>
noremap <leader>p "+gP<CR>
noremap XX "+x<CR>
" paste word multiple times
xnoremap p pgvy

if has('macunix')
  " pbcopy for OSX copy/paste
  vmap <C-x> :!pbcopy<CR>
  vmap <C-c> :w !pbcopy<CR><CR>
endif

" Search mappings
nnoremap n nzzzv
nnoremap N Nzzzv

" Clean search (highlight)
nnoremap <silent><leader>c :noh<CR>

" Switching windows
noremap <C-j> <C-w>j
noremap <C-k> <C-w>k
noremap <C-l> <C-w>l
noremap <C-h> <C-w>h

" Vmap for maintain Visual Mode after shifting > and <
vmap < <gv
vmap > >gv

" 'Q' in normal mode enters Ex mode. You almost never want this.
nmap Q <Nop>

" Unbind for tmux
map <C-a> <Nop>
map <C-x> <Nop>

" Move visual block
vnoremap J :m '>+1<CR>gv=gv
vnoremap K :m '<-2<CR>gv=gv

" Toggle quickfix window
noremap <silent><leader>q :call asyncrun#quickfix_toggle(10)<CR>

" }}}
"*****************************************************************************
"" Plugin Configs {{{
"*****************************************************************************

" nerdtree
set wildignore+=*/tmp/*,*.so,*.swp,*.zip,*.pyc,*.db,*.sqlite
let g:NERDTreeChDirMode=2
let g:NERDTreeIgnore=['\.rbc$', '\~$', '\.pyc$', '\.db$', '\.sqlite$', '__pycache__']
let g:NERDTreeSortOrder=['^__\.py$', '\/$', '*', '\.swp$', '\.bak$', '\~$']
let g:NERDTreeShowBookmarks=1
let g:NERDTreeShowHidden=1
let g:NERDTreeMapOpenInTabSilent = '<RightMouse>'
let g:NERDTreeWinSize=50
let g:NERDTreeQuitOnOpen=1
let g:NERDTreeMinimalUI=1
let g:NERDTreeDirArrows=1
let g:NERDTreeAutoDeleteBuffer=1

" vim-nerdtree-tabs
let g:nerdtree_tabs_open_on_console_startup=2
let g:nerdtree_tabs_focus_on_files=1
let g:nerdtree_tabs_autofind=1
nnoremap <silent><leader>n :NERDTreeTabsToggle<CR>

" grep.vim
let Grep_Default_Options = '-IR'
let Grep_Skip_Files = '*.log *.db'
let Grep_Skip_Dirs = '.git node_modules'
let Grep_OpenQuickfixWindow = 0
nnoremap <silent><leader>r :Rgrep<CR>

" vim-fugitive
noremap <Leader>ga :Gwrite<CR>
noremap <Leader>gc :Gcommit<CR>
noremap <Leader>gp :Gpush<CR>
noremap <Leader>gl :Gpull<CR>
noremap <Leader>gst :Gstatus<CR>
noremap <Leader>gb :Gblame<CR>
noremap <Leader>gd :Gvdiff<CR>
noremap <Leader>grm :Gremove<CR>
" Open current line on GitHub
nnoremap <Leader>o :.Gbrowse<CR>

" gv.vim
noremap <Leader>gv :GV!<CR>

" fzf.vim
let g:fzf_layout={'window': {'width':0.9, 'height':0.6}}
set wildmenu
set wildmode=list:longest,list:full
set wildignore+=*.o,*.obj,.git,*.rbc,*.pyc,__pycache__
let $FZF_DEFAULT_COMMAND =  "find * -path '*/\.*' -prune -o -path 'node_modules/**' -prune -o -path 'target/**' -prune -o -path 'dist/**' -prune -o  -type f -print -o -type l -print 2> /dev/null"

" The Silver Searcher
if executable('ag')
  let $FZF_DEFAULT_COMMAND = 'ag --hidden --ignore .git -g ""'
  set grepprg=ag\ --nogroup\ --nocolor
endif

" ripgrep
if executable('rg')
  let $FZF_DEFAULT_COMMAND = 'rg --files --hidden --follow --glob "!.git/*"'
  set grepprg=rg\ --vimgrep
  command! -bang -nargs=* Find call fzf#vim#grep('rg --column --line-number --no-heading --fixed-strings --ignore-case --hidden --follow --glob "!.git/*" --color "always" '.shellescape(<q-args>).'| tr -d "\017"', 1, <bang>0)
endif

cnoremap <C-P> <C-R>=expand("%:p:h") . "/" <CR>
nnoremap <silent><leader>b :Buffers<CR>
nnoremap <silent><leader>f :FZF -m<CR>
nnoremap <silent><leader>ag :Ag<CR>
" Recovery commands from history through FZF
nmap <leader>y :History:<CR>

" ultisnips
let g:UltiSnipsExpandTrigger="<c-b>"
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"
let g:UltiSnipsEditSplit="vertical"

" ale
let g:ale_fixers = {
      \ 'c': ['remove_trailing_lines', 'trim_whitespace']
      \ }
let g:ale_linters = {
      \ 'c': ['gcc', 'cppcheck'],
      \ 'cpp': ['gcc', 'cppcheck'],
      \ 'python': ['flake8', 'pylint'],
      \ 'lua': ['luac'],
      \ 'go': ['go build', 'gofmt'],
      \ 'java': ['javac'],
      \ 'javascript': ['eslint'],
      \ }
let g:ale_sign_error = '✗'
let g:ale_sign_warning = '⚡'
let g:ale_linters_explicit = 1
let g:ale_completion_delay = 500
let g:ale_echo_delay = 20
let g:ale_lint_delay = 500
let g:ale_echo_msg_format = '[%linter%] %code: %%s'
let g:ale_lint_on_text_changed = 'never'
let g:ale_lint_on_insert_leave = 0
let g:ale_lint_on_enter = 0
let g:ale_set_highlights = 0
let g:ale_set_quickfix = 1

if executable('gcc') == 0 && executable('clang')
  let g:ale_linters.c += ['clang']
  let g:ale_linters.cpp += ['clang']
endif
let g:ale_c_gcc_options = '-Wall -O2 -std=c11'
let g:ale_cpp_gcc_options = '-Wall -O2 -std=c++1z'

let g:ale_c_clang_options = '-Wall -O2 -std=c11'
let g:ale_cpp_clang_options = '-Wall -O2 -std=c++1z'

let g:ale_c_cppcheck_options = ''
let g:ale_cpp_cppcheck_options = ''

nmap <silent>[a <Plug>(ale_previous_wrap)
nmap <silent>]a <Plug>(ale_next_wrap)
nmap <silent>[A <Plug>(ale_first)
nmap <silent>]A <Plug>(ale_last)

" vim-sayonara
nnoremap <silent><leader>x :Sayonara<CR>
nnoremap <silent><leader>X :Sayonara!<CR>

" vim-easymotion
let g:EasyMotion_smartcase = 1
let g:EasyMotion_startofline = 0 " keep cursor colum when JK motion
map <Leader><leader>h <Plug>(easymotion-linebackward)
map <Leader><Leader>j <Plug>(easymotion-j)
map <Leader><Leader>k <Plug>(easymotion-k)
map <Leader><leader>l <Plug>(easymotion-lineforward)
map <Leader><leader>. <Plug>(easymotion-repeat)

" vim-easy-align
" Start interactive EasyAlign in visual mode (e.g. vipga)
xmap ga <Plug>(EasyAlign)

" Start interactive EasyAlign for a motion/text object (e.g. gaip)
nmap ga <Plug>(EasyAlign)

" leetcode.vim
let g:leetcode_solution_filetype='cpp'
let g:leetcode_browser='chrome'
nnoremap <leader>ll :LeetCodeList<CR>
nnoremap <leader>lt :LeetCodeTest<CR>
nnoremap <leader>ls :LeetCodeSubmit<CR>
nnoremap <leader>li :LeetCodeSignIn<CR>

" markdown-preview.nvim
let g:mkdp_path_to_chrome = "open -a Google\\ Chrome"
nmap <leader>mp <Plug>MarkdownPreview

" vim-plug
nmap <leader>pi :PlugInstall<CR>
nmap <leader>pu :PlugUpdate<CR>
nmap <leader>pc :PlugClean<CR>
nmap <leader>ps :PlugStatus<CR>

" tagbar
let g:tagbar_autoclose = 1
let g:tagbar_autofocus = 1
let g:tagbar_compact = 1
let g:tagbar_right = 1
let g:tagbar_width = 35
let g:tagbar_sort = 0
nnoremap <silent><leader>tt :TagbarToggle<CR>

" YouCompleteMe
let g:ycm_global_ycm_extra_conf = '~/.ycm_extra_conf.py'
let g:ycm_add_preview_to_completeopt = 0
let g:ycm_show_diagnostics_ui = 0
let g:ycm_server_log_level = 'info'
let g:ycm_min_num_identifier_candidate_chars = 2
let g:ycm_collect_identifiers_from_comments_and_strings = 1
let g:ycm_complete_in_comments = 1
let g:ycm_complete_in_strings = 1
" Let clangd fully control code completion
let g:ycm_clangd_uses_ycmd_caching = 0
" Use installed clangd, not YCM-bundled clangd which doesn't get updates.
let g:ycm_clangd_binary_path = 'clangd'
let g:ycm_auto_hover = ''
let g:ycm_clangd_args = [
            \ '--header-insertion=never',
            \ '--clang-tidy',
            \ '--background-index',
            \ '-j=4',
            \ ]

let g:ycm_semantic_triggers = {
      \ 'c,cpp,python,java,go,erlang,perl': ['re!\w{2}'],
      \ 'cs,lua,javascript': ['re!\w{2}'],
      \ 'VimspectorPrompt': [ '.', '->', ':', '<' ],
      \ }

let g:ycm_filetype_whitelist = {
      \ "c":1,
      \ "cpp":1,
      \ "objc":1,
      \ "objcpp":1,
      \ "python":1,
      \ "java":1,
      \ "javascript":1,
      \ "coffee":1,
      \ "vim":1,
      \ "go":1,
      \ "cs":1,
      \ "lua":1,
      \ "perl":1,
      \ "perl6":1,
      \ "php":1,
      \ "ruby":1,
      \ "rust":1,
      \ "erlang":1,
      \ "asm":1,
      \ "nasm":1,
      \ "masm":1,
      \ "tasm":1,
      \ "asm68k":1,
      \ "asmh8300":1,
      \ "asciidoc":1,
      \ "basic":1,
      \ "vb":1,
      \ "make":1,
      \ "cmake":1,
      \ "html":1,
      \ "css":1,
      \ "less":1,
      \ "json":1,
      \ "cson":1,
      \ "typedscript":1,
      \ "haskell":1,
      \ "lhaskell":1,
      \ "lisp":1,
      \ "scheme":1,
      \ "sdl":1,
      \ "sh":1,
      \ "zsh":1,
      \ "bash":1,
      \ "man":1,
      \ "markdown":1,
      \ "matlab":1,
      \ "maxima":1,
      \ "dosini":1,
      \ "conf":1,
      \ "config":1,
      \ "zimbu":1,
      \ "ps1":1,
      \ }
nmap <leader>D <plug>(YCMHover)

" c.vim
let g:C_Ctrl_j = 0

" vim-cpp-enhanced-highlight
let g:cpp_class_scope_highlight = 1
let g:cpp_member_variable_highlight = 1
let g:cpp_class_decl_highlight = 1
let g:cpp_posix_standard = 1
let g:cpp_experimental_simple_template_highlight = 1
let g:cpp_concepts_highlight = 1

" vim-go
let g:go_list_type = "quickfix"
let g:go_fmt_command = "goimports"
let g:go_fmt_fail_silently = 1
let g:go_auto_sameids = 1

let g:go_highlight_types = 1
let g:go_highlight_fields = 1
let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_highlight_operators = 1
let g:go_highlight_build_constraints = 1
let g:go_highlight_structs = 1
let g:go_highlight_generate_tags = 1
let g:go_highlight_space_tab_error = 0
let g:go_highlight_array_whitespace_error = 0
let g:go_highlight_trailing_whitespace_error = 0
let g:go_highlight_extra_types = 1

" Syntax highlight
let python_highlight_all = 1

" vim-pandoc
nmap <leader>pp :Pandoc pdf<CR>

" vim-pandoc-after
let g:pandoc#after#modules#enabled = ["ultisnips", "tablemode"]

" vim-gutentags
let g:gutentags_project_root = ['.root', '.svn', '.git', '.hg', '.project']
let g:gutentags_file_list_command = {
      \ 'markers': {
      \ '.git': 'git ls-files',
      \ },
      \ }

let g:gutentags_modules = []
if executable('ctags')
  let g:gutentags_modules += ['ctags']
endif
if executable('gtags-cscope') && executable('gtags')
  let g:gutentags_modules += ['gtags_cscope']
elseif executable('cscope')
  let g:gutentags_modules += ['cscope']
endif
let s:vim_tags = expand('~/.cache/tags')
if !isdirectory(s:vim_tags)
  silent! call mkdir(s:vim_tags, 'p')
endif

let g:gutentags_cache_dir = s:vim_tags
let g:gutentags_ctags_extra_args = []
let g:gutentags_ctags_extra_args += ['--fields=+niazS', '--extras=+q']
let g:gutentags_ctags_extra_args += ['--c++-kinds=+px']
let g:gutentags_ctags_extra_args += ['--c-kinds=+px']
if executable('ctags') && system('ctags --version') =~? 'universal'
  let g:gutentags_ctags_extra_args += ['--output-format=e-ctags']
endif

let g:gutentags_cscope_build_inverted_index = 1
let g:gutentags_exclude_filetypes = [
      \ 'gitcommit',
      \ 'gitconfig',
      \ 'gitrebase',
      \ 'gitsendemail',
      \ 'git',
      \ 'GV',
      \ ]
let g:gutentags_generate_on_empty_buffer = 1

" echodoc
let g:echodoc#enable_at_startup = 1

" vim-notes
let g:notes_directories = ['~/src/notes']

" asyncrun.vim
let g:airline_theme_patch_func = 'AirlineThemePatch'
let g:async_status_old = ''
call airline#parts#define_function('asyncrun_status', 'Get_asyncrun_running')
let g:airline_section_x = airline#section#create(['asyncrun_status'])
command! -bang -nargs=* -complete=file Make AsyncRun -program=make @ <args>
nnoremap <leader>ar :AsyncRun 

" asynctasks.vim
nnoremap <leader>at :AsyncTask 

" vimtex
let g:tex_flavor = 'latex'

" undotree
let g:undotree_WindowLayout = 2
nnoremap U :UndotreeToggle<CR>

" vim-startify
let g:startify_change_to_dir = 0

" vimspector
let g:vimspector_install_gadgets = [ 'vscode-cpptools' ]

nnoremap <leader>dd :call vimspector#Launch()<CR>
nnoremap <leader>dc :call GotoWindow(g:vimspector_session_windows.code)<CR>
nnoremap <leader>dt :call GotoWindow(g:vimspector_session_windows.tagpage)<CR>
nnoremap <leader>dv :call GotoWindow(g:vimspector_session_windows.variables)<CR>
nnoremap <leader>dw :call GotoWindow(g:vimspector_session_windows.watches)<CR>
nnoremap <leader>ds :call GotoWindow(g:vimspector_session_windows.stack_trace)<CR>
nnoremap <leader>do :call GotoWindow(g:vimspector_session_windows.output)<CR>
nnoremap <leader>de :call vimspector#Reset()<CR>

nnoremap <leader>dtcb :call vimspector#CleanLineBreakpoint()<CR>

nmap <leader>dl <Plug>VimspectorStepInto
nmap <leader>dj <Plug>VimspectorStepOver
nmap <leader>dk <Plug>VimspectorStepOut
nmap <leader>d_ <Plug>VimspectorRestart
nnoremap <leader>d<space> :call vimspector#Continue()<CR>

nmap <leader>drc <Plug>VimspectorRunToCursor
nmap <leader>dbp <Plug>VimspectorToggleBreakpoint
nmap <leader>dcbp <Plug>VimspectorToggleConditionalBreakpoint

" vim-maximizer
let g:maximizer_set_default_mapping = 0
nnoremap <silent><leader>m :MaximizerToggle!<CR>

" vim-visual-multi
let g:VM_silent_exit = 1
let g:VM_show_warnings = 0

" }}}
"*****************************************************************************
"" Autocmd Rules {{{
"*****************************************************************************

" Reload vimrc on save
if has ('autocmd')     " Remain compatible with earlier versions
  augroup reload-vimrc " Source vim configuration upon save
    autocmd!
    autocmd! BufWritePost $MYVIMRC source % | echom "Reloaded " . $MYVIMRC | redraw
    autocmd! BufWritePost $MYGVIMRC if has('gui_running') | so % | echom "Reloaded " . $MYGVIMRC | endif | redraw
  augroup END
endif

" The PC is fast enough, do syntax highlight syncing from start unless 200 lines
augroup vimrc-sync-fromstart
  autocmd!
  autocmd BufEnter * :syntax sync maxlines=200
augroup END

" Remember cursor position
augroup vimrc-remember-cursor-position
  autocmd!
  autocmd BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g`\"" | endif
augroup END

" Leave paste mode when leaving insert mode
autocmd InsertLeave * set nopaste

" C/C++
augroup vimrc-c/c++
  autocmd!
  autocmd FileType c,cpp setlocal tabstop=4 shiftwidth=4
        \ commentstring=//\ %s
augroup END

" Go
augroup vimrc-go
  autocmd!
  autocmd BufNewFile,BufRead *.go setlocal tabstop=4 shiftwidth=4 softtabstop=4 noexpandtab
augroup END

augroup completion_preview_close
  autocmd!
  if v:version > 703 || v:version == 703 && has('patch598')
    autocmd CompleteDone * if !&previewwindow && &completeopt =~ 'preview' | silent! pclose | endif
  endif
augroup END

" vim-python
augroup vimrc-python
  autocmd!
  autocmd FileType python setlocal tabstop=8 shiftwidth=4 softtabstop=4
        \ formatoptions+=croq
        \ cinwords=if,elif,else,for,while,try,except,finally,def,class,with
augroup END

" Vimscript
augroup vimrc-vim
  autocmd!
  autocmd FileType vim setlocal tabstop=2 shiftwidth=2
augroup END

" txt
augroup vimrc-wrapping
  autocmd!
  autocmd BufNewFile,BufRead *.txt call s:setupWrapping()
augroup END

" make/cmake
augroup vimrc-make-cmake
  autocmd!
  autocmd FileType make setlocal noexpandtab
  autocmd BufNewFile,BufRead CMakeLists.txt setlocal filetype=cmake
augroup END

" LaTex
augroup latex-vim
  autocmd!
  autocmd FileType tex setlocal tabstop=2 shiftwidth=2
augroup END

" }}}
"*****************************************************************************
"" Abbreviations {{{
"*****************************************************************************

" no one is really happy until you have this shortcuts
cnoreabbrev W! w!
cnoreabbrev Q! q!
cnoreabbrev Qall! qall!
cnoreabbrev Wq wq
cnoreabbrev Wa wa
cnoreabbrev wQ wq
cnoreabbrev WQ wq
cnoreabbrev W w
cnoreabbrev Q q
cnoreabbrev Qall qall

iabbrev <expr> fixme FixMeTag()

" }}}
"*****************************************************************************
" Local vimrc {{{
"*****************************************************************************

" Include user's local vim config
if filereadable(expand("~/.vimrc.local"))
  source ~/.vimrc.local
endif

" }}}
