let $LD_LIBRARY_PATH="/home/utils/icu4c-58.2/lib"
"{{{autoinstall vim-plug 


"if empty(glob($XDG_CONFIG_HOME."/autoload/plug.vim"))
if empty(glob(fnamemodify(expand("$MYVIMRC"), ":p:h")."/autoload/plug.vim"))
    silent !curl -fLo $XDG_CONFIG_HOME/nvim/autoload/plug.vim --create-dirs
                \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
endif
"}}}

set rtp+=/home/eash/.linuxbrew/opt/fzf
"Add your bundles here
"General bundles here {{{
call plug#begin(fnamemodify(expand("$MYVIMRC"),":p:h").'/nvim/bundle')
" Plug 'benekastah/neomake'
Plug 'dense-analysis/ale'
" Plug 'godlygeek/tabular', { 'on': 'Tabularize'}
"file modification commands, like Unlink, Move
Plug 'tpope/vim-eunuch', { 'on' : [ 'Rename', 'Unlink', 'Move', 'Remove', 'Chmod', 'Mkdir', 'Find','Locate','Wall','SudoWrite','SudoEdit']}

Plug 'tpope/vim-fugitive', {'augroup' : 'fugitive'}
Plug 'machakann/vim-sandwich'
"$ to prevent unintend operation
nmap s <Nop>
xmap s <Nop>

Plug 'tpope/vim-dispatch'
"should bundle menu
" NeoBundle 'mbadran/headlights'

"new Filetypes {{{
Plug 'cazador481/vim-nfo'
"Plug 'cazador481/vim-systemc', {'for' : ['c', 'cpp']}
"}}}
Plug 'tpope/vim-repeat'
Plug 'tomtom/tcomment_vim'
"TMUX {{{
"TODO check for TMUX env set to enable
if !empty($TMUX)
    Plug 'brauner/vimtux'
    Plug 'christoomey/vim-tmux-navigator'
    " Disable tmux navigator when zooming the Vim pane
    let g:tmux_navigator_disable_when_zoomed = 1
    Plug 'tmux-plugins/vim-tmux-focus-events'
    Plug 'tmux-plugins/vim-tmux'


    " update display environment and SSH env variables
    function! Tmux_display()
        let $DISPLAY=systemlist("tmux show-environment DISPLAY|cut -d'=' -f 2")[0]
        let $SSH_CLIENT=systemlist("tmux show-environment SSH_CLIENT|cut -d'=' -f 2")[0]
        let $SSH_CONNECTION=systemlist("tmux show-environment SSH_CONNECTION|cut -d'=' -f 2")[0]
    endfunc

    augroup TMUX_DISPLAY_GROUP
        au!
        autocmd FocusGained * call Tmux_display()
    augroup end

endif
"}}}

" NeoBundle 'http://github.com/vim-scripts/taglist.vim'
Plug 'ap/vim-buftabline'
" Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'
"NeoBundle 'http://github.com/nathanaelkane/vim-indent-guides.git'
Plug 'perrywky/vim-matchit'

Plug 'derekwyatt/vim-protodef', { 'for': ['c', 'cpp', 'h']}
" NeoBundle 'http://github.com/vim-scripts/FSwitch'
Plug 'kana/vim-textobj-user'
Plug 'kana/vim-textobj-function'
Plug 'pbs/vim-textobj-python'
Plug 'thinca/vim-textobj-function-perl' , {'for': 'perl'} " perl text object
Plug 'glts/vim-textobj-comment'
Plug 'vimtaku/vim-textobj-sigil'
Plug 'paulhybryant/vim-textobj-path'

Plug 'xolox/vim-misc'
Plug 'xolox/vim-reload', {'for': 'vim'}

Plug 'vim-scripts/dbext.vim', { 'for' : 'sql'}

