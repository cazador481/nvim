vim.cmd[[packadd packer.nvim]]
require('packer').startup(function()

    local function is_tmux()
        if os.getenv("TMUX") then
            return 1
        else
            return 0
        end
    end

    -- Packer can manage itself as an optional plugin
    use {'wbthomason/packer.nvim', opt = true}

    use  {'svermeulen/vimpeccable'}

    -- Color scheme
    use { 'sainnhe/gruvbox-material' }
    use { 'navarasu/onedark.nvim' }

    use {'jiangmiao/auto-pairs'}

    -- Testing
    use {"vim-test/vim-test"}

    -- Fuzzy finder
    use {
        'nvim-telescope/telescope.nvim',
        -- config = function() require('config.telescope') end,
        requires = {{'nvim-lua/popup.nvim'}, {'nvim-lua/plenary.nvim'}},
    }
    use { 'nvim-telescope/telescope-packer.nvim', requires = {{'nvim-telescope/telescope.nvim'}}}
    use { 'nvim-telescope/telescope-fzf-native.nvim', run = 'make', requires = {{'nvim-telescope/telescope.nvim'}}}
    use { 'nvim-telescope/telescope-fzf-writer.nvim', requires = {{'nvim-telescope/telescope.nvim'}}}


    -- LSP config
    use { 'neovim/nvim-lspconfig' }
    use { 'kabouzeid/nvim-lspinstall', config = function() require('config.lsp-install') end}
    -- Better LSP
    use {'glepnir/lspsaga.nvim', config= function() require('lspsaga').init_lsp_saga() end }
    use {'ray-x/lsp_signature.nvim', config = function() require('lsp_signature').on_attach({bind = false, use_lspsaga=true}) end }
    -- use {'onsails/lspkind-nvim', config = function() require('config.lspkind') end }
    use {'mfussenegger/nvim-lint'}
    -- Completion
    use {'hrsh7th/nvim-compe',config=function() require('config.nvim-compe') end}
    use { 'tamago324/compe-zsh',requires = {{'hrsh7th/nvim-compe'}}}
    use { 'andersevenrud/compe-tmux',requires = {{'hrsh7th/nvim-compe'}}}


    use {'qpkorr/vim-bufkill'}

    -- Lua development
    -- use { 'tjdevries/nlua.nvim' }

    use {'tpope/vim-repeat'}

    use { 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate', config = function() require('config/treesitter') end }

    use {'tomtom/tcomment_vim'}

    -- tmux
    use {'brauner/vimtux', cond = is_tmux}
    use {'christoomey/vim-tmux-navigator', cond = is_tmux, config = function() require('vim-tmux-navigator') end }
    use {'tmux-plugins/vim-tmux-focus-events', cond=is_tmux}
    use {'tmux-plugins/vim-tmux', cond = is_tmux}

    use {'romgrk/barbar.nvim', requires = {{'kyazdani42/nvim-web-devicons'}}, config = function() require ('config/barbar') end}
    -- use {'ap/vim-buftabline'}

    use {'SirVer/ultisnips',config = function() require('ultisnips') end }

    use { 'perrywky/vim-matchit'}

    -- Text Objects
    use { 'wellle/targets.vim'}
    use { 'kana/vim-textobj-user'}
    use { 'kana/vim-textobj-function'}
    use { 'bps/vim-textobj-python', ft = 'python'}
    use { 'thinca/vim-textobj-function-perl' , ft =  'perl'}
    use { 'glts/vim-textobj-comment'}
    use { 'vimtaku/vim-textobj-sigil'}
    use { 'paulhybryant/vim-textobj-path'}

    -- Reload vim files
    use {'xolox/vim-reload',ft='vim',requires = {{'xolox/vim-reload'}}}

    -- Python plugins
    use {'tmhedberg/SimpylFold',ft='python'}
    use {'numirias/semshi', run = ':UpdateRemotePlugins',ft='python'}
    -- Python folding
    -- use {'kalekundert/vim-coiled-snake',ft='python'}
    use {'Vimjas/vim-python-pep8-indent',ft='python'}

    use {'airblade/vim-rooter'}

    use {'tpope/vim-obsession'} -- used for tmux reloading

    -- Perl Plugins
    use  {'vim-perl/vim-perl', ft = 'perl'}
    use {'catalinciurea/perl-nextmethod', ft= 'perl'} -- enables [M, [m, ]M,]m

    -- Git plugins
    use {'tpope/vim-fugitive'}

    use {'machakann/vim-sandwich'}

end)
vim.cmd [[autocmd BufWritePost plugins.lua luafile lua/plugins.lua]]
--vim.cmd [[autocmd BufWritePost plugins.lua PackerInstall]]
