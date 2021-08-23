local utils = require('utils')

local cmd = vim.cmd
local o = vim.opt

vim.cmd [[
    filetype plugin indent on
]]
vim.g.syntax_on = true -- Turn on syntax highlighting

-- Tabs and space
local indent = 4
o.shiftwidth = indent
o.tabstop    = indent
o.softtabstop = indent

o.expandtab  = true
o.smartindent= true
o.copyindent = true

-- Make nvim splitting sane
o.splitbelow= true
o.splitright= true

o.wildmode= 'list:longest,full'

-- Enable relative numbers
o.number= true
o.relativenumber = true
o.ruler=true

-- Sync system and nvim clipboard
o.clipboard = 'unnamed,unnamedplus'

-- Enable mouse support
o.mouse = 'a'
o.mousefocus = true

-- Linewrapping
o.scrolloff= 4  -- Scrolls by  4 when you go left on the wordwrap
o.linebreak = true -- Wrap on word boundary

-- Folding
o.foldenable = true
o.foldmethod = 'syntax'

-- Misc
o.hidden= true -- Allows buffers to be hidden while having unsaved changes
o.ignorecase= true
o.shiftround= true
o.smartcase= true
o.undofile=true

-- Speed up vim
o.lazyredraw = true
o.synmaxcol = 255 --Syntax coloring slows things down, maybe able to turn off once we use treesitter
o.updatetime=300  -- fixes bad experience for diagnostics messages when its default is 4000
o.timeoutlen=300 -- leaderkey timeout

-- Completion
o.completeopt = "menuone,noinsert,noselect"
