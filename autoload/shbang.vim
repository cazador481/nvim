function! Shbang()
    " let shbang=matchstr(getline(1),"#!(.*)")
    echo(getline(1))
    let shbang=matchstr(getline(1),'\v#!\zs(/.*)')
    echo(shbang)
    if !len(shbang)
        echo("TEST")
    endif
    return shbang
endfunction
    
