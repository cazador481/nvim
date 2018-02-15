"autoinstall neobundle {{{


let g:neobundle#types#git#default_protocol='https'
let iCanHazBundle=1
if (empty($XDG_CONFIG_HOME))
    let bundle_path=expand('~').'/.config/nvim/bundle'
else
    let bundle_path=$XDG_CONFIG_HOME.'/nvim/bundle'
endif

let bundle_readme=bundle_path."/neobundle/README.md"
" let bundle_readme=expand('~/.nvim/bundle/neobundle/README.md')
if !filereadable(bundle_readme)

    echo "Installing Neobundle.."
    echo ""
    if has("unix")
        silent execute '!mkdir -p ' . bundle_path
        silent execute '!git clone https://github.com/Shougo/neobundle.vim.git ' . bundle_path. '/neobundle'
    elseif (match(hostname(),"ELASH1-MOBL") >=0)
        silent !mkdir /home/elash1/.nvim/bundle
        silent !git clone https://github.com/Shougo/neobundle.vim.git /home/elash1/.nvim/bundle/neobundle
    else
        silent !mkdir c:\home\eddie\.vim\bundle
        silent !git clone https://github.com/Shougo/neobundle.vim.git \home\eddie\.vim\bundle\neobundle
    endif
    let iCanHazBundle=0
endif
execute 'set rtp+='.bundle_path.'/neobundle'
set rtp+=/home/eash/.linuxbrew/opt/fzf
call neobundle#begin(bundle_path)
"}}}
NeoBundleFetch 'Shougo/neobundle'
"Add your bundles here
"General bundles here {{{
NeoBundle 'benekastah/neomake'
NeoBundle 'godlygeek/tabular', { 'on_cmd': 'Tabularize'}
"file modification commands, like Unlink, Move
NeoBundle 'tpope/vim-eunuch', { 'on_cmd' : [ 'Rename', 'Unlink', 'Move', 'Remove', 'Chmod', 'Mkdir', 'Find','Locate','Wall','SudoWrite','SudoEdit']}

NeoBundle 'tpope/vim-fugitive', {'augroup' : 'fugitive'}
NeoBundle 'tpope/vim-surround'
NeoBundle 'tpope/vim-dispatch'
"should bundle menu
" NeoBundle 'mbadran/headlights'

"new Filetypes {{{
NeoBundle 'cazador481/vim-nfo'
NeoBundle 'cazador481/vim-systemc', {'on_ft' : ['c', 'cpp']}
"}}}
NeoBundle 'tpope/vim-repeat'
NeoBundle 'tomtom/tcomment_vim'
"TMUX {{{
"TODO check for TMUX env set to enable
NeoBundleLazy 'brauner/vimtux'
NeoBundleLazy 'christoomey/vim-tmux-navigator'
NeoBundleLazy 'tmux-plugins/vim-tmux-focus-events'
NeoBundle 'tmux-plugins/vim-tmux'

if !empty($TMUX)
    NeoBundleSource vimtux
    NeoBundleSource vim-tmux-navigator
    NeoBundleSource vim-tmux-focus-events

    " update display environment
    function! Tmux_display()
        let $DISPLAY=systemlist("tmux show-environment DISPLAY|cut -d'=' -f 2")[0]
    endfunc

    augroup TMUX_DISPLAY_GROUP
        au!
        autocmd FocusGained * call Tmux_display()
    augroup end

endif
"}}}

" NeoBundle 'http://github.com/vim-scripts/taglist.vim'
NeoBundle 'ap/vim-buftabline'
NeoBundle 'SirVer/ultisnips'
"NeoBundle 'http://github.com/nathanaelkane/vim-indent-guides.git'
NeoBundle 'perrywky/vim-matchit'
NeoBundle 'kurkale6ka/vim-pairs'
NeoBundle 'derekwyatt/vim-protodef', { 'on_ft': ['c', 'cpp', 'h']}
" NeoBundle 'http://github.com/vim-scripts/FSwitch'
NeoBundle 'kana/vim-textobj-user'
NeoBundle 'thinca/vim-textobj-function-perl' , {'depends': 'kana/vim-textobj-function','on_ft': 'perl'} " perl text object
NeoBundle 'vimtaku/vim-textobj-sigil'        , {'depends': 'kana/vim-textobj-user'}
NeoBundle 'paulhybryant/vim-textobj-path'    , {'depends': 'kana/vim-textobj-user'}
NeoBundleLazy 'xolox/vim-reload'             , {'depends': 'xolox/vim-misc' }
autocmd FileType vim NeoBundleSource vim-reload
" NeoBundle 'mattn/gist-vim', {'depends' : 'mattn/webapi-vim' }

