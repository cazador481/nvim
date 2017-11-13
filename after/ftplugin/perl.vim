setlocal equalprg =perltidy\ -q
setlocal keywordprg=$HOME/scripts/nv_perldoc
setlocal path+=lib/,lib/perl5
let perl_fold=1
let perl_nofold_packages=1
let perl_fold_anonymous_subs=1
let perl_include_pod=1

nmap cv :call RenameVariable()<cr>
