local status_ok, _ = pcall(require, 'nvim-treesitter.configs')
if not status_ok then
  vim.notify('Failed to load plugin "nvim-treesitter.configs"')
  return
end

-- NOTE Install "tree-sitter-cli" global package manually: `yarn global add tree-sitter-cli`

-- :TSUpdate
-- :TSInstall <language_to_install>
require('nvim-treesitter.configs').setup {
  -- A list of parser names, or "all" (the four listed parsers should always be
  -- installed).
  ensure_installed = { 'c', 'lua', 'vim', 'vimdoc' },
  -- https://github.com/lervag/vimtex/blob/master/doc/vimtex.txt#:~:text=a%20math%20region.-,Thus,-%2C%20for%20people%20who
  ignore_install = { 'latex' },
  highlight = {
    enable = true,
    additional_vim_regex_highlighting = false,
  },
  -- Indentation based on treesitter for the "=" operator.
  -- NOTE This is an experimental feature.
  indent = {
    enable = true
  },
  autopairs = {
    enable = true,
  },
  -- FIXME JoosepAlviste/nvim-ts-context-commentstring
  -- context_commentstring = {
  --   enable = true,
  --   enable_autocmd = false,
  -- }
}

-- TODO Folding.
-- This will respect your `foldminlines` and `foldnestmax` settings.
-- vim.cmd([[
-- set foldmethod=expr
-- set foldexpr=nvim_treesitter#foldexpr()
-- ]])