NeoBundle 'vim-scripts/dbext.vim', { 'on_ft' : 'sql'}


"
" NeoBundle 'luochen1990/rainbow'
NeoBundle 'Shougo/vimproc', {
\ 'build'       : {
\     'windows' : 'make -f make_mingw32.mak',
\     'cygwin'  : 'make -f make_cygwin.mak',
\     'mac'     : 'make -f make_mac.mak',
\     'unix'    : 'make -f make_unix.mak',
\    }, }
"NeoBundle 'vim-scripts/octave.vim--'
"Better diff handling
NeoBundle 'chrisbra/vim-diff-enhanced'
NeoBundle 'Shougo/context_filetype.vim' " perlomni needs
NeoBundle 'Shougo/deoplete.nvim', {'on_i': 1}
NeoBundle 'zchee/deoplete-zsh', {'on_ft': 'zsh'}
if !empty($TMUX)
    NeoBundle 'wellle/tmux-complete.vim'
endif

NeoBundle 'Shougo/neco-syntax'
NeoBundle 'Shougo/neco-vim'
" NeoBundle 'Shougo/neoinclude'
"}}}
"
"{{{ Python budles
NeoBundle 'zchee/deoplete-jedi', { 'on_ft' : 'python'}
NeoBundle 'klen/python-mode.git', { 'on_ft' : 'python'}
let g:pymode_rope_completion=0
let g:pymode_rope_completion_on_dot=0
"}}}
NeoBundle 'airblade/vim-rooter' " finds the root dir
"
"perl bundles {{{
NeoBundle 'https://raw.githubusercontent.com/thoughtstream/Damian-Conway-s-Vim-Setup/master/plugin/trackperlvars.vim', {'on_ft': 'perl', 'type' : 'raw' ,'script_type' : 'plugin'}
NeoBundle 'vim-perl/vim-perl', {'on_ft': 'perl'}

"deoplete perl omni completion, better than anything out there at themoment, still a little flaky
NeoBundle 'cazador481/perlomni.vim', {'on_ft': 'perl'}

NeoBundle 'catalinciurea/perl-nextmethod', {'on_ft': 'perl'} "enables [M, [m, ]M,]m
"NeoBundle 'http://github.com/cazador481/vim-cute-perl.git'
"}}}

"{{{color schemes
NeoBundle 'cazador481/ea_color'
" NeoBundle 'tpope/vim-vividchalk'
" NeoBundle 'chriskempson/vim-tomorrow-theme'
" NeoBundle 'godlygeek/csapprox'
" NeoBundle 'sjl/badwolf'
" NeoBundle 'w0ng/vim-hybrid'
"}}}

NeoBundle 'avakhov/vim-yaml', {'on_ft': 'yaml'}
NeoBundle 'wellle/targets.vim' " additional  text objects
NeoBundle 'tpope/vim-obsession'
"NeoBundle 'jszakmeister/vim-togglecursor'
NeoBundle 'theevocater/vim-perforce'
NeoBundle 'sjl/splice.vim.git'      , {'on_cmd': 'SpliceInit'}
NeoBundle 'vim-scripts/AnsiEsc.vim' , {'on_cmd': ['AnsiEsc'    , 'AnsiEsc!']} "evals ansi escape codes.
NeoBundle 'junegunn/fzf'
NeoBundle 'junegunn/fzf.vim'        , {'on_cmd' : ['Files'     , 'Buffers', 'Lines','Ag']}