"NeoBundle 'vim-scripts/octave.vim--'
"Better diff handling
"Plug 'chrisbra/vim-diff-enhanced'
Plug 'Shougo/context_filetype.vim' " perlomni needs
"Plug 'Shougo/deoplete.nvim' " #, {'on_i': 1}
"Plug 'zchee/deoplete-zsh', {'for': 'zsh'}
if !empty($TMUX)
    Plug 'wellle/tmux-complete.vim'
endif

Plug 'Shougo/neco-syntax'
Plug 'Shougo/neco-vim'
Plug 'neoclide/coc-neco'
" NeoBundle 'Shougo/neoinclude'
"}}}
"
"{{{ Python budles
" NeoBundle 'zchee/deoplete-jedi', { 'for' : 'python'}
" Plug 'klen/python-mode', { 'for' : 'python'}
let g:pymode_rope_completion=0
let g:pymode_rope_completion_on_dot=0
" Plug 'ambv/black', {'for': 'python'}
Plug 'tmhedberg/SimpylFold'
Plug 'numirias/semshi', {'do': ':UpdateRemotePlugins'}
" Plug 'vim-python/python-syntax'
let g:python_highlight_all=1
Plug 'kalekundert/vim-coiled-snake'
"}}}
Plug 'airblade/vim-rooter' " finds the root dir
"
"perl bundles {{{
"Plug 'https://raw.githubusercontent.com/thoughtstream/Damian-Conway-s-Vim-Setup/master/plugin/trackperlvars.vim', {'for': 'perl', 'type' : 'raw' ,'script_type' : 'plugin'}
Plug 'vim-perl/vim-perl', {'for': 'perl'}

"deoplete perl omni completion, better than anything out there at themoment, still a little flaky
Plug 'cazador481/perlomni.vim', {'for': 'perl'}

Plug 'catalinciurea/perl-nextmethod', {'for': 'perl'} "enables [M, [m, ]M,]m
"NeoBundle 'http://github.com/cazador481/vim-cute-perl.git'
"}}}

"{{{color schemes
Plug 'cazador481/ea_color'
Plug 'NLKNguyen/papercolor-theme'
let g:PaperColor_Theme_Options = { 
            \    'language' : { 'python' : { 'highlight_builtins' : 1 } } ,
            \    'theme': { 'default': { 'transparent_background':1 } }
            \ }
" NeoBundle 'tpope/vim-vividchalk'
" NeoBundle 'chriskempson/vim-tomorrow-theme'
" NeoBundle 'godlygeek/csapprox'
" NeoBundle 'sjl/badwolf'
" NeoBundle 'w0ng/vim-hybrid'
"}}}

Plug 'avakhov/vim-yaml', {'for': 'yaml'}
Plug 'cespare/vim-toml'
Plug 'wellle/targets.vim' " additional  text objects
Plug 'tpope/vim-obsession'
"Plug 'theevocater/vim-perforce'
Plug 'sjl/splice.vim'      , {'on': 'SpliceInit'}

Plug 'junegunn/fzf'
Plug 'junegunn/fzf.vim'        , {'on' : ['Files'     , 'Buffers', 'Lines','Ag', 'Tags']}

Plug 'jiangmiao/auto-pairs'
Plug 'embear/vim-localvimrc'

Plug 'triglav/vim-visual-increment'

let g:localvimrc_ask=0
let g:localvimrc_whitelist=['/home/eash/.*','/home/scratch.eash/.*']
let g:localvimrc_sandbox=0

Plug 'neoclide/coc.nvim', {'branch': 'release'}
" shows what the hi is under the cursor
Plug 'kergoth/vim-hilinks', {'on' : ['HLTm']}
"Plug 'vim-vdedebug/vdebug'
Plug 'puremourning/vimspector'
Plug 'vim-test/vim-test'
call plug#end()

set exrc
filetype plugin indent on

