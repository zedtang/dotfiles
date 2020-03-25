" vim-bootstrap

"*****************************************************************************
"" Vim-PLug core
"*****************************************************************************
let vimplug_exists=expand('~/.vim/autoload/plug.vim')

let g:vim_bootstrap_langs = "c,go,python"
let g:vim_bootstrap_editor = "vim"				" nvim or vim

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
"" Project/Filetree Browsing
Plug 'scrooloose/nerdtree'
Plug 'jistr/vim-nerdtree-tabs'

"" Buffer/File Browsing
Plug 'vim-scripts/grep.vim', { 'on': 'Rgrep' }
if isdirectory('/usr/local/opt/fzf')
  Plug '/usr/local/opt/fzf' | Plug 'junegunn/fzf.vim'
else
  Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --bin' }
  Plug 'junegunn/fzf.vim'
endif

"" Code Browsing
Plug 'ludovicchabant/vim-gutentags'
Plug 'skywind3000/gutentags_plus'
Plug 'majutsushi/tagbar', { 'on': 'TagbarToggle' }

"" Writing Code
Plug 'ycm-core/YouCompleteMe'
Plug 'w0rp/ale'
Plug 'sheerun/vim-polyglot'
Plug 'jiangmiao/auto-pairs'
Plug 'Yggdroot/indentLine'
Plug 'bronson/vim-trailing-whitespace'
Plug 'chrisbra/NrrwRgn'
Plug 'kana/vim-textobj-user'
Plug 'kana/vim-textobj-indent'
Plug 'kana/vim-textobj-syntax'
Plug 'kana/vim-textobj-function', { 'for':['c', 'cpp', 'vim', 'java'] }
Plug 'sgur/vim-textobj-parameter'
Plug 'Shougo/echodoc.vim'

"" Vim Functionality
Plug 'henrik/vim-indexed-search'
Plug 'tpope/vim-unimpaired'
Plug 'tpope/vim-surround'
Plug 'easymotion/vim-easymotion'
Plug 'terryma/vim-multiple-cursors'
Plug 'junegunn/vim-easy-align'
Plug 'wellle/targets.vim'
Plug 'tpope/vim-repeat'
Plug 'mhinz/vim-sayonara', {'on': 'Sayonara'}

"" Source Control Integration
Plug 'tpope/vim-fugitive'
if has('nvim') || has('patch-8.0.902')
  Plug 'mhinz/vim-signify'
else
  Plug 'mhinz/vim-signify', { 'tag': 'legacy' }
endif
Plug 'tpope/vim-rhubarb' " required by fugitive to :Gbrowse
Plug 'junegunn/gv.vim'

"" Comments
Plug 'tpope/vim-commentary'

"" Misc
Plug 'avelino/vim-bootstrap-updater'
Plug 'mhinz/vim-startify'
Plug 'ianding1/leetcode.vim'

let g:make = 'gmake'
if exists('make')
        let g:make = 'make'
endif
Plug 'Shougo/vimproc.vim', {'do': g:make}

"" Vim-Session
Plug 'xolox/vim-misc'
Plug 'xolox/vim-session'

"" Snippets
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'

"" Color
Plug 'NLKNguyen/papercolor-theme'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'vim-scripts/CSApprox'
Plug 'ryanoasis/vim-devicons'

"*****************************************************************************
"" Custom bundles
"*****************************************************************************

" c/c++
Plug 'vim-scripts/c.vim', {'for': ['c', 'cpp', 'make']}
Plug 'ludwig/split-manpage.vim'
Plug 'zedtang/a.vim', {'for': ['c', 'cpp']}
Plug 'justinmk/vim-syntax-extra'
Plug 'octol/vim-cpp-enhanced-highlight', {'for': 'cpp'}


" go
"" Go Lang Bundle
Plug 'fatih/vim-go', {'for': 'go', 'do': ':GoInstallBinaries'}


" python
"" Python Bundle
Plug 'davidhalter/jedi-vim', {'for': 'python'}
Plug 'raimon49/requirements.txt.vim', {'for': 'requirements'}


" latex
Plug 'lervag/vimtex'


" markdown
Plug 'godlygeek/tabular'
Plug 'plasticboy/vim-markdown', { 'for': 'markdown' }
Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install() }, 'for': 'markdown', 'on': 'MarkdownPreview' }
Plug 'dhruvasagar/vim-table-mode', { 'for': 'markdown' }
Plug 'vim-pandoc/vim-pandoc'
Plug 'vim-pandoc/vim-pandoc-syntax'
Plug 'vim-pandoc/vim-pandoc-after'


"*****************************************************************************
"*****************************************************************************

"" Include user's extra bundle
if filereadable(expand("~/.vimrc.local.bundles"))
  source ~/.vimrc.local.bundles
endif

call plug#end()

" Required:
filetype plugin indent on


"*****************************************************************************
"" Basic Setup
"*****************************************************************************"
"" Encoding
set encoding=utf-8
set fileencoding=utf-8
set fileencodings=utf-8

set ttyfast

"" Fix backspace indent
set backspace=indent,eol,start

set updatetime=100

"" Fix slow O inserts
set timeout timeoutlen=1000 ttimeoutlen=100

"" Tabs. May be overridden by autocmd rules
set tabstop=4
set softtabstop=0
set shiftwidth=4
set expandtab

"" Map leader to space
let mapleader=' '

"" Enable hidden buffers
set hidden

"" Searching
set hlsearch
set incsearch
set ignorecase
set smartcase

"" auto-change directory
set autochdir

"" Directories for swp files
set nobackup
set noswapfile

set nojoinspaces

"" Use mouse
set mouse=a

"" Save edit history for undo
if !isdirectory($HOME."/.vim/undodir")
    call mkdir($HOME."/.vim/undodir", "", 0700)
endif
set undodir=~/.vim/undodir
set undofile

set fileformats=unix,dos,mac

if exists('$SHELL')
    set shell=$SHELL
else
    set shell=/bin/sh
endif

" session management
let g:session_directory = "~/.vim/session"
let g:session_autoload = "no"
let g:session_autosave = "no"
let g:session_command_aliases = 1

" Completion options
set completeopt=menu,menuone
if has('patch-8.0.1000')
    set completeopt=menu,menuone,noselect
endif

" Suppress annoy messages
set shortmess+=c

" cscope_maps
set nocscopeverbose

"*****************************************************************************
"" Visual Settings
"*****************************************************************************
syntax enable
syntax on
set ruler
set number
set relativenumber
set cursorline
set noshowmode

"" block cursor in normal mode, vertical bar in insert mode
if exists('$TMUX')
    let &t_SI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=1\x7\<Esc>\\"
    let &t_EI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=0\x7\<Esc>\\"
else
    let &t_SI = "\<Esc>]50;CursorShape=1\x7"
    let &t_EI = "\<Esc>]50;CursorShape=0\x7"
endif

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

let no_buffers_menu=1
silent! colorscheme PaperColor
set background=light

set mousemodel=popup
set t_Co=256
set guioptions=egmrti
set gfn=FiraCodeNerdFontComplete-Regular:h14

if has("gui_running")
  if has("gui_mac") || has("gui_macvim")
    set guifont=FiraCodeNerdFontComplete-Regular:h14
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

"" Disable the blinking cursor.
set gcr=a:blinkon0
set scrolloff=3

"" Status bar
set laststatus=2
set showcmd

"" Use modeline overrides
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
let g:airline#extensions#branch#enabled = 1
let g:airline#extensions#ale#enabled = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tagbar#enabled = 1
let g:airline_skip_empty_sections = 1

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
  \]

" fzf
let g:fzf_colors =
\ { 'fg':      ['fg', 'Normal'],
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
  \ 'header':  ['fg', 'Comment'] }

"*****************************************************************************
"" Abbreviations
"*****************************************************************************
"" no one is really happy until you have this shortcuts
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

"*****************************************************************************
"" Commands
"*****************************************************************************
" remove trailing whitespaces
command! FixWhitespace :%s/\s\+$//e

