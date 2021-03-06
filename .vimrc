set nocompatible
filetype off

" Force loading python3
if has('python3')
endif

" Using vim-plug for plugins https://github.com/junegunn/vim-plug

call plug#begin("~/.vim/bundle")

Plug 'scrooloose/nerdtree'

Plug 'ctrlpvim/ctrlp.vim'

Plug 'FelikZ/ctrlp-py-matcher'

Plug 'mileszs/ack.vim'

Plug 'easymotion/vim-easymotion'

Plug 'bronson/vim-trailing-whitespace'

Plug 'takac/vim-hardtime'

Plug 'airblade/vim-rooter'

Plug 'vim-scripts/PreserveNoEOL'

Plug 'itchyny/lightline.vim'

Plug 'w0rp/ale'

Plug 'tpope/vim-surround'

Plug 'tpope/vim-commentary'

Plug 'tpope/vim-abolish'

Plug 'wellle/targets.vim'

Plug 'fatih/vim-go'

Plug 'pearofducks/ansible-vim'

Plug 'ddrscott/vim-side-search'

Plug 'ludovicchabant/vim-gutentags'

Plug 'majutsushi/tagbar'

Plug 'joonty/vdebug'

Plug 'vim-php/tagbar-phpctags.vim'

"Plug 'php-vim/phpcd.vim', { 'for': 'php' , 'do': 'composer update' }

Plug '2072/PHP-Indenting-for-VIm'

Plug '2072/vim-syntax-for-PHP'

"Plug '~/.vim/bundle/vim-syntax-for-phtml'

Plug 'arnaud-lb/vim-php-namespace'

Plug 'sirver/ultisnips'

Plug 'sniphpets/sniphpets'

Plug 'sniphpets/sniphpets-common'

Plug 'sniphpets/sniphpets-symfony'

Plug 'sniphpets/sniphpets-doctrine'

Plug 'robertbasic/vim-snippets'

Plug 'robertbasic/vim-argument-swapper'

Plug 'robertbasic/vim-pyqt5-importer'

Plug 'robertbasic/vim-hugo-helper'

Plug 'robertbasic/snipbar'

Plug 'phpstan/vim-phpstan'

call plug#end()

" Enable filetype indentation
filetype plugin indent on

" Do smart autoindenting
set smartindent
set autoindent

" Use UTF-8 encoding
set encoding=utf-8

" Can't remember why is this in
" or from where did I pick it up
let bash_is_sh=1

" ==== Display settings ====
" P - whatever is yanked is automatically put in the system clipboard
" m - show menu bar
set guioptions=Pm

" The ruler shows line, column numbers
" and relative position of the cursor
set ruler

" Show line numbers
set number

" Show in what mode we are
set showmode
" Show command entered in bottom right
set showcmd
" Remember the last 100 commands on the command-line
set history=100
" Hide buffers instead of unloading them
" If we unload a buffer it means it's local history/undo stack
" will be gone if we switch buffers
set hidden

" Tab settings
" One tab is 4 space
set tabstop=4
" Number of spaces for (auto)indent
set shiftwidth=4
" Round indent to multiple of shiftwidth
set shiftround
" Expand tabs to spaces
set expandtab
set softtabstop=4

" Syntax!
" Turn on syntax highlightning
syntax on
set termguicolors
colorscheme desert
set background=dark

" Turn on command-line completion
set wildmenu
" List all matches and complete till longest common string
set wildmode=full

" Always have a status line
set laststatus=2

" Hide mouse when typing
set mousehide

" When scrolling up/down the page, number of lines when scrolling starts
set scrolloff=8

" change how the cursor looks
set guicursor=n-v-c:block-Cursor-blinkon0
set guicursor+=ve:ver35-Cursor
set guicursor+=o:hor50-Cursor
set guicursor+=i-ci:ver25-Cursor
set guicursor+=r-cr:hor20-Cursor
set guicursor+=sm:block-Cursor-blinkwait175-blinkoff150-blinkon175

" Show cursorline for the active buffer
" Hide cursorline for inactive buffers
augroup CursorLine
    au!
    au WinLeave * setlocal nocursorline
    au VimEnter,WinEnter,BufWinEnter * setlocal cursorline
augroup End

" Set font
set guifont=DejaVu\ Sans\ Mono\ 12

function! SetBigFont()
    set guifont=DejaVu\ Sans\ Mono\ 12
endfun

function! SetSmallFont()
    set guifont=DejaVu\ Sans\ Mono\ 10
endfun

" ==== End display settings ====

" Make backspace behave normally
set backspace=2

" Space, the Leader!
let mapleader="\<space>"

" ==== Search/yank settings ====
" Yank/delete copies to system clipboard
set clipboard=unnamed

" Search settings
" Ignore case when searching
set ignorecase
" Ignore ignorecase when search pattern contains uppercase chars
set smartcase
" Incremental search - start highlighting search results as the
" search string is typed
set incsearch
" Highlight search results
set hlsearch

" Let the tag search be smart as well
set tagcase=smart

" Normal, non-recursive map
" Clear the search buffer
nnoremap <leader>, :noh<cr>

" Make n always search forward
" Make N always search backward
nnoremap <expr> n 'Nn'[v:searchforward]
nnoremap <expr> N 'nN'[v:searchforward]

" ==== End search/yank settings ====


" consider
" set selection=old

" ==== Plugins settings ====
if executable('ag')
    let g:ackprg = 'ag --nogroup --nocolor --column'
endif
cnoreabbrev Ack Ack!
nnoremap <leader>ag :Ack!<Space>
"
" ==== VIM PyQt5 Importer settings ====
map <leader>pi :PyQt5ImportClass<cr>
" ==== End VIM PyQt5 Importer settings ====
"
" ==== VIM Argument Swapper settings ====
map <leader>as :ArgumentSwapperSwap<cr>
" ==== End VIM Argument Swapper settings ====
"
" ==== NERDTree settings ====
nnoremap <silent> <c-n> :NERDTreeToggle<CR>
let NERDTreeMapHelp='<f1>'
let NERDTreeIgnore = ['\.pyc$', '__init__.py', '__pycache__', '\.php\~$']
" ==== End NERDtree settings ====
"
" ==== CtrlP settings ====
" Open CtrlP buffers
map <tab> :CtrlPBuffer<cr>
map <leader>tb :CtrlPBufTag<cr>
map <leader>ta :CtrlPTag<cr>
" Jump to definition
map <silent> <leader>jd :CtrlPTag<cr><C-\>w
" Things to ignore with CtrlP
let g:ctrlp_user_command = 'ag %s -l --nocolor -g "" '
" uses ~/.agignore
"let g:ctrlp_custom_ignore = 'vendor/\|tests\/log\|git\|env\|build/\|dist/\|__pycache__\|docs\/build/\|public_html\/api/\|public_html\/docs/\|*.pyc'
let g:ctrlp_match_current_file = 1
let g:ctrlp_lazy_update = 1
let g:ctrlp_extensions = ['tag', 'buffertag']
let g:ctrlp_match_func = { 'match': 'pymatcher#PyMatch' }
let g:ctrlp_use_caching = 0
" ==== End CtrlP settings ====
"
" ==== Easymotion settings ====
" Disable default easymotion mappings
let g:EasyMotion_do_mapping = 0
" Turn on case insensitive feature
let g:EasyMotion_smartcase = 1
nmap <leader>s <Plug>(easymotion-s)
vmap <leader>s <Plug>(easymotion-s)
" ==== End Easymotion settings ====
"
" ==== hardtime settings ====
" Turn on hardtime
let g:hardtime_default_on = 0
" Allow different movement key
let g:hardtime_allow_different_key = 1
" Max 3 of the same movement allowed at a time
let g:hardtime_maxcount = 3
" ==== End hardtime settings ====
"
" ==== rooter settings ====
let g:rooter_silent_chdir=1
let g:rooter_patterns = ['composer.json', 'Vagrantfile', '.git/']
" ==== End rooter settings ====
"
" ==== PreserveNoEOL settings ====
let g:PreserveNoEOL=0
" ==== End Preserver NoEOL settings ====

nnoremap <F9> :SnipBar<CR>

" ==== tagbar settings ====
" Open tagbar with F8
nnoremap <F8> :TagbarToggle<CR>
" Location of phpctags bin
let g:tagbar_phpctags_bin='~/.vim/phpctags'
" ==== End tagbar settings ====
"
" ==== gutentags settings ====
" Exclude css, html, js files from generating tag files
let g:gutentags_ctags_exclude = ['*.css', '*.html', '*.js', '*.json', '*.xml',
                            \ '*.phar', '*.ini', '*.rst', '*.md',
                            \ '*vendor/*/test*',
                            \ '*vendor/*/fixture*', '*vendor/*/Fixture*',
                            \ '*var/cache*', '*var/log*']
" Where to store tag files
let g:gutentags_cache_dir = '~/.vim/gutentags'
let g:gutentags_project_root = ['composer.lock']
" ==== End gutentags settings ====
"
let g:ale_linters = {
\   'php': ['phpstan'],
\}
let g:ale_lint_on_save = 1
let g:ale_lint_on_text_changed = 0
let g:ale_php_phpstan_configuration = 'phpstan.neon'
" Show cursorline for the active buffer
" Hide cursorline for inactive buffers
augroup ALELint
    au!
    au VimEnter,WinEnter,BufWinEnter * ALELint
augroup End
nmap <silent> <leader>ap :ALEPreviousWrap<cr>
nmap <silent> <leader>an :ALENextWrap<cr>

" ==== lightline settings ====
let g:lightline = {
    \ 'active': {
    \   'left': [['mode'], ['readonly', 'filename', 'modified'], ['tagbar', 'ale', 'gutentags']],
    \   'right': [['lineinfo'], ['filetype']]
    \ },
    \ 'inactive': {
    \   'left': [['absolutepath']],
    \   'right': [['lineinfo'], ['filetype']]
    \ },
    \ 'component': {
    \   'lineinfo': '%l\%L [%p%%], %c, %n',
    \   'tagbar': '%{tagbar#currenttag("[%s]", "", "f")}',
    \   'ale': '%{ale#statusline#Status()}',
    \   'gutentags': '%{gutentags#statusline("[Generating...]")}'
    \ },
    \ }
" ==== End lightline settings ====
"
" ==== UltiSnips settings ====
let g:UltiSnipsExpandTrigger = "<tab>"
" $HOME.'/.vim/UltiSnips' load as last
let g:UltiSnipsSnippetDirectories = [
    \ $HOME.'/.vim/bundle/sniphpets',
    \ $HOME.'/.vim/bundle/sniphpets-common/UltiSnips',
    \ $HOME.'/.vim/bundle/sniphpets-symfony/UltiSnips',
    \ $HOME.'/.vim/bundle/vim-snippets/UltiSnips'
    \ ]

" ==== End UltiSnips settings ====
"
" ==== vim side search settings ====
let g:side_search_prg = 'ag --word-regexp --heading --stats -B 1 -A 4 --ignore="*.js"'
let g:side_search_splitter = 'vnew'
let g:side_search_split_pct = 0.5
nnoremap <leader>gw :SideSearch <C-r><C-w><CR> | wincmd p
cabbrev SS SideSearch
" ==== End vim side search settings ====
"
" ==== vim-php-namespace settings ====
function! IPhpInsertUse()
    call PhpInsertUse()
    call feedkeys('a',  'n')
endfunction
autocmd FileType php inoremap <Leader>pnu <Esc>:call IPhpInsertUse()<CR>
autocmd FileType php noremap <Leader>pnu :call PhpInsertUse()<CR>
function! IPhpExpandClass()
    call PhpExpandClass()
    call feedkeys('a', 'n')
endfunction
autocmd FileType php inoremap <Leader>pne <Esc>:call IPhpExpandClass()<CR>
autocmd FileType php noremap <Leader>pne :call PhpExpandClass()<CR>
autocmd FileType php inoremap <Leader>pns <Esc>:call PhpSortUse()<CR>
autocmd FileType php noremap <Leader>pns :call PhpSortUse()<CR>
let g:php_namespace_sort_after_insert=1
" ==== End vim-php-namespace settings ====

" ==== End plugin settings ====

" ==== Automatic ====
" Automatically change cwd to the directory of the file in the current buffer
autocmd BufEnter * silent! lcd %:p:h

" Set file types for some of the PHP related extensions
autocmd BufNewFile,BufRead *.inc set ft=php
autocmd BufNewFile,BufRead *.phtml set ft=phtml
autocmd BufNewFile,BufRead *.tpl set ft=phtml

" since installing vim-indent-object
" PHP block comments got broken
" this whatever is fixes it
" looks like this is not needed anymore
" granted, not using vim-indent-object
" au FileType php setlocal comments=s1:/*,mb:*,ex:*/,://,:#
" au FileType php setlocal formatoptions+=cro

autocmd BufNewFile,BufRead *.xsd set ft=xml
"let g:xml_syntax_folding=0
"au FileType xml setlocal foldmethod=syntax

au BufRead,BufNewFile *.twig set ft=html.twig
" ==== End automatic ====

