local status_ok, _ = pcall(require, 'lspconfig')
if not status_ok then
  vim.notify('Failed to load plugin "neovim/nvim-lspconfig"')
  return
end

local keymaps = require('user/keymaps')
-- Enable (broadcasting) snippet capability for completion
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.completion.completionItem.snippetSupport = true
local lsp_flags = {
  -- This is the default in Nvim 0.7+
  debounce_text_changes = 150,
}

-- NOTE `on_attach` and `capabilities` must be passed for each `setup()`!
local default = {
  on_attach = keymaps.on_attach,
  capabilities = capabilities,
  flags = lsp_flags,
}

-- TODO https://github.com/neovim/nvim-lspconfig/blob/master/doc/configs.md#cssls
require('lspconfig').cssls.setup(default)

-- TODO https://github.com/neovim/nvim-lspconfig/blob/master/doc/configs.md#html
require('lspconfig').html.setup(default)

-- TODO https://github.com/neovim/nvim-lspconfig/blob/master/doc/configs.md#jsonls
require('lspconfig').jsonls.setup(default)

-- https://github.com/neovim/nvim-lspconfig/blob/master/doc/configs.md#pyright
--
-- Commands:
-- PyrightOrganizeImports: Organize Imports
-- PyrightSetPythonPath: Reconfigure pyright with the provided python path
-- require('lspconfig').pyright.setup(default)

-- TODO https://github.com/neovim/nvim-lspconfig/blob/master/doc/configs.md#vimls
require('lspconfig').vimls.setup(default)
vim.g.markdown_fenced_languages = { 'vim', 'help' }

-- TODO https://github.com/neovim/nvim-lspconfig/blob/master/doc/configs.md#luau_lsp
require('lspconfig').lua_ls.setup({
  settings = {
    Lua = {
      runtime = {
        -- Tell the language server which version of Lua you're using (most likely LuaJIT in the case of Neovim)
        version = 'LuaJIT',
      },
      diagnostics = {
        -- Get the language server to recognize the `vim` global
        globals = { 'vim' },
      },
      workspace = {
        -- Make the server aware of Neovim runtime files
        library = vim.api.nvim_get_runtime_file("", true),
      },
      -- Do not send telemetry data containing a randomized but unique identifier
      telemetry = {
        enable = false,
      },
    },
  },
  unpack(default)
})

-- INFO https://github.com/neovim/nvim-lspconfig/blob/master/doc/configs.md#bashls
-- TODO https://github.com/bash-lsp/bash-language-server
require('lspconfig').bashls.setup(default)

-- INFO https://github.com/neovim/nvim-lspconfig/blob/master/doc/configs.md#texlab
-- require('lspconfig').texlab.setup(default)

-- NOTE Phpactor requires PHP 8.1.
-- INFO
-- https://github.com/neovim/nvim-lspconfig/blob/master/doc/configs.md#phpactor
-- https://phpactor.readthedocs.io/en/master/lsp/vim.html
-- require('lspconfig').phpactor.setup({
--   init_options = {
--     ['language_server_phpstan.enabled'] = false,
--     ['language_server_psalm.enabled'] = false,
--   },
--   unpack(default)
-- })

-- INFO
-- https://github.com/neovim/nvim-lspconfig/blob/master/doc/configs.md#intelephense
-- https://github.com/bmewburn/intelephense-docs
require('lspconfig').intelephense.setup(default)

-- INFO https://github.com/neovim/nvim-lspconfig/blob/master/doc/configs.md#ts_ls
require('lspconfig').ts_ls.setup(default)

-- TODO https://github.com/LunarVim/Neovim-from-scratch/tree/master/lua/user/lsp
-- require 'user.lsp.configs'
-- require('user.lsp.handlers').setup()
-- require 'user.lsp.null-ls'

return {
  capabilities = capabilities,
  flags = lsp_flags,
}