set visualbell
set termguicolors
set tags+=tags
set clipboard^=unnamedplus "uses x-11 clipboard, stores in middle mouse
set ruler " shows column, line number location 
set cmdheight=2
set backspace=2 "make backspace work normal
set showmatch
set scrolloff=10
set number
set smartcase

set equalalways

set isfname-==
"{{{ # diff settings
"set diffopt+=internal,algorithm:histogram
"set diffopt+=icase " ignores case
"set diffopt+=filler " create filler lines
"}}}
set laststatus=2
set suffixesadd+=.gz
set hidden "allows buffers to be hidden while having unsaved changes
set nohlsearch  "turns off hlsearch, make default like vim
set noincsearch
set sidescroll=1 " scrolls by one when you go left on no wordwrap
set linebreak " this causes the wrapping to happen at the word boundary 
set timeoutlen=300  " How mutch to wait after leaderkey to timeout
"{{{general things to speed up vim
set lazyredraw
set synmaxcol=255 " syntax coloring long lines slows down the word

" you will have a bad experinece for diagnostic messages when it's default 4000
set updatetime=300
"}}}

"{{{ # color settings
set background=dark
color PaperColor
"}}}

"{{{ highlight extra spaces
highlight RedundantSpaces ctermbg=red guibg=red
match RedundantSpaces /\s\+$/
"}}}
map <S-Enter> O<ESC>
map <Enter> o<Esc>

"undo file {{{
set undofile

if !empty($XDG_CACHE_HOME)
    call mkdir($XDG_CACHE_HOME. "/nvim/undodir", "p", 0700)
    set undodir=$XDG_CACHE_HOME/nvim/undodir
endif
"}}}

"indent {{{
set tabstop=4
set shiftwidth=4
set softtabstop=4
set expandtab
set copyindent
set autoindent
"}}}

"folding {{{
" set fdo +=jump " Enable opening of folds always
" set fdo +=insert

set foldenable
set foldmethod=syntax
"}}}

set wildmenu
set wildmode=list:longest,full
set mouse=a "enables mouse mode in console
set hidden

"Get completion to work sanely {{{
"inoremap <expr> <cr> pumvisible() ? "\<c-y>" : "\<c-g>u\<cr>"
inoremap <expr> <c-n> pumvisible() ? "\<lt>c-n>" : "\<lt>c-n>\<lt>c-r>=pumvisible() ? \"\\<lt>down>\" : \"\"\<lt>cr>" 
inoremap <expr> <m-;> pumvisible() ? "\<lt>c-n>" : "\<lt>c-x>\<lt>c-o>\<lt>c-n>\<lt>c-p>\<lt>c-r>=pumvisible() ? \"\\<lt>down>\" : \"\"\<lt>cr>"
set completeopt=menuone,noinsert,noselect
" set completeopt=longest,menuone
"}}}

"terminal configuration {{{
if has('nvim')
    augroup TerminalStuff
        "Clear old autocommands 
        au!
        autocmd TermOpen * setlocal nonumber norelativenumber
    augroup END
endif

"}}}

"temp directory {{{ 
if ! has('nvim')
    if has("unix")
        set dir=/tmp "sets the temp directory for swap files
    else
        set dir=$TEMP
    endif
endif
"}}}

" {{{ ultisnips

let g:UltiSnipSnippetsDir=$XDG_CONFIG_HOME."/nvim/UltiSnips"
let g:UltiSnipsExpandTrigger="<c-f>"
let g:UltiSnipsJumpForwardTrigger="<c-j>"
let g:UltiSnipsJumpBackwardTrigger="<c-k>"
let g:UltiSnipsEditSplit="vertical"
let g:ultisnips_python_stype="google"

"}}}

"indent_guides {{{
let g:indent_guides_start=1
let g:indent_guides_guide_size=1
let g:indent_guides_enable_on_vim_startup=1
"}}}

"{{{ deoplete