NeoBundle 'jiangmiao/auto-pairs.git'
NeoBundle 'autozimu/LanguageClient-neovim'
NeoBundle 'embear/vim-localvimrc'
let g:localvimrc_ask=0
let g:localvimrc_whitelist=['/home/eash/.*','/home/scratch.eash/.*']
let g:localvimrc_sandbox=0

" shows what the hi is under the cursor
" NeoBundle 'kergoth/vim-hilinks'
call neobundle#end()
"
if neobundle#tap('neobundle')
    NeoBundleCheck
endif
set exrc
filetype plugin indent on

syntax on
if neobundle#is_installed('ea_color') "{{{
    color ea
endif "}}}
set visualbell
set termguicolors
set tags=tags
set clipboard^=unnamedplus "uses x-11 clipboard, stores in middle mouse
set ruler
set cmdheight=2
set backspace=2 "make backspace work normal
set showmatch
set so=10
set background=dark
set number
set ignorecase
set diffopt+=iwhite " ignores white space
set diffopt+=icase " ignores case
set diffopt+=filler " create filler lines
set diffexpr=DiffW()
function DiffW()
  let opt = ""
   if &diffopt =~ "icase"
     let opt = opt . "-i "
   endif
   if &diffopt =~ "iwhite"
     let opt = opt . "-w " " swapped vim's -b with -w
   endif
   silent execute "!diff -a --binary " . opt .
     \ v:fname_in . " " . v:fname_new .  " > " . v:fname_out
endfunction

set laststatus=2
set suffixesadd+=.gz
set hidden "allows buffers to be hidden while having unsaved changes
set nohlsearch  "turns off hlsearch, make default like vim
set noincsearch
set sidescroll=1 " scrolls by one when you go left on no wordwrap
if has('nvim')
    set ttimeoutlen =50
    set timeoutlen  =100
    set matchtime   =0
endif
"general things to speed up vim
set lazyredraw
set synmaxcol=255 " syntax coloring long lines slows down the word

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
set cindent
"}}}

"folding {{{
set fdo +=jump " Enable opening of folds always

set foldenable
set foldmethod=syntax
set wildmenu
set wildmode=list:longest,full
"}}}
set mouse=a "enables mouse mode in console

"Get completion to work sanely {{{
"inoremap <expr> <cr> pumvisible() ? "\<c-y>" : "\<c-g>u\<cr>"
inoremap <expr> <c-n> pumvisible() ? "\<lt>c-n>" : "\<lt>c-n>\<lt>c-r>=pumvisible() ? \"\\<lt>down>\" : \"\"\<lt>cr>" 
inoremap <expr> <m-;> pumvisible() ? "\<lt>c-n>" : "\<lt>c-x>\<lt>c-o>\<lt>c-n>\<lt>c-p>\<lt>c-r>=pumvisible() ? \"\\<lt>down>\" : \"\"\<lt>cr>"
set completeopt=menuone,noinsert,noselect
" set completeopt=longest,menuone
"}}}

"temp directory {{{ 
if has("unix")
    set dir=/tmp "sets the temp directory for swap files
else
    set dir=$TEMP
endif
"}}}

"{{{ remap meta keys for enhcomentify
"map <C-c> <M-c> 
"}}}

if neobundle#tap('ultisnips') " {{{
    let g:UltiSnipSnippetsDir=bundle_path."/UltiSnips"
    let g:UltiSnipsExpandTrigger="<c-f>"
    let g:UltiSnipsJumpForwardTrigger="<c-f>"
    let g:UltiSnipsJumpBackwardTrigger="<c-k>"
    let g:UltiSnipsEditSplit="vertical"

    " #ultisnips and unite {{{
    function! UltiSnipsCallUnite()
        Unite -start-insert -winheight=100 -immediately -no-empty ultisnips
        return ''
    endfunction

    inoremap <silent> <F12> <C-R>=(pumvisible()? "\<LT>C-E>":"")<CR><C-R>=UltiSnipsCallUnite()<CR>
    nnoremap <silent> <F12> a<C-R>=(pumvisible()? "\<LT>C-E>":"")<CR><C-R>=UltiSnipsCallUnite()<CR>
    "}}}
    "ultisnips causes neovim to crash
    let g:deoplete#ignore_sources = ['ultisnips']
endif
"}}}

if neobundle#tap('rainbow') "{{{
    let g:rainbow_active=1
endif
"}}}
"indent_guides {{{
let g:indent_guides_start=1
let g:indent_guides_guide_size=1
let g:indent_guides_enable_on_vim_startup=1
"}}}

" if has("multi_byte")  "{{{ 
        " if &termencoding == ""
            " let &termencoding = &encoding
"         endif
" endif "}}}

if neobundle#tap('unite.vim') "{{{
    call unite#filters#matcher_default#use(['matcher_fuzzy'])
    " noremap <C-p> :execute 'Unite -start-insert file_rec/async:'.unite#util#path2project_directory(findfile("TOT",getcwd().";"))<cr> 
    noremap <C-p> :execute 'Unite -start-insert file_rec/async:'<cr> 
    noremap <leader>b :Unite -start-insert buffer <cr>
    " let g:unite_source_grep_command = 'ag --ignore .build'
    let g:unite_source_grep_command = 'ag'
    let g:unite_source_grep_default_opts = '--line-numbers --nocolor --nogroup --smart-case'
    "let g_unite_source_file_rec_max_cache_files=0
    call unite#custom#source('file_rec,file_rec/async','max_candidates',0)
    call unite#custom#source('file_rec,file_rec/async','ignore_pattern','\.rel')
    "nnoremap <leader>fc :<C-u>Unite -start-insert -no-split -buffer-name=file_vcs file/vcs<CR> 
    "VCS file mapping 
    " show executed commmand
    " define shortcut so that I can use :Unite ack:g:some_method to search some_method from gem directory

    function! s:escape_visual(...) "{{{
        let escape = a:0 ? a:1 : ''
        normal `<
        let s = col('.') - 1
        normal `>
        let e = col('.') - 1
        let line = getline('.')
        let pat = line[s : e]
        return escape(pat, escape)
    endfunction"}}}
    function! s:visual_unite_input() "{{{
        return s:escape_visual(" ")
    endfunction"}}}
    function! s:visual_unite_arg() "{{{
        return s:escape_visual(' :\')
    endfunction"}}}
endif

"}}}

if neobundle#tap('deoplete.nvim') "{{{
    
    " call deoplete#enable_logging("DEBUG","/tmp/deoplete")
	let g:deoplete#enable_at_startup= 1
    let g:deocomplete#auto_completion_start_length=0
    let g:deoplete#ignore_sources={}
    let g:deoplete#ignore_sources._=['omni'] "disable omni source
	" <C-h>, <BS>: close popup and delete backword char.
	inoremap <expr><C-h> deoplete#mappings#smart_close_popup()."\<C-h>"
	inoremap <expr><BS> deoplete#mappings#smart_close_popup()."\<C-h>"
	inoremap <expr><TAB>  pumvisible() ? "\<Down>" : "\<C-x>\<C-u>"
" For smart TAB completion.
	inoremap <expr><TAB>  pumvisible() ? "\<C-n>" :
	        \ <SID>check_back_space() ? "\<TAB>" :
	        \ deoplete#mappings#manual_complete()
	  function! s:check_back_space() "{{{
	    let col = col('.') - 1
	    return !col || getline('.')[col - 1]  =~ '\s'
	  endfunction"}}}
endif
"}}}

"quick saving {{{
nmap <silent> <Leader>w :update<CR>
"}}}

"black hole mapping {{{
"#to delete text object, put type text object shortcut after command
nmap <leader>d "_d"
"}}}

"{{{ arrow key to buffer map
set hidden
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
    if neobundle#tap('ctrlp.vim') "{{{
        let g:ctrlp_user_command='ag %s -l --nocolor -g ""'
    endif
    "}}}
endif "}}}

if neobundle#tap('vim-buftabline') "{{{
    let g:buftabline_numbers=1 " enable numbering



endif "}}}

let g:sql_type_default='mysql'


if neobundle#tap('dbext.vim') "{{{
    let g:dbext_default_profile_fullchip_ro= 'type=MYSQL:user=fullchipsims_ro:passwd=CB2ea79!:dbname=gpu_fullchip_sims:host=gpu-db-gpufullchipsims-read'
    let g:dbext_default_profile_fullchip_dev= 'type=MYSQL:user=fullchipsims_dev:passwd=dev:dbname=GPUFullchipSims:host=gpu-db-gpufullchipsims-dev'
    let g:dbext_default_profile_golden_dev= 'type=MYSQL:user=goldecl_usr:passwd=iMsTj6Fe:dbname=GoldenCl:host=gpu-db-goldencl-dev'
    let g:dbext_default_profile_golden_prod= 'type=MYSQL:user=goldecl_usr:passwd=IcTPA73w:dbname=GoldenCl:host=gpu-db-goldencl-write'

endif "}}}

autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o "Makes copying and pasting using mosh work better


"{{{ NEOMAKE
let g:neomake_perl_perlc_maker = {
            \ 'exe': '/home/eash/scripts/perlc',
            \ 'buffer_output': 0,
            \ 'errorformat': 
            \ '%m at %f line %l%s,'.
            \ '%-G%.%#had\ compilation\ errors.,'. 
            \ '%-G%.%#syntax\ OK'
 \}
" When writing a buffer, and on normal mode changes (after 750ms).
call neomake#configure#automake('nw', 750)
let g:neomake_perl_enabled_makers=['perlc', 'perlcritic']
            " \ 'arg' : ['--quiet --nocolor --verbose "\%s:\%f:\%l:\%c:(\%s) \%m (\%e)\n"'],
"}}}

"{{{makes jk go by line, except when proceded by number
function! LineMotion(dir)
    execute "normal! " . (v:count1 > 1 ? "m'" . v:count1 : "g") . a:dir
endfunction

nnoremap <silent> j :<c-u>call LineMotion("j")<cr>
nnoremap <silent> k :<c-u>call LineMotion("k")<cr>
"}}}

" if neobundle#tap('vim-rooter') "{{{
    let g:rooter_patterns = ['dist.ini', 'TOT', '.git', '.git/', '.p4config']
    let g:rooter_use_lcd = 1
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


command! -nargs=1 Perldoc call Perldoc(<f-args>) 
function! Perldoc(Method)
    let tmp=tempname()
    call system("perldoc -onroff -d ".tmp." ".a:Method)
    if (v:shell_error)
        echom "Could not find docs for ".a:Method
        return
    endif
    " silent exec "!perldoc -onroff -d ".tmp a:Method
    exec "Nman ".tmp
    exec "file man://".a:Method
    call delete(tmp)
    set buflisted
    
endfunc

function! Get_pagePerldoc(bang, editcmd, ...) abort
  if a:0 > 2
    call s:error('too many arguments')
    return
  elseif a:0 == 2
    let sect = a:000[0]
    let page = a:000[1]
  else
    " fpage is a string like 'printf(2)' or just 'printf'
    " if no argument, use the word under the cursor
    let fpage = get(a:000, 0, expand('<cWORD>'))
    if empty(fpage)
      call s:error('no WORD under cursor')
      return
    endif
    call Perldoc(expand('<cWORD>'))
  endif
endfunction


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
"}}}

"{{{ Python paths for work
if filereadable('/home/utils/Python-2.7.9/bin/python') 
    let g:python_host_prog='/home/utils/Python-2.7.9/bin/python'
    let g:python3_host_prog='/home/utils/Python-3.4.2/bin/python3'
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

let g:LanguageClient_serverCommands = {
            \ 'perl': ['/home/eash/scripts/Language-Server/bin/slp.pl'],
            \}
let g:LanguageClient_autoStart=0

"{{{ autopair

let g:AutoPairsMultilineClose=0

"}}}

if has ('nvim')
    let $VISUAL='nvr -cc split --remote-wait'
endif
" vim: set fdm=marker:
