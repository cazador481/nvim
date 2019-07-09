if did_filetype()
    finish
endif 

if getline(1) =~ '# A Perforce Change Specification.$' || getline(1) =~ '# A Crucible Change Specification.$'
    setfiletype p4_submit
    "execute "normal gg23ggoJobs:\<esc>o\<esc>"
    "do something else
endif
