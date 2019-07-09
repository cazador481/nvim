syn match Good "^ok "    
syn region okline contains=Good start="^ok" end="\n"
syn match builder_line "Builder\.pm line \d\+\."
syn match lineno "line \d\+\.*\n"
syn match line_no "Line \d\+\:"
syn match error_msg "^# \t.*at"hs=s+3
syn match perl_lib "perl_lib\/.*\.pm"hs=s+9
syn match file " at [^\/]\+\.p[ml] "hs=s+3
syn match subtest_file "^\s\+#\s\+.*at .*line \d\+\.\n"hs=s+5
syn match test_file "\/[^\/]\+\/t\/.*\.t "hs=s+1
syn match my_error "^[^(ok |not ok |#)].*line \d\+\.\n"
syn region not_ok_subtest contains=subtest_file start="^\s\+not ok \d\+" end="^\s\+#.*expected.*\n" " end="^\s\+#.*line \d\+\.\n"
syn region Bad contains=warning start="^not ok " end="^\ze[^#]"re=e-1,he=e-1
syn region warning contains=test_file,file,lineno,perl_lib,error_msg,builder_line start="^#\s\+Failed" end="^\ze[^#]"re=e-1,he=e-1
syn match comment "^#.*\n"    
syn match premature "^# Looks like.*\n"
syn region dump start="$VAR\d\+\s=\s"rs=s-1 end=";\n"
syn match divider "----*"    
syn match warn 'WARN\|ERROR'   
syn match script contains=warn '[A-Z]\{4,5}.*> '
    
hi Good cterm=bold ctermfg=Green
hi divider cterm=bold ctermfg=yellow ctermbg=black
hi dump ctermfg=LightBlue    
hi okline ctermfg=Green    
hi warning cterm=none ctermfg=Red
hi my_error cterm=none ctermfg=Red
hi premature cterm=none ctermfg=Red
hi failed cterm=none ctermfg=Red
hi Bad cterm=bold,underline ctermfg=Red
hi comment ctermfg=Cyan    
hi lineno ctermfg=White    
hi line_no ctermfg=White    
hi file ctermfg=White    
hi test_file ctermfg=White    
hi perl_lib ctermfg=White    
hi error_msg ctermfg=Green    
hi builder_line cterm=none ctermfg=Red
hi not_ok_subtest ctermfg=Red  
hi warn ctermfg=Red    
hi subtest_file ctermfg=White  
hi script ctermfg=White   