let g:deoplete#enable_profile = 0
let g:deoplete#enable_at_startup = 0
"call deoplete#enable_logging("DEBUG","/tmp/deoplete.log")
let g:deocomplete#auto_completion_start_length = 0
let g:deocomplete#auto_complete_delay = 100
let g:deoplete#ignore_sources={}
let g:deoplete#ignore_sources._=['omni'] "disable omni source
" <C-h>, <BS>: close popup and delete backword char.
" inoremap <expr><C-h> deoplete#mappings#smart_close_popup()."\<C-h>"
" inoremap <expr><BS> deoplete#mappings#smart_close_popup()."\<C-h>"
" inoremap <expr><TAB>  pumvisible() ? "\<Down>" : "\<C-x>\<C-u>"
" For smart TAB completion.
" inoremap <expr><TAB>  pumvisible() ? "\<C-n>" :
"         \ <SID>check_back_space() ? "\<TAB>" :
"         \ deoplete#mappings#manual_complete()
"
function! s:check_back_space() abort"{{{
    let col = col('.') - 1
    return !col || getline('.')[col - 1]  =~ '\s'
endfunction"}}}
"}}}

"quick saving {{{
nmap <silent> <Leader>w :update<CR>
"}}}

"black hole mapping {{{
"#to delete text object, put type text object shortcut after command
nmap <leader>d "_d"
"}}}

"{{{ arrow key to buffer map
nnoremap <C-LEFT> :bp<CR>
nnoremap <C-RIGHT> :bn<CR>
"}}}

"{{{ middle mouse map
noremap <S-Insert> <MiddleMouse>
noremap! <S-Insert> <MiddleMouse>
noremap <C-S-Insert> <MiddleMouse>
noremap! <C-S-Insert> <MiddleMouse>
"}}}

"{{{ use silver search
let g:unite_source_rec_async_command= ['ag', '--nocolor', '--nogroup','-g', '']
if executable("ag")
    set grepprg=ag\ --nogroup\ --nocolor\ 
    let g:unite_source_rec_async_command= ['ag', '--nocolor', '--nogroup','-g', '']
endif "}}}

"{{{a vim-buftabline
let g:buftabline_numbers=1 " enable numbering
"}}}

let g:sql_type_default='mysql'

"{{{ dbext.vim
let g:dbext_default_profile_fullchip_ro= 'type=MYSQL:user=fullchipsims_ro:passwd=CB2ea79!:dbname=gpu_fullchip_sims:host=gpu-db-gpufullchipsims-read'
let g:dbext_default_profile_fullchip_dev= 'type=MYSQL:user=fullchipsims_dev:passwd=dev:dbname=GPUFullchipSims:host=gpu-db-gpufullchipsims-dev'
let g:dbext_default_profile_golden_dev= 'type=MYSQL:user=goldecl_usr:passwd=iMsTj6Fe:dbname=GoldenCl:host=gpu-db-goldencl-dev'
let g:dbext_default_profile_golden_prod= 'type=MYSQL:user=goldecl_usr:passwd=IcTPA73w:dbname=GoldenCl:host=gpu-db-goldencl-write'

"}}}

autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o "Makes copying and pasting using mosh work better


"{{{ Ale
let g:ale_lint_on_insert_leave = 1
let g:ale_lint_on_enter = 1
let g:ale_disable_lsp = 1
let g:ale_open_list = 1
let g:ale_keep_list_window_open = 0
let g:ale_linters={ 'perl':['perl','perlcritic'], 'python':[] }
let g:ale_fixers ={'perl':['perltidy']}
let g:ale_use_virtualenv_dir_names = ['.venv']
""}}}


augroup CloseLoclistWindowGroup "{{{ automatically close LocList on buffer close
    autocmd!
    autocmd QuitPre * if empty(&buftype) | lclose | endif
augroup END
"}}}

"{{{makes jk go by line, except when proceded by number
function! LineMotion(dir)
    execute "normal! " . (v:count1 > 1 ? "m'" . v:count1 : "g") . a:dir
