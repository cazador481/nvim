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

