-- Map leader to space
vim.g.mapleader = '\\'

local fn = vim.fn
local execute = vim.api.nvim_command
local g = vim.g

-- Disable unused default plugins
g.loaded_netrwPlugin = true
g.loaded_netrwFileHandlers = true
g.loaded_netrwSettings = true
g.loaded_vimballPlugin = true
g.loaded_tutor_mode_plugin = true


-- Sensible defaults
require('settings')
require('keymappings')

-- Auto install packer.nvim if not exists
local install_path = fn.stdpath('data')..'/site/pack/packer/opt/packer.nvim'
if fn.empty(fn.glob(install_path)) > 0 then
    execute('!git clone https://github.com/wbthomason/packer.nvim '..install_path)
    execute 'packadd packer.nvim'
end

-- Install plugins
require('plugins')

-- Color schen
g.onedark_styne='deep'
require('onedark').setup()

-- Another option is to groups configuration in one folder
require('config/lsp')
