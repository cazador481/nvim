local vimp=require('vimp')
-- Enter makes a blank space in normal mode
vimp.nnoremap('<S-Enter>','O<ESC>')
vimp.nnoremap('<Enter>','o<ESC>')

-- Quick savings
vimp.nmap({'silent'}, '<leader>w',':update<CR>')

-- Black hole mapping
vimp.nmap('<leader>d', "_d")

-- Arrow key to buffef map
-- vimp.nnoremap('<C-LEFT>',':bp<CR>')
-- vimp.nnoremap('<C-RIGHT>',':bn<CR>')


-- "{{{makes jk go by line, except when proceded by number
-- function! LineMotion(dir)
--     execute "normal! " . (v:count1 > 1 ? "m'" . v:count1 : "g") . a:dir
-- endfunction
--
-- nnoremap <silent> j :<c-u>call LineMotion("j")<cr>
-- nnoremap <silent> k :<c-u>call LineMotion("k")<cr>
-- "}}}



