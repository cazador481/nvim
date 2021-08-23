local on_attach = function(client, bufnr)

    require'lsp_signature'.on_attach(client)

    local function buf_set_keymap(...)
        vim.api.nvim_buf_set_keymap(bufnr, ...)
    end
    local function buf_set_option(...)
        vim.api.nvim_buf_set_option(bufnr, ...)
    end

    buf_set_option('omnifunc', 'v:lua.vim.lsp.omnifunc')

    -- Mappings.
    local opts = {noremap = true, silent = true}
    buf_set_keymap('n', 'gD', '<Cmd>lua vim.lsp.buf.declaration()<CR>', opts)
    buf_set_keymap('n', 'gd', '<Cmd>lua vim.lsp.buf.definition()<CR>', opts)
    buf_set_keymap('n', 'K', '<Cmd>lua vim.lsp.buf.hover()<CR>', opts)
    -- buf_set_keymap('n', 'K', '<Cmd>lua require("lspsaga.hover").render_hover_doc()<CR>', opts)
    -- buf_set_keymap('n', 'K', '<Cmd>lua require("lspsaga.signature_help").render_hover_doc()<CR>', opts)
    buf_set_keymap('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', opts)
    buf_set_keymap('n', '<C-k>', '<cmd>lua vim.lsp.buf.signature_help()<CR>', opts)
    buf_set_keymap('n', '[d', '<cmd>lua vim.lsp.diagnostic.goto_prev()<CR>', opts)
    buf_set_keymap('n', ']d', '<cmd>lua vim.lsp.diagnostic.goto_next()<CR>', opts)
    buf_set_keymap('n', '<leader>law', '<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>', opts)
    buf_set_keymap('n', '<leader>lrw', '<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>', opts)
    buf_set_keymap('n', '<leader>llw', '<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>', opts)
    buf_set_keymap('n', '<leader>lt', '<cmd>lua vim.lsp.buf.type_definition()<CR>', opts)

    -- Rename
    -- buf_set_keymap('n', '<leader>rn', '<cmd>lua vim.lsp.buf.rename()<CR>', opts)
    buf_set_keymap('n', '<leader>rn', '<cmd>lua require("lspsaga.rename").rename()<CR>', opts)

    buf_set_keymap('n', '<leader>rf', '<cmd>lua vim.lsp.buf.references()<CR>', opts)
    buf_set_keymap('n', '<leader>ld', '<cmd>lua vim.lsp.diagnostic.show_line_diagnostics()<CR>', opts)
    buf_set_keymap('n', '<space>q', '<cmd>lua vim.lsp.diagnostic.set_loclist()<CR>', opts)

    -- Code Action
    buf_set_keymap('n', '<leader>ca', "<cmd>lua require('lspsaga.codeaction').code_action()<CR>",opts)
    buf_set_keymap('n', '<leader>ca', ":<C-U>lua require('lspsaga.codeaction').range_code_action()<CR>",opts)
    buf_set_keymap('n', '<leader>lss', '<cmd>lua vim.lsp.buf.document_symbol()<CR>', opts)

    -- Set some keybinds conditional on server capabilities
    if client.resolved_capabilities.document_formatting then
        buf_set_keymap("n", "<leader>lf",
                       "<cmd>lua vim.lsp.buf.formatting()<CR>", opts)
    elseif client.resolved_capabilities.document_range_formatting then
        buf_set_keymap("n", "<leader>lf",
                       "<cmd>lua vim.lsp.buf.range_formatting()<CR>", opts)
    end


end

local nvim_lsp = require('lspconfig')
local capabilities = vim.lsp.protocol.make_client_capabilities()

-- Code actions
capabilities.textDocument.codeAction = {
    dynamicRegistration = true,
    codeActionLiteralSupport = {
        codeActionKind = {
            valueSet = (function()
                local res = vim.tbl_values(vim.lsp.protocol.CodeActionKind)
                table.sort(res)
                return res
            end)()
        }
    }
}

capabilities.textDocument.completion.completionItem.snippetSupport = true;


-- Configure lua language server for neovim development
local lua_settings = {
  Lua = {
    runtime = {
      -- LuaJIT in the case of Neovim
      version = 'LuaJIT',
      path = vim.split(package.path, ';'),
    },
    diagnostics = {
      -- Get the language server to recognize the `vim` global
      globals = {'vim'},
    },
    workspace = {
      -- Make the server aware of Neovim runtime files
      library = {
        [vim.fn.expand('$VIMRUNTIME/lua')] = true,
        [vim.fn.expand('$VIMRUNTIME/lua/vim/lsp')] = true,
      },
    },
  }
}
-- Automatically load all servers that are installed
local function setup_servers()
  -- Get list of installed servers
  require'lspinstall'.setup()
  local servers = require'lspinstall'.installed_servers()

  for _, server in pairs(servers) do
     local config = {capabilities = capabilities, on_attach = on_attach}

     -- Individual LSP settings
     if server == "lua" then
         config.settings = lua_settings
     end

     nvim_lsp[server].setup(config)
  end
end

setup_servers()

-- On install of of server, run the server
require'lspinstall'.post_install_hook = function ()
  setup_servers() -- reload installed servers
  vim.cmd("bufdo e") -- this triggers the FileType autocmd that starts the server
end

-- LSPs
-- TODO: Add server vimls
-- local servers = {"pyright","sumneko_lua"}
-- for _, lsp in ipairs(servers) do
--     nvim_lsp[lsp].setup {capabilities = capabilities, on_attach = on_attach}
-- end

-- lua config
-- require('nlua.lsp.nvim').setup(nvim_lsp,{capabilities = capabilities, on_attach=on_attach})

-- symbols-outline.nvim
--vim.g.symbols_outline = {
--    highlight_hovered_item = true,
--   show_guides = true,
--   auto_preview = false, -- experimental
--   position = 'right',k
--   keymaps = {
--       close = "<Esc>",
--       goto_location = "<Cr>",
--       focus_location = "o",
--       hover_symbol = "<C-space>",
--       rename_symbol = "r"
--       code_actions = "a"
--   },
--   lsp_blacklist = {}
--}

-- LSP Enable diagnostics
-- vim.lsp.handlers["textDocument/publishDiagnostics"] =
--     vim.lsp.with({
--         virtual_text = false,
--         underline = true,
--         signs = true,
--         update_in_insert = false
--     }, vim.lsp.diagnostic.on_publish_diagnostics)

-- --Send diagnostics to quickfix list
-- do
--     local method = "textDocument/publishDiagnostics"
--     local default_handler = vim.lsp.handlers[method]
--     vim.lsp.handlers[method] = function(err, method, result, client_id, bufnr,
--                                         config)
--         default_handler(err, method, result, client_id, bufnr, config)
--         local diagnostics = vim.lsp.diagnostic.get_all()
--         local qflist = {}
--         for bufnr, diagnostic in pairs(diagnostics) do
--             for _, d in ipairs(diagnostic) do
--                 d.bufnr = bufnr
--                 d.lnum = d.range.start.line + 1
--                 d.col = d.range.start.character + 1
--                 d.text = d.message
--                 table.insert(qflist, d)
--             end
--         end
--         vim.lsp.util.set_qflist(qflist)
--     end
-- end
