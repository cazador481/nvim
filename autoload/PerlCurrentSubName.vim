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


