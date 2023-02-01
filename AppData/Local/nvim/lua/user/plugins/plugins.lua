-- NOTE Impatient needs to be setup before any other lua plugin!
require('user/plugins/impatient') -- lewis6991/impatient.nvim

-- require('user/plugins/alpha') -- FIXME goolord/alpha-nvim
-- require('user/plugins/bufferline') -- akinsho/bufferline.nvim
-- require('user/plugins/nvim-tree') -- kyazdani42/nvim-tree.lua
require('user/plugins/auto-save') -- pocco81/auto-save.nvim
require('user/plugins/autopairs') -- windwp/nvim-autopairs
require('user/plugins/cmp') -- hrsh7th/nvim-cmp
require('user/plugins/comment') -- numToStr/Comment.nvim
require('user/plugins/gitsigns') -- lewis6991/gitsigns.nvim
require('user/plugins/indent-blankline') -- lukas-reineke/indent-blankline.nvim
require('user/plugins/vimtex') -- lervag/vimtex
require('user/plugins/lsp') -- TODO
require('user/plugins/lualine') -- nvim-lualine/lualine.nvim
require('user/plugins/luasnip') -- L1MON4D3/LuaSnip
require('user/plugins/markdown-preview') -- iamcco/markdown-preview.nvim
require('user/plugins/marks') -- chentoast/marks.nvim
require('user/plugins/presence') -- andweeb/presence.nvim
require('user/plugins/scrollview') -- dstein64/nvim-scrollview
require('user/plugins/snake') -- zyedidia/vim-snake
require('user/plugins/telescope') -- nvim-telescope/telescope.nvim
require('user/plugins/todo-comments') -- folke/todo-comments.nvim
require('user/plugins/treesitter') -- nvim-treesitter/nvim-treesitter
require('user/plugins/vim-markdown') -- tpope/vim-markdown
local prettier = require('user/plugins/vim-prettier') -- prettier/vim-prettier

local fn = vim.fn

-- Automatically install packer
local install_path = fn.stdpath('data') .. '/site/pack/packer/start/packer.nvim'
if fn.empty(fn.glob(install_path)) > 0 then
  packer_bootstrap = fn.system {
    'git',
    'clone',
    '--depth',
    '1',
    'https://github.com/wbthomason/packer.nvim',
    install_path,
  }

  print('Installing packer, then close and reopen Neovim...')
  vim.cmd([[
  packadd packer.nvim
  ]])
end

-- Use a protected call so we don't error out on first use.
local status_ok, _ = pcall(require, 'packer')
if not status_ok then
  vim.notify('Failed to load plugin "packer"')
  return
end



-- Run `:PackerSync` whenever you make changes to your plugin configuration.
return require('packer').startup(function(use)
  -- Packer can manage itself.
  use { 'wbthomason/packer.nvim' }

  -- MY CUSTOM PLUGINS --
  use { '~/nvim-plugins/github-url-opener/' }
  use { '~/nvim-plugins/my-formatter/' }
  use { '~/nvim-plugins/readme-diff/' }

  -- REMOTE PLUGINS --

  -- PROJECT TREE.
  -- use {
  --   'kyazdani42/nvim-tree.lua',
  --   requires = {
  --     'kyazdani42/nvim-web-devicons', -- optional, for file icons
  --   },
  --   tag = 'nightly' -- optional, updated every week. (see issue #1193)
  -- }
  use { 'justinmk/vim-dirvish' }
  -- Vim-like file manipulation commands for vim-dirvish with trash-cli.
  use { 'roginfarrer/vim-dirvish-dovish' }
  -- use { 'bounceme/remote-viewer' } -- TODO

  -- NAVIGATION.
  -- use {
  --   'akinsho/bufferline.nvim',
  --   tag = "v2.*",
  --   requires = 'kyazdani42/nvim-web-devicons'
  -- }
  use { 'justinmk/vim-sneak' }
  use { 'tpope/vim-apathy' }
  use { 'dstein64/nvim-scrollview' }
  use { 'tpope/vim-obsession' } -- NOTE Use the `MySession` command instead.

  -- SETTINGS.
  -- Defaults everyone can agree on.
  use { 'tpope/vim-sensible' }
  -- Improve startup time for Neovim.
  use { 'lewis6991/impatient.nvim' }

  -- KEYBOARD.
  -- Bilingual keyboard layout.
  use { 'powerman/vim-plugin-ruscmd' }

  -- LINTING.
  use {
    'prettier/vim-prettier',
    ft = prettier.ft,
  }
  use { 'editorconfig/editorconfig-vim' } -- FIXME Couldn't disable linting on
  -- save.

  -- LSP.
  use {
    'williamboman/nvim-lsp-installer',
    'neovim/nvim-lspconfig'
  } -- TODO Перечитать доку.

  -- COMPLETION.
  use { 'tpope/vim-endwise' } -- FIXME Remove after configuring snippets.
  use { 'hrsh7th/nvim-cmp' }
  use { 'hrsh7th/cmp-nvim-lua' }
  use { 'saadparwaiz1/cmp_luasnip' }
  use { 'hrsh7th/cmp-buffer' }
  use { 'hrsh7th/cmp-path' }
  use { 'hrsh7th/cmp-cmdline' }
  use { 'hrsh7th/cmp-nvim-lsp' } -- TODO Перечитать доку.

  -- MARKDOWN / LATEX.
  use {
    'iamcco/markdown-preview.nvim',
    run = 'cd app && npm install',
    setup = function() vim.g.mkdp_filetypes = { 'markdown' } end,
    ft = { 'markdown' },
  }
  use { 'lervag/vimtex' }

  -- SYNTAX.
  use {
    'nvim-treesitter/nvim-treesitter',
    run = function()
      local ts_update = require('nvim-treesitter.install').update(
        { with_sync = true }
      )
      ts_update()
    end,
  }

  -- SNIPPETS.
  use { 'L3MON4D3/LuaSnip' }
  use { 'rafamadriz/friendly-snippets' }

  -- FUZZY FINDER.
  use {
    'nvim-telescope/telescope.nvim', tag = '0.1.0',
    requires = { { 'nvim-lua/plenary.nvim' } },
  }
  use {
    'nvim-telescope/telescope-fzf-native.nvim',
    run = 'gcc',
  }

  -- COLORSCHEME.
  -- use { 'folke/tokyonight.nvim' }
  -- use { 'navarasu/onedark.nvim' }
  -- use { 'lifepillar/vim-solarized8' }

  -- STATUSLINE.
  use {
    'nvim-lualine/lualine.nvim',
    requires = { 'kyazdani42/nvim-web-devicons', opt = true },
  }

  -- FIXME DASHBOARD.
  -- use {
  --   'goolord/alpha-nvim',
  --   requires = { 'kyazdani42/nvim-web-devicons' },
  --   config = function ()
  --     require'alpha'.setup(require'alpha.themes.startify'.config)
  --   end
  --
  --   -- config = function ()
  --   --   require'alpha'.setup(require'alpha.themes.startify'.opts)
  --   --
  --   --   local startify = require('alpha.themes.startify')
  --   --   startify.section.mru_cwd.val = { { type = 'padding', val = 0 } }
  --   --   startify.section.bottom_buttons.val = {
  --   --     startify.button('e', 'new file', ':ene <bar> startinsert <cr>'),
  --   --     startify.button('v', 'neovim config', ':e ~/.config/nvim/init.lua<cr>'),
  --   --     startify.button('q', 'quit nvim', ':qa<cr>'),
  --   --   }
  --   -- end
  --
  --   -- config = function()
  --   --   local alpha = require("alpha")
  --   --   local dashboard = require("alpha.themes.dashboard")
  --   --
  --   --   math.randomseed(os.time())
  --   --
  --   --   local function pick_color()
  --   --     local colors = {"String", "Identifier", "Keyword", "Number"}
  --   --     return colors[math.random(#colors)]
  --   --   end
  --   --
  --   --   local function footer()
  --   --     local total_plugins = #vim.tbl_keys(packer_plugins)
  --   --     local datetime = os.date(" %d-%m-%Y   %H:%M:%S")
  --   --     local version = vim.version()
  --   --     local nvim_version_info = "   v" .. version.major .. "." .. version.minor .. "." .. version.patch
  --   --
  --   --     return datetime .. "   " .. total_plugins .. " plugins" .. nvim_version_info
  --   --   end
  --   --
  --   --   local logo = {
  --   --     '    ⢰⣧⣼⣯⠄⣸⣠⣶⣶⣦⣾⠄⠄⠄⠄⡀⠄⢀⣿⣿⠄⠄⠄⢸⡇⠄⠄ ',
  --   --     '    ⣾⣿⠿⠿⠶⠿⢿⣿⣿⣿⣿⣦⣤⣄⢀⡅⢠⣾⣛⡉⠄⠄⠄⠸⢀⣿⠄ ',
  --   --     '   ⢀⡋⣡⣴⣶⣶⡀⠄⠄⠙⢿⣿⣿⣿⣿⣿⣴⣿⣿⣿⢃⣤⣄⣀⣥⣿⣿⠄ ',
  --   --     '   ⢸⣇⠻⣿⣿⣿⣧⣀⢀⣠⡌⢻⣿⣿⣿⣿⣿⣿⣿⣿⣿⠿⠿⠿⣿⣿⣿⠄ ',
  --   --     '  ⢀⢸⣿⣷⣤⣤⣤⣬⣙⣛⢿⣿⣿⣿⣿⣿⣿⡿⣿⣿⡍⠄⠄⢀⣤⣄⠉⠋⣰ ',
  --   --     '  ⣼⣖⣿⣿⣿⣿⣿⣿⣿⣿⣿⢿⣿⣿⣿⣿⣿⢇⣿⣿⡷⠶⠶⢿⣿⣿⠇⢀⣤ ',
  --   --     ' ⠘⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣽⣿⣿⣿⡇⣿⣿⣿⣿⣿⣿⣷⣶⣥⣴⣿⡗ ',
  --   --     ' ⢀⠈⢿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡟  ',
  --   --     ' ⢸⣿⣦⣌⣛⣻⣿⣿⣧⠙⠛⠛⡭⠅⠒⠦⠭⣭⡻⣿⣿⣿⣿⣿⣿⣿⣿⡿⠃  ',
  --   --     ' ⠘⣿⣿⣿⣿⣿⣿⣿⣿⡆⠄⠄⠄⠄⠄⠄⠄⠄⠹⠈⢋⣽⣿⣿⣿⣿⣵⣾⠃  ',
  --   --     '  ⠘⣿⣿⣿⣿⣿⣿⣿⣿⠄⣴⣿⣶⣄⠄⣴⣶⠄⢀⣾⣿⣿⣿⣿⣿⣿⠃   ',
  --   --     '   ⠈⠻⣿⣿⣿⣿⣿⣿⡄⢻⣿⣿⣿⠄⣿⣿⡀⣾⣿⣿⣿⣿⣛⠛⠁    ',
  --   --     '     ⠈⠛⢿⣿⣿⣿⠁⠞⢿⣿⣿⡄⢿⣿⡇⣸⣿⣿⠿⠛⠁      ',
  --   --     '        ⠉⠻⣿⣿⣾⣦⡙⠻⣷⣾⣿⠃⠿⠋⠁     ⢀⣠⣴ ',
  --   --     ' ⣿⣿⣿⣶⣶⣮⣥⣒⠲⢮⣝⡿⣿⣿⡆⣿⡿⠃⠄⠄⠄⠄⠄⠄⠄⣠⣴⣿⣿⣿ ',
  --   --   }
  --   --
  --   --   dashboard.section.header.val = logo
  --   --   dashboard.section.header.opts.hl = pick_color()
  --   --
  --   --   dashboard.section.buttons.val = {
  --   --     dashboard.button("<Leader>ff", "  File Explorer"),
  --   --     dashboard.button("<Leader>fo", "  Find File"),
  --   --     dashboard.button("<Leader>fw", "  Find Word"),
  --   --     dashboard.button("<Leader>ps", "  Update plugins"),
  --   --     dashboard.button("q", "  Quit", ":qa<cr>")
  --   --   }
  --   --
  --   --   dashboard.section.footer.val = footer()
  --   --   dashboard.section.footer.opts.hl = "Constant"
  --   --
  --   --   alpha.setup(dashboard.opts)
  --   --
  --   --   vim.cmd([[ autocmd FileType alpha setlocal nofoldenable ]])
  --   -- end
  -- }

  -- INDENT.
  use { 'lukas-reineke/indent-blankline.nvim' }

  -- HIGHLIGHT todo-COMMENTS.
  use {
    'folke/todo-comments.nvim',
    requires = 'nvim-lua/plenary.nvim',
  }

  -- GIT.
  use { 'lewis6991/gitsigns.nvim' }
  -- use { 'tpope/vim-git' }
  -- use { 'kristijanhusak/vim-dirvish-git' } -- WARN Works only on Linux.

  -- COMMENTS.
  use { 'numToStr/Comment.nvim' }
  use { 'JoosepAlviste/nvim-ts-context-commentstring' }

  -- SEARCH.
  use { 'google/vim-searchindex' }

  -- EDITING SUPPORT.
  -- TODO https://github.com/ntpeters/vim-better-whitespace#usage
  use { 'ntpeters/vim-better-whitespace' }
  use { 'windwp/nvim-autopairs' }
  use { 'farmergreg/vim-lastplace' }
  use { 'tpope/vim-repeat' }
  use { 'tpope/vim-surround' }
  use { 'vim-scripts/ReplaceWithRegister' }
  -- Easy text exchange operator for Vim.
  use { 'tommcdo/vim-exchange' }
  -- Autosave.
  use { 'pocco81/auto-save.nvim' }

  -- TEXT OBJECTS.
  -- Text object, based on indentation levels (`a` - around, `i` - indent):
  use { 'michaeljsmith/vim-indent-object' }
  -- Provides text objects (`ae` and `ie`) to select the entire content of a
  -- buffer. The best text object: `ie` (like `ae`, but does not include
  -- leading and trailing empty lines).
  use {
    'kana/vim-textobj-entire',
    requires = 'kana/vim-textobj-user',
  }
  -- Provides a text-object `a` (argument).
  use { 'vim-scripts/argtextobj.vim' } -- FIXME Remove after configuring LSP.
  -- New text objects.
  use { 'wellle/targets.vim' }
  use { 'dbakker/vim-paragraph-motion' }
  use { 'tpope/vim-unimpaired' }
  use {
    'glts/vim-textobj-comment',
    requires = 'kana/vim-textobj-user',
  }
  use {
    'kana/vim-textobj-line',
    requires = 'kana/vim-textobj-user',
  }

  -- FILETYPES.
  -- Vim runtime files for Haml, Sass, and SCSS.
  -- use { 'tpope/vim-haml' } -- INFO Disable in favor of treesitter's langs.
  -- Vim Markdown runtime files.
  use { 'tpope/vim-markdown' }
  -- TODO Basic support for .env and Procfile.
  use { 'tpope/vim-dotenv' }

  -- BUILD.
  use { 'tpope/vim-dispatch' }

  -- MARKS.
  use { 'chentoast/marks.nvim' }

  -- DISCORD.
  use { 'andweeb/presence.nvim' } -- Discord Rich Presence

  -- GAMES.
  use { 'zyedidia/vim-snake' }
  use { 'seandewar/nvimesweeper' }
  use { 'johngrib/vim-game-code-break' }

  -- Automatically set up your configuration after cloning 'packer.nvim'.
  if packer_bootstrap then
    require('packer').sync()
  end
end)