endfunction

nnoremap <silent> j :<c-u>call LineMotion("j")<cr>
nnoremap <silent> k :<c-u>call LineMotion("k")<cr>
"}}}

" if neobundle#tap('vim-rooter') "{{{
let g:rooter_patterns = ['dist.ini', 'TOT', '.git', '.git/', '.p4config', 'Makefile']
let g:rooter_cd_cmd="lcd"
" endif "}}}

"{{{ DiffOrig
" Convenient command to see the difference between the current buffer and the
" file it was loaded from, thus the changes you made.
" Only define it when not defined already.
if !exists(":DiffOrig")
    command DiffOrig vert new | set bt=nofile | r ++edit # | 0d_ | diffthis
                \ | wincmd p | diffthis
endif
"}}}

command! -nargs=* Perldoc call Perldoc(<f-args>) 
function! Perldoc(...)

    if !exists("a:1")
        call Perldoc(expand('<cword>'))
    else
        let tmp=tempname()
        let method=a:1
        call system("nv_perldoc -onroff -d ".tmp." ".method)
        if (v:shell_error)
            echom "Could not find docs for ".method
            return
        endif
        " silent exec "!nv_perldoc -onroff -d ".tmp a:Method
        exec "Man ".tmp
        exec "file man://".method
        call delete(tmp)
        set buflisted
        setlocal keywordprg=:Perldoc
    endif

endfunc

"{{{=====[ Emphasize typical mistakes in Vim and Perl files ]=========

" Add a new high-visibility highlight combination...
highlight WHITE_ON_RED    ctermfg=white  ctermbg=red

" Emphasize undereferenced references...
call matchadd('WHITE_ON_RED', '_ref[ ]*[[{(]\|_ref[ ]*-[^>]')

" Emphasize typical mistakes a Perl hacker makes in .vim files...
let g:VimMistakes
            \   =     '\_^\s*\zs\%(my\s\+\)\?\%(\k:\)\?\k\+\%(\[.\{-}\]\)\?\s*[+-.]\?=[=>~]\@!'
            \   . '\|'
            \   .     '\_^\s*\zselsif'
            \   . '\|'
            \   .     ';\s*\_$'
            \   . '\|'
            \   .     '\_^\s*\zs#.*'
            \   . '\|'
            \   .     '\_^\s*\zs\k\+('

let g:VimMistakesID = 668
augroup VimMistakes
    autocmd!
    autocmd BufEnter  *.vim,*.vimrc   call VimMistakes_AddMatch()
    autocmd BufLeave  *.vim,*.vimrc   call VimMistakes_ClearMatch()
augroup END

function! VimMistakes_AddMatch ()
    try | call matchadd('WHITE_ON_RED',g:VimMistakes,10,g:VimMistakesID) | catch | endtry
endfunction

function! VimMistakes_ClearMatch ()
    try | call matchdelete(g:VimMistakesID) | catch | endtry
endfunction
"}}}

"{{{ FZF
let $FZF_DEFAULT_COMMAND = 'ag -g ""'
"}}}

"{{{ Self defined file types
au BufRead,BufNewFile *.asb set filetype=asb
"text template
au BufNewFile,BufRead *.tt setf tt2
"git description
au BufNewFile,BufRead EDIT_DESCRIPTION set filetype=conf
au BufNewFile,BufRead EDIT_DESCRIPTION setlocal spell spelllang=en_us
"}}}

"{{{ Python paths for work
if filereadable('/home/utils/Python-2.7.9/bin/python') 
    let g:python_host_prog='/home/utils/Python-2.7.9/bin/python'
    let g:python3_host_prog='/home/utils/Python-3.7.3/bin/python3'
    " let g:python3_host_prog='/home/utils/Python-3.8.0/bin/python3'
    let g:deoplete#sources#jedi#python_path=g:python3_host_prog
