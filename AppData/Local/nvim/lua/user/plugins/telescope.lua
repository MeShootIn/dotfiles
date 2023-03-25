local status_ok, telescope = pcall(require, 'telescope')
if not status_ok then
  vim.notify('Failed to load plugin "telescope"')
  return
end

telescope.setup {
  pickers = {
    find_files = {
      theme = 'dropdown',
    },
  },
  extensions = {
    fzf = {
      fuzzy = true, -- false will only do exact matching
      override_generic_sorter = true, -- override the generic sorter
      override_file_sorter = true, -- override the file sorter
      case_mode = "smart_case", -- or "ignore_case" or "respect_case"
      -- the default case_mode is "smart_case"
    }
  }
}

-- nvim-telescope/telescope-fzf-native.nvim
-- require('telescope').load_extension('fzf') -- FIXME loop or previous error loading module 'telescope._extensions.fzf'
