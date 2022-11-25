-- Mappings (:help nvim-tree-default-mappings):
-- `K` - navigate to the first sibling of current file/directory
-- `J` - navigate to the last sibling of current file/directory
-- `o` - open a file or folder
-- `H` - toggle dotfiles
-- `R` - refresh
-- `g` (go) - cd in the directory under the cursor
-- `v` - open the file in a vertical split
-- `h` - open the file in a horizontal split
-- `t` - open the file in a new tab
-- `<Shift-p>` - move cursor to the parent directory
--
-- `a` - add a file; NOTE You can add a directory by adding a "/" at the end of
-- the paths, entering multiple directories "BASE/foo/bar/baz" will add
-- directory "foo", then "bar" and add a file "baz" to it.
-- `d` - delete a file (will prompt for confirmation)
-- `r` - rename a file
-- `x` - add/remove file/directory to cut clipboard
-- `c` - add/remove file/directory to copy clipboard
-- `p` - paste from clipboard; cut clipboard has precedence over copy; will
-- prompt for confirmation
--
-- `Y` - copy relative path to system clipboard
-- `gy` - copy absolute path to system clipboard
-- `f` - live filter nodes dynamically based on regex matching
-- `<Shift+f>` - clear live filter
-- `C` - collapse the WHOLE tree
-- `E` - expand the whole tree

local status_ok, nvim_tree = pcall(require, 'nvim-tree')
if not status_ok then
  return
end

local config_status_ok, nvim_tree_config = pcall(require, 'nvim-tree.config')
if not config_status_ok then
  return
end

-- Replaces auto_close
local tree_cb = nvim_tree_config.nvim_tree_callback
vim.api.nvim_create_autocmd('BufEnter', {
  nested = true,
  callback = function()
    if #vim.api.nvim_list_wins() == 1 and vim.api.nvim_buf_get_name(0):match('NvimTree_') ~= nil then
      vim.cmd 'quit'
    end
  end
})

nvim_tree.setup {
  sort_by = 'case_sensitive',
  disable_netrw = true,
  hijack_netrw = true,
  -- open_on_setup = true,
  -- open_on_setup_file = true,
  ignore_ft_on_setup = {
    "startify",
    "dashboard",
    "alpha",
  },
  open_on_tab = false,
  hijack_cursor = true,
  update_cwd = true,
  diagnostics = {
    enable = true,
    icons = {
      hint = "",
      info = "",
      warning = "",
      error = "",
    },
  },
  update_focused_file = {
    enable = true,
    update_cwd = true,
    ignore_list = {},
  },
  system_open = {
    cmd = nil,
    args = {},
  },
  filters = {
    -- DEBUG
    -- dotfiles = true,
    custom = {},
  },
  git = {
    enable = true,
    ignore = true,
    timeout = 500,
  },
  renderer = {
    group_empty = true,
    icons = {
      glyphs = {
        default = "",
        symlink = "",
        git = {
          unstaged = "",
          staged = "S",
          unmerged = "",
          renamed = "➜",
          deleted = "",
          untracked = "U",
          ignored = "◌",
        },
        folder = {
          default = "",
          open = "",
          empty = "",
          empty_open = "",
          symlink = "",
        },
      },
    },
  },
  view = {
    width = 30,
    height = 30,
    hide_root_folder = false,
    side = "left",
    mappings = {
      custom_only = false,
      list = {
        { key = 'g', cb = tree_cb 'cd' },
        { key = 'v', cb = tree_cb 'vsplit' },
        { key = 'h', cb = tree_cb 'split' },
        { key = 't', cb = tree_cb 'tabnew' },
        { key = 'C', cb = tree_cb 'collapse_all' },
        { key = 'H', action = 'toggle_dotfiles' },
        { key = '<C-t>', cb = tree_cb '' },
      },
    },
    number = false,
    relativenumber = false,
  },
  trash = {
    cmd = "trash",
    require_confirm = true,
  },
  actions = {
    open_file = {
      quit_on_open = true,
      window_picker = {
        enable = false,
      },
    },
  },
}