endif
"}}}

function! PerlCurrentSubName() "{{{
    let s:currline = line('.')
    let s:currcol = col('.')
    normal $ 
    let [s:line, s:column] = searchpos('^\s*sub\s\+\zs\(\w\+\)','bcW')
    if (s:line != 0)
        let s:subname = expand('')
    else
        let s:subname = '(not in sub)'
    endif

    call cursor(s:currline, s:currcol)
    echo s:subname
    return s:subname
endfunction
"}}}

if has ('nvim')
    let $VISUAL='nvr -cc split --remote-wait'
endif

" Deal with the case when i hit :W by accident
command! W w
command! Bd bufdo :bd

"{{{ coc mapping
"	makes `<leader>p` format the visually selected range, and you can use `<leader>pap` to format a paragraph.
vmap <leader>p  <Plug>(coc-format-selected)
nmap <leader>p  <Plug>(coc-format-selected)
nmap <leader>rn <Plug>(coc-rename)

" GoTo code navigation
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" show sigantures after jump
autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')

command! -nargs=0 Format :call My_format()

function! My_format()
    :AleFix
    " :call CocAction('format')
    " :call CocAction('runCommand', 'editor.action.organizeImport')
endfunction

" Use tab for trigger completion with characters ahead and navigate.
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config.
inoremap <silent><expr> <TAB>
            \ pumvisible() ? "\<C-n>" :
            \ coc#expandableOrJumpable() ? "\<C-r>=coc#rpc#request('doKeymap', ['snippets-expand-jump',''])\<CR>" :
            \ <SID>check_back_space() ? "\<TAB>" :
            \ coc#refresh()
let g:coc_snippet_next = '<tab>'
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"
" Use <c-space> to trigger completion.
inoremap <silent><expr> <c-space> coc#refresh()

" Use <cr> to confirm completion, `<C-g>u` means break undo chain at current
" position. Coc only does snippet and additional edit on confirm.
if exists('*complete_info')
    inoremap <expr> <cr> complete_info()["selected"] != "-1" ? "\<C-y>" : "\<C-g>u\<CR>"
else
    imap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
endif
"{{{ Use K to show documentation in preview window.
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
    if (index(['vim','help'], &filetype) >= 0)
        execute 'h '.expand('<cword>')
    else
        call CocAction('doHover')
    endif
endfunction

"}}}


"}}}

"{{{Coc extensions
" call coc#add_extension('coc-ultisnips')
call coc#add_extension('coc-snippets')
" call coc#add_extension('coc-syntax`')
call coc#add_extension('coc-dictionary')
call coc#add_extension('coc-json')
call coc#add_extension('coc-python')
call coc#add_extension('coc-vimlsp')
call coc#add_extension('coc-explorer')

""}}}
"{{{ make coc-explorer open on e
" https://github.com/weirongxu/coc-explorer/issues/89#issuecomment-606374700
augroup MyCocExplorer
    autocmd!
    autocmd VimEnter * sil! au! FileExplorer *
    autocmd BufEnter * let d = expand('%') | if isdirectory(d) | bd | exe 'CocCommand explorer ' . d | endif
augroup END
"}}}

" In the quickfix window, <CR> is used to jump to the error under the
" cursor, so undefine the mapping there.
autocmd BufReadPost quickfix nnoremap <buffer> <CR> <CR>

"{{{status line
set statusline =
set statusline+=%f
set statusline+=\ %{FugitiveStatusline()}
set statusline+=\ %{coc#status()}
" }}}

"{{{ # ignore terminal buffers hwne doing bnext, bprevious
" https://vi.stackexchange.com/a/16709
augroup termIgnore
    autocmd!
    autocmd TermOpen * set nobuflisted
augroup end


"}}}
"{{{test-vim
let g:test#preserve_screen = 1
let test#neovim#term_position='left'
"}}}
" vim: set fdm=marker:
