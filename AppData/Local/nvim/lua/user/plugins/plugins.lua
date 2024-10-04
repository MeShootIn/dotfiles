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
require('user/plugins/lsp') -- neovim/nvim-lspconfig
require('user/plugins/lualine') -- nvim-lualine/lualine.nvim
require('user/plugins/luasnip') -- L1MON4D3/LuaSnip
-- require('user/plugins/markdown-preview') -- iamcco/markdown-preview.nvim
require('user/plugins/marks') -- chentoast/marks.nvim
-- require('user/plugins/presence') -- andweeb/presence.nvim
require('user/plugins/scrollview') -- dstein64/nvim-scrollview
require('user/plugins/snake') -- zyedidia/vim-snake
require('user/plugins/telescope') -- nvim-telescope/telescope.nvim
require('user/plugins/todo-comments') -- folke/todo-comments.nvim
require('user/plugins/treesitter') -- nvim-treesitter/nvim-treesitter
require('user/plugins/vim-markdown') -- tpope/vim-markdown
local prettier = require('user/plugins/vim-prettier') -- prettier/vim-prettier
-- require('user/plugins/typescript') -- jose-elias-alvarez/typescript.nvim
require('user/plugins/editorconfig-vim') -- editorconfig/editorconfig-vim
-- require('user/plugins/text-case') -- johmsalas/text-case.nvim
require('user/plugins/nvim-colorizer') -- NvChad/nvim-colorizer.lua

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
  use { '~/nvim-plugins/my-formatter/' }
  use { '~/nvim-plugins/readme-diff/' }

  -- REMOTE PLUGINS --
  -- TODO
  -- use { 'bounceme/remote-viewer' }

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
  use { 'roginfarrer/vim-dirvish-dovish', branch = 'main' }

  -- NAVIGATION.
  -- use {
  --   'akinsho/bufferline.nvim',
  --   tag = "v2.*",
  --   requires = 'kyazdani42/nvim-web-devicons'
  -- }
  use { 'justinmk/vim-sneak' }
  use { 'dstein64/nvim-scrollview' }
  use { 'tpope/vim-obsession' }
  use { 'chentoast/marks.nvim' }

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
  -- TODO Перечитать доку.
  use { 'neovim/nvim-lspconfig' }

  -- COMPLETION.
  use { 'hrsh7th/nvim-cmp' }
  use { 'hrsh7th/cmp-nvim-lua' }
  use { 'saadparwaiz1/cmp_luasnip' }
  use { 'hrsh7th/cmp-buffer' }
  use { 'hrsh7th/cmp-path' }
  use { 'hrsh7th/cmp-cmdline' }
  use { 'hrsh7th/cmp-nvim-lsp' } -- TODO Перечитать доку.

  -- MARKDOWN / LATEX.
  -- FIXME
  -- use {
  --   'iamcco/markdown-preview.nvim',
  --   run = 'cd app && npm install',
  --   setup = function() vim.g.mkdp_filetypes = { 'markdown' } end,
  --   ft = { 'markdown' },
  -- }
  use { 'lervag/vimtex' }

  -- SYNTAX.
  -- NOTE Although the "php" and "php_only" modules are the same, only the first
  -- one should be installed, because does not cause errors.
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
  use { 'L3MON4D3/LuaSnip', run = 'make install_jsregexp' }
  use { 'rafamadriz/friendly-snippets' }

  -- COLORS.
  use { 'NvChad/nvim-colorizer.lua' }

  -- COLORSCHEME.
  use { 'folke/tokyonight.nvim' }
  use { 'navarasu/onedark.nvim' }
  use { 'lifepillar/vim-solarized8' }
  use {
    'dracula/vim',
    as = 'dracula',
  }
  use { 'sainnhe/gruvbox-material' }

  -- STATUSLINE.
  use {
    'nvim-lualine/lualine.nvim',
    requires = {
      'nvim-tree/nvim-web-devicons',
      opt = true
    }
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
  -- use { 'tpope/vim-git' } -- TODO
  -- use { 'kristijanhusak/vim-dirvish-git' } -- WARN Works only on Linux.
  use { 'tpope/vim-fugitive' }

  -- COMMENTS.
  use { 'numToStr/Comment.nvim' }
  use { 'JoosepAlviste/nvim-ts-context-commentstring' }

  -- SEARCH.
  -- Show number of occurrences.
  use { 'google/vim-searchindex' }
  -- Fuzzy finder.
  use {
    'nvim-telescope/telescope.nvim', branch = '0.1.x',
    requires = { { 'nvim-lua/plenary.nvim' } },
  }
  use {
    'nvim-telescope/telescope-fzf-native.nvim',
    run = 'gcc',
  }

  -- EDITING SUPPORT.
  -- TODO https://github.com/ntpeters/vim-better-whitespace#usage
  use { 'ntpeters/vim-better-whitespace' }
  use { 'windwp/nvim-autopairs' }
  use { 'farmergreg/vim-lastplace' }
  use { 'tpope/vim-repeat' }
  use { 'tpope/vim-surround' }
  use { 'inkarkat/vim-ReplaceWithRegister' }
  -- Easy text exchange operator for Vim.
  use { 'tommcdo/vim-exchange' }
  -- Autosave.
  use { 'pocco81/auto-save.nvim' }
  -- Copy text through SSH.
  -- use { 'ojroques/vim-oscyank' } -- TODO
  -- Converting text case.
  -- use { 'johmsalas/text-case.nvim' } -- TODO
  -- use { 'ku1ik/vim-pasta' } -- FIXME After pasting in visual mode the
  -- register is replaced with another value.

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
  -- `ax` (much better), `ix` (with no surrounding whitespace).
  use {
    'whatyouhide/vim-textobj-xmlattr',
    requires = 'kana/vim-textobj-user',
  }

  -- FILETYPES.
  -- Vim Markdown runtime files.
  use { 'tpope/vim-markdown' }
  -- TODO Basic support for .env and Procfile.
  use { 'tpope/vim-dotenv' }
  -- use { 'jose-elias-alvarez/typescript.nvim' }

  -- BUILD.
  use { 'tpope/vim-dispatch' }

  -- PHP.
  use { 'adoy/vim-php-refactoring-toolbox' }
  -- TODO
  -- use { 'noahfrederick/vim-composer' }
  -- use { 'noahfrederick/vim-laravel' }
  -- use { 'shawncplus/phpcomplete.vim' } -- FIXME

  -- BROWSING.
  use { 'tyru/open-browser.vim' }

  -- DISCORD.
  -- use { 'andweeb/presence.nvim' } -- Discord Rich Presence

  -- GAMES.
  -- use { 'zyedidia/vim-snake' }
  -- use { 'seandewar/nvimesweeper' }
  -- use { 'johngrib/vim-game-code-break' }

  -- Automatically set up your configuration after cloning 'packer.nvim'.
  if packer_bootstrap then
    require('packer').sync()
  end
end)
