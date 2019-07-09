setlocal equalprg =perltidy\ -q
"setlocal keywordprg=$HOME/scripts/nv_perldoc
setlocal keywordprg=:Perldoc
setlocal path+=lib/,lib/perl5
let perl_fold=1
let perl_nofold_packages=1
let perl_fold_anonymous_subs=1
let perl_include_pod=1

nmap cv :call RenameVariable()<cr>

set errorformat+=%m\ at\ %f\ line\ %l
set errorformat+=%m\ at\ %f\ line\ %l\.


"{{{ abbreviation
iabbrev <buffer> $s $self
"}}}


command! -nargs=1 -buffer Perldoc call Perldoc(<f-args>) 
function! Perldoc(Method)
    let tmp=tempname()
    call system("nv_perldoc -onroff -d ".tmp." ".a:Method)
    if (v:shell_error)
        echom "Could not find docs for ".a:Method
        return
    endif
    " silent exec "!perldoc -onroff -d ".tmp a:Method
    exec "Man ".tmp
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


" read in .libcustom to add path info to perl
if !empty(glob(".libcustom"))
    for line in readfile(".libcustom")
        execute "setlocal path+=".line
    endfor
endif

function! PerlDebug(cmd)
    
    let $DEBUG_PATH= '/home/eash/download/Komodo-PerlRemoteDebugging-8.0.2-78971-linux-x86_64/'
    if empty($PERL5LIB)
        let $PERL5LIB='/home/eash/download/Komodo-PerlRemoteDebugging-8.0.2-78971-linux-x86_64/'
    else
        let $PERL5LIB='/home/eash/download/Komodo-PerlRemoteDebugging-8.0.2-78971-linux-x86_64/:'.$PERL5LIB
    endif
    let $PERL5DB="BEGIN {require q(/home/eash/download/Komodo-PerlRemoteDebugging-8.0.2-78971-linux-x86_64/perl5db.pl)}"
    let $PERLDB_OPTS="RemotePort=localhost:9000"

    exec 'split term://perl -d' a:cmd
endfunction
command! -nargs=1 -buffer PerlDebug call PerlDebug(<f-args>) 