"*****************************************************************************
"" Functions
"*****************************************************************************
if !exists('*s:setupWrapping')
  function s:setupWrapping()
    set wrap
    set wm=2
    set textwidth=79
  endfunction
endif

"*****************************************************************************
"" Autocmd Rules
"*****************************************************************************
"" Toggle relativenumber
augroup number-toggle
  autocmd!
  autocmd BufEnter,FocusGained,InsertLeave * set relativenumber
  autocmd BufLeave,FocusLost,InsertEnter   * set norelativenumber
augroup END

"" Reload vimrc on save
if has ('autocmd')     " Remain compatible with earlier versions
  augroup reload-vimrc " Source vim configuration upon save
    autocmd!
    autocmd! BufWritePost $MYVIMRC source % | echom "Reloaded " . $MYVIMRC | redraw
    autocmd! BufWritePost $MYGVIMRC if has('gui_running') | so % | echom "Reloaded " . $MYGVIMRC | endif | redraw
  augroup END
endif

"" The PC is fast enough, do syntax highlight syncing from start unless 200 lines
augroup vimrc-sync-fromstart
  autocmd!
  autocmd BufEnter * :syntax sync maxlines=200
augroup END

"" Remember cursor position
augroup vimrc-remember-cursor-position
  autocmd!
  autocmd BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g`\"" | endif
augroup END

"" txt
augroup vimrc-wrapping
  autocmd!
  autocmd BufRead,BufNewFile *.txt call s:setupWrapping()
augroup END

"" make/cmake
augroup vimrc-make-cmake
  autocmd!
  autocmd FileType make setlocal noexpandtab
  autocmd BufNewFile,BufRead CMakeLists.txt setlocal filetype=cmake
augroup END

set autoread

"" vim-commentary
autocmd FileType c,cpp,cs,java setlocal commentstring=//\ %s

"*****************************************************************************
"" Mappings
"*****************************************************************************
"" NERDTree configuration
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
set wildignore+=*/tmp/*,*.so,*.swp,*.zip,*.pyc,*.db,*.sqlite
" Start NERDTree
" autocmd VimEnter * NERDTree

" Go to previous (last accessed) window.
" autocmd VimEnter * wincmd p

" Keep NERDTree open in buffers/tabs
" autocmd BufWinEnter * NERDTreeMirrorOpen

"" NERDTree Tabs configuration
let g:nerdtree_tabs_open_on_console_startup=2
let g:nerdtree_tabs_focus_on_files=1
let g:nerdtree_tabs_autofind=1
nnoremap <silent> <F2> :NERDTreeTabsFind<CR>
nnoremap <silent> <leader>n :NERDTreeMirrorToggle<CR>

" grep.vim
nnoremap <silent> <leader>g :Rgrep<CR>
let Grep_Default_Options = '-IR'
let Grep_Skip_Files = '*.log *.db'
let Grep_Skip_Dirs = '.git node_modules'

" terminal emulation
nnoremap <silent> <leader>sh :terminal<CR>

"" Split
noremap <Leader>h :<C-u>split<CR>
noremap <Leader>v :<C-u>vsplit<CR>
set splitbelow
set splitright

"" Git
noremap <Leader>ga :Gwrite<CR>
noremap <Leader>gc :Gcommit<CR>
noremap <Leader>gp :Gpush<CR>
noremap <Leader>gl :Gpull<CR>
noremap <Leader>gst :Gstatus<CR>
noremap <Leader>gb :Gblame<CR>
noremap <Leader>gd :Gvdiff<CR>
noremap <Leader>grm :Gremove<CR>

" session management
nnoremap <leader>so :OpenSession<Space>
nnoremap <leader>ss :SaveSession<Space>
nnoremap <leader>sd :DeleteSession<CR>
nnoremap <leader>sc :CloseSession<CR>

"" Set working directory
nnoremap <leader>. :lcd %:p:h<CR>

"" Opens an edit command with the path of the currently edited file filled in
noremap <Leader>e :e <C-R>=expand("%:p:h") . "/" <CR>

"" Opens a tab edit command with the path of the currently edited file filled
noremap <Leader>te :tabe <C-R>=expand("%:p:h") . "/" <CR>

"" fzf.vim
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
nnoremap <silent> <leader>b :Buffers<CR>
nnoremap <silent> <leader>f :FZF -m<CR>
nnoremap <silent> <leader>s :Ag<CR>
"Recovery commands from history through FZF
nmap <leader>y :History:<CR>

" snippets
let g:UltiSnipsExpandTrigger="<c-b>"
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"
let g:UltiSnipsEditSplit="vertical"

" ale
let g:ale_linters = {}
let g:ale_sign_error = '✗'
let g:ale_sign_warning = '⚡'
let g:ale_linters_explicit = 1
let g:ale_completion_delay = 500
let g:ale_echo_delay = 20
let g:ale_lint_delay = 500
let g:ale_echo_msg_format = '[%linter%] %code: %%s'
let g:ale_lint_on_text_changed = 'normal'
let g:ale_lint_on_insert_leave = 1
let g:ale_set_highlights = 0

" Disable visualbell
set noerrorbells visualbell t_vb=
if has('autocmd')
  autocmd GUIEnter * set visualbell t_vb=
endif

"" Copy/Paste/Cut
if has('unnamedplus')
  set clipboard=unnamed,unnamedplus
endif

noremap YY "+y<CR>
noremap <leader>p "+gP<CR>
noremap XX "+x<CR>
"" paste word multiple times
xnoremap p pgvy

if has('macunix')
  " pbcopy for OSX copy/paste
  vmap <C-x> :!pbcopy<CR>
  vmap <C-c> :w !pbcopy<CR><CR>
endif

" Leave paste mode when leaving insert mode
autocmd InsertLeave * set nopaste

"" vim-sayonara
nnoremap <silent><leader>x :Sayonara<CR>
nnoremap <silent><leader>X :Sayonara!<CR>

" Search mappings: These will make it so that going to the next one in a
" search will center on the line it's found in.
nnoremap n nzzzv
nnoremap N Nzzzv

"" Clean search (highlight)
nnoremap <silent> <leader>c :noh<CR>

"" Switching windows
noremap <C-j> <C-w>j
noremap <C-k> <C-w>k
noremap <C-l> <C-w>l
noremap <C-h> <C-w>h

"" Vmap for maintain Visual Mode after shifting > and <
vmap < <gv
vmap > >gv

" 'Q' in normal mode enters Ex mode. You almost never want this.
nmap Q <Nop>
" Unbind for tmux
map <C-a> <Nop>
map <C-x> <Nop>

"" Move visual block
vnoremap J :m '>+1<CR>gv=gv
vnoremap K :m '<-2<CR>gv=gv

"" Open current line on GitHub
nnoremap <Leader>o :.Gbrowse<CR>

"" Easymotion
let g:EasyMotion_smartcase = 1
let g:EasyMotion_startofline = 0 " keep cursor colum when JK motion
map <Leader><leader>h <Plug>(easymotion-linebackward)
map <Leader><Leader>j <Plug>(easymotion-j)
map <Leader><Leader>k <Plug>(easymotion-k)
map <Leader><leader>l <Plug>(easymotion-lineforward)
map <Leader><leader>. <Plug>(easymotion-repeat)

"" EasyAlign
" Start interactive EasyAlign in visual mode (e.g. vipga)
xmap ga <Plug>(EasyAlign)

" Start interactive EasyAlign for a motion/text object (e.g. gaip)
nmap ga <Plug>(EasyAlign)

"" leetcode.vim
let g:leetcode_solution_filetype='cpp'
let g:leetcode_browser='chrome'
nnoremap <leader>ll :LeetCodeList<CR>
nnoremap <leader>lt :LeetCodeTest<CR>
nnoremap <leader>ls :LeetCodeSubmit<CR>
nnoremap <leader>li :LeetCodeSignIn<CR>

"" markdown-preview.nvim
let g:mkdp_path_to_chrome = "open -a Google\\ Chrome"
nmap <leader>mp <Plug>MarkdownPreview

"" NrrwRgn
let g:nrrw_rgn_vert = 1
let g:nrrw_rgn_nohl = 1
let g:nrrw_rgn_nomap_nr = 1
let g:nrrw_rgn_nomap_Nr = 1
xmap <Leader>nr <Plug>NrrwrgnBangDo

"" vim-plug
nmap <leader>pi :PlugInstall<CR>
nmap <leader>pu :PlugUpdate<CR>
nmap <leader>pc :PlugClean<CR>
nmap <leader>ps :PlugStatus<CR>

" ctags
" jump to tag if one, show list otherwise
nmap <C-]> g<C-]>
set tags=./.tags;,.tags

"" tagbar
let g:tagbar_autofocus=0
let g:tagbar_compact=1
let g:tagbar_right=1
let g:tagbar_width=35
let g:tagbar_sort = 0
nnoremap <leader>tt :TagbarToggle<CR>

" YouCompleteMe
let g:ycm_global_ycm_extra_conf = '~/.ycm_extra_conf.py'
let g:ycm_add_preview_to_completeopt = 0
let g:ycm_show_diagnostics_ui = 0
let g:ycm_server_log_level = 'info'
let g:ycm_min_num_identifier_candidate_chars = 2
let g:ycm_collect_identifiers_from_comments_and_strings = 1
let g:ycm_complete_in_strings=1
" Let clangd fully control code completion
let g:ycm_clangd_uses_ycmd_caching = 0
" Use installed clangd, not YCM-bundled clangd which doesn't get updates.
let g:ycm_clangd_binary_path = exepath("clangd")

let g:ycm_semantic_triggers =  {
    \ 'c,cpp,python,java,go,erlang,perl': ['re!\w{2}'],
    \ 'cs,lua,javascript': ['re!\w{2}'],
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
nnoremap <leader>yg :YcmCompleter GoTo<CR>

"*****************************************************************************
"" Custom configs
"*****************************************************************************

" c/c++
augroup vimrc-c/c++
  autocmd!
  autocmd FileType c,cpp setlocal tabstop=4 shiftwidth=4 expandtab
augroup END

" c.vim
let g:C_Ctrl_j = 0

" vim-cpp-enhanced-highlight
let g:cpp_class_scope_highlight = 1
let g:cpp_member_variable_highlight = 1
let g:cpp_class_decl_highlight = 1
let g:cpp_posix_standard = 1
let g:cpp_experimental_simple_template_highlight = 1
let g:cpp_concepts_highlight = 1

" ale
:call extend(g:ale_linters, {
    \"c": ['gcc', 'cppcheck'],
    \"cpp": ['g++', 'cppcheck'], })
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

" go
" vim-go
" run :GoBuild or :GoTestCompile based on the go file
function! s:build_go_files()
  let l:file = expand('%')
  if l:file =~# '^\f\+_test\.go$'
    call go#test#Test(0, 1)
  elseif l:file =~# '^\f\+\.go$'
    call go#cmd#Build(0)
  endif
endfunction

let g:go_list_type = "quickfix"
let g:go_fmt_command = "goimports"
let g:go_fmt_fail_silently = 1

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

autocmd BufNewFile,BufRead *.go setlocal noexpandtab tabstop=4 shiftwidth=4 softtabstop=4

augroup completion_preview_close
  autocmd!
  if v:version > 703 || v:version == 703 && has('patch598')
    autocmd CompleteDone * if !&previewwindow && &completeopt =~ 'preview' | silent! pclose | endif
  endif
augroup END

augroup vimrc-go

  au!
  au Filetype go command! -bang A call go#alternate#Switch(<bang>0, 'edit')
  au Filetype go command! -bang AV call go#alternate#Switch(<bang>0, 'vsplit')
  au Filetype go command! -bang AS call go#alternate#Switch(<bang>0, 'split')
  au Filetype go command! -bang AT call go#alternate#Switch(<bang>0, 'tabe')

  au FileType go nmap <Leader>dd <Plug>(go-def-vertical)
  au FileType go nmap <Leader>dv <Plug>(go-doc-vertical)
  au FileType go nmap <Leader>db <Plug>(go-doc-browser)

  au FileType go nmap <leader>r  <Plug>(go-run)
  au FileType go nmap <leader>t  <Plug>(go-test)
  au FileType go nmap <Leader>gt <Plug>(go-coverage-toggle)
  au FileType go nmap <Leader>i <Plug>(go-info)
  au FileType go nmap <silent> <Leader>l <Plug>(go-metalinter)
  au FileType go nmap <C-g> :GoDecls<CR>
  au FileType go nmap <leader>dr :GoDeclsDir<CR>
  au FileType go imap <C-g> <esc>:<C-u>GoDecls<CR>
  au FileType go imap <leader>dr <esc>:<C-u>GoDeclsDir<CR>
  au FileType go nmap <leader>rb :<C-u>call <SID>build_go_files()<CR>

augroup END

" ale
:call extend(g:ale_linters, {
    \"go": ['golint', 'go vet'], })


" python
" vim-python
augroup vimrc-python
  autocmd!
  autocmd FileType python setlocal expandtab shiftwidth=4 tabstop=8
      \ formatoptions+=croq softtabstop=4
      \ cinwords=if,elif,else,for,while,try,except,finally,def,class,with
augroup END

" jedi-vim
let g:jedi#popup_on_dot = 0
let g:jedi#goto_assignments_command = "<leader>g"
let g:jedi#goto_definitions_command = "<leader>d"
let g:jedi#documentation_command = "K"
let g:jedi#usages_command = "<leader>n"
let g:jedi#rename_command = "<leader>r"
let g:jedi#show_call_signatures = "0"
let g:jedi#completions_command = "<C-Space>"
let g:jedi#smart_auto_mappings = 0

" ale
:call extend(g:ale_linters, {
    \'python': ['flake8'], })

" vim-airline
let g:airline#extensions#virtualenv#enabled = 1

" Syntax highlight
" Default highlight is better than polyglot
let g:polyglot_disabled = ['python', 'latex']
let python_highlight_all = 1

" vim-pandoc
nmap <leader>pp :Pandoc pdf<CR>

" vim-pandoc-after
let g:pandoc#after#modules#enabled = ["nrrwrgn", "ultisnips", "tablemode"]

" vim-gutentags
let g:gutentags_project_root = ['.root', '.svn', '.git', '.hg', '.project']
let g:gutentags_ctags_tagfile = '.tags'
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
endif
let s:vim_tags = expand('~/.cache/tags')
let g:gutentags_cache_dir = s:vim_tags
let g:gutentags_ctags_extra_args = []
let g:gutentags_ctags_extra_args += ['--fields=+niazS', '--extra=+q']
let g:gutentags_ctags_extra_args += ['--c++-kinds=+px']
let g:gutentags_ctags_extra_args += ['--c-kinds=+px']

let g:gutentags_cscope_build_inverted_index = 1
let g:gutentags_auto_add_gtags_cscope = 0

" change focus to quickfix window after search
let g:gutentags_plus_switch = 1

if !isdirectory(s:vim_tags)
   silent! call mkdir(s:vim_tags, 'p')
endif

" vim-airline
let g:airline#extensions#gutentags#enabled = 1

" echodoc
let g:echodoc#enable_at_startup = 1

" vim-signify
let g:signify_vcs_list = ['git']
let g:signify_difftool = 'diff'
let g:signify_sign_add = '+'
let g:signify_sign_delete = '_'
let g:signify_sign_delete_first_line = '‾'
let g:signify_sign_change = '~'
let g:signify_sign_changedelete = g:signify_sign_change
let g:signify_as_gitgutter = 1

let g:signify_vcs_cmds = {
         \ 'git': 'git diff --no-color --diff-algorithm=histogram --no-ext-diff -U0 -- %f',
         \}

"*****************************************************************************
"*****************************************************************************

"" Include user's local vim config
if filereadable(expand("~/.vimrc.local"))
  source ~/.vimrc.local
endif

"*****************************************************************************
"" Convenience variables
"*****************************************************************************

" vim-airline
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
