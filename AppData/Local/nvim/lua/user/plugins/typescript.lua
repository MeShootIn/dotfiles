local status_ok, _ = pcall(require, 'typescript')
if not status_ok then
  vim.notify('Failed to load plugin "jose-elias-alvarez/typescript.nvim"')
  return
end

-- INFO https://github.com/jose-elias-alvarez/typescript.nvim#commands
-- Commands (async by default, or sync with `!` ending):
-- ...
-- Fix all: `TypescriptFixAll` (fixes a handful of specific issues, e.g.
-- non-async functions that use await and unreachable code).
-- Rename file: `TypescriptRenameFile` (always async).

local keymaps = require('user/keymaps')
local lsp = require('user/plugins/lsp')

require('typescript').setup({
  disable_commands = false, -- prevent the plugin from creating Vim commands
  debug = false, -- enable debug logging for commands
  go_to_source_definition = {
    fallback = true, -- fall back to standard LSP definition on failure
  },
  server = { -- pass options to lspconfig's setup method
    on_attach    = keymaps.on_attach,
    capabilities = lsp.capabilities,
    flags        = lsp.flags,
  },
})