" ==== Custom functions ====
function! FixSyntax()
    " nmap <silent> <leader><leader>fs :syntax sync fromstart<cr>
    syntax sync fromstart
endfun

function! OpenTestFile()
    let b:file = expand("%:p:r")
    let b:root_dir = getbufvar('%', 'rootDir')
    let b:tests_dir = b:root_dir . "/tests"
    let b:test_file = substitute(b:file, b:root_dir, b:tests_dir, "") . "Test.php"
    exe ":vsp " b:test_file
endfun

function! OpenTestMethodFile()
    let b:file = expand("%:p:r")
    let b:root_dir = getbufvar('%', 'rootDir')
    let b:tests_dir = b:root_dir . "/tests"
    let b:class_test_dir = substitute(b:file, b:root_dir, b:tests_dir, "")
    let b:current_method = substitute(tagbar#currenttag('%s',''), '\(^.\)', '\u&', 'g')
    if !isdirectory(b:class_test_dir)
        call mkdir(b:class_test_dir, 'p')
    endif
    let b:test_file = b:class_test_dir . "/" . b:current_method . "Test.php"
    exe ":vsp " b:test_file
endfun

function! CopyPasteMethodBody(from_line, to_line)
    execute a:from_line
    normal! yiB
    execute a:to_line
    normal! p
endfun

function! IndentHtmlFile()
    set ft=html
    normal! ggVG=<cr>
    set ft=php
endfun

function! SectionLink()
    exe "normal! ^wi[\elv$hyA](#)\ePvibu"
endfun

function! CreateNamespace()
    let b:file = expand("%:p:h")
    let b:root_dir = getbufvar('%', 'rootDir')
    let b:class = substitute(b:file, b:root_dir . '/src', '', "")
    let b:namespace = substitute(b:class, '/', '\\', 'g')
    let b:namespace = substitute(b:namespace, '\\', '', '')
    exe "normal! Inamespace " . b:namespace . ";"
endfun

function! RenameAreaToIndustry()
    exe "%s/Areas/Industries/g"
    exe "%s/areas/industries/g"
    exe "%s/Area/Industry/g"
    exe "%s/area/industry/g"
endfun

"function! CreatePHPClass(name)
"    let b:root_dir = getbufvar('%', 'rootDir')
"    let b:file_path = b:root_dir . "/src/" . a:name . ".php"
"    let b:last_slash = strridx(a:name, '/')
"    let b:class_name = strcharpart(a:name, b:last_slash + 1)
"    let b:namespace = strcharpart(substitute(a:name, '/', '\\', 'g'), 0, b:last_slash)
"    let l:lines = ['<?php', 'declare(strict_types=1);', '', 'namespace ' . b:namespace . ';', '', 'class ' . b:class_name, '{', '}']
"    call writefile(l:lines, b:file_path)
"    exe "e " . b:file_path
"endfun

" ==== End custom functions ====

" ==== Remappings ====
" edit .vimrc
nmap <silent> <leader>vev :e $MYVIMRC<cr>
" source .vimrc
nmap <silent> <leader>vsv :so $MYVIMRC<cr>

" check with ctrl+l the current file for php syntax errors
autocmd FileType php noremap <C-l> :!/usr/bin/php -l %<cr>

" Swap the current line and the line below
nmap <leader>clb dd:pu<cr>
" Swap the current line and the line above
nmap <leader>cla ddkP<cr>

" Fix indent in curly Braces
noremap <leader>fiB viB=<cr>k
" Fix indent in [square braces
noremap <leader>fi[ vi[j=<cr>k

" Call OpenTestFile() custom function
nnoremap <leader>otf :call OpenTestFile()<cr>
nnoremap <leader>otmf :call OpenTestMethodFile()<cr>

" Highlight word under cursor
nnoremap <silent> <Leader>* :let @/='\<<C-R>=expand("<cword>")<CR>\>'<CR>:set hls<CR>

" Indent with Alt-I, deindent with Alt-D, I keep fatfingering > and <
" Have to go with alt to not mess up builtin ctrl-i and ctrl-d behaviour
nmap <A-i> >>
nmap <A-d> <<
vmap <A-i> >
vmap <A-d> <
imap <A-i> <C-i>
imap <A-d> <C-d>

" Swap current and next variable
"nnoremap <silent> <Leader>vs 2wdw2bPa, <ESC>2wx

inoremap <C-c> ::class<Esc>3b :call PhpInsertUse()<CR>
" ==== End remappings ====
