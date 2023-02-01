-- Automatically generated packer.nvim plugin loader code

if vim.api.nvim_call_function('has', {'nvim-0.5'}) ~= 1 then
  vim.api.nvim_command('echohl WarningMsg | echom "Invalid Neovim version for packer.nvim! | echohl None"')
  return
end

vim.api.nvim_command('packadd packer.nvim')

local no_errors, error_msg = pcall(function()

_G._packer = _G._packer or {}
_G._packer.inside_compile = true

local time
local profile_info
local should_profile = false
if should_profile then
  local hrtime = vim.loop.hrtime
  profile_info = {}
  time = function(chunk, start)
    if start then
      profile_info[chunk] = hrtime()
    else
      profile_info[chunk] = (hrtime() - profile_info[chunk]) / 1e6
    end
  end
else
  time = function(chunk, start) end
end

local function save_profiles(threshold)
  local sorted_times = {}
  for chunk_name, time_taken in pairs(profile_info) do
    sorted_times[#sorted_times + 1] = {chunk_name, time_taken}
  end
  table.sort(sorted_times, function(a, b) return a[2] > b[2] end)
  local results = {}
  for i, elem in ipairs(sorted_times) do
    if not threshold or threshold and elem[2] > threshold then
      results[i] = elem[1] .. ' took ' .. elem[2] .. 'ms'
    end
  end
  if threshold then
    table.insert(results, '(Only showing plugins that took longer than ' .. threshold .. ' ms ' .. 'to load)')
  end

  _G._packer.profile_output = results
end

time([[Luarocks path setup]], true)
local package_path_str = "C:\\Users\\dmitr\\AppData\\Local\\Temp\\nvim\\packer_hererocks\\2.1.0-beta3\\share\\lua\\5.1\\?.lua;C:\\Users\\dmitr\\AppData\\Local\\Temp\\nvim\\packer_hererocks\\2.1.0-beta3\\share\\lua\\5.1\\?\\init.lua;C:\\Users\\dmitr\\AppData\\Local\\Temp\\nvim\\packer_hererocks\\2.1.0-beta3\\lib\\luarocks\\rocks-5.1\\?.lua;C:\\Users\\dmitr\\AppData\\Local\\Temp\\nvim\\packer_hererocks\\2.1.0-beta3\\lib\\luarocks\\rocks-5.1\\?\\init.lua"
local install_cpath_pattern = "C:\\Users\\dmitr\\AppData\\Local\\Temp\\nvim\\packer_hererocks\\2.1.0-beta3\\lib\\lua\\5.1\\?.so"
if not string.find(package.path, package_path_str, 1, true) then
  package.path = package.path .. ';' .. package_path_str
end

if not string.find(package.cpath, install_cpath_pattern, 1, true) then
  package.cpath = package.cpath .. ';' .. install_cpath_pattern
end

time([[Luarocks path setup]], false)
time([[try_loadstring definition]], true)
local function try_loadstring(s, component, name)
  local success, result = pcall(loadstring(s), name, _G.packer_plugins[name])
  if not success then
    vim.schedule(function()
      vim.api.nvim_notify('packer.nvim: Error running ' .. component .. ' for ' .. name .. ': ' .. result, vim.log.levels.ERROR, {})
    end)
  end
  return result
end

time([[try_loadstring definition]], false)
time([[Defining packer_plugins]], true)
_G.packer_plugins = {
  ["Comment.nvim"] = {
    loaded = true,
    path = "C:\\Users\\dmitr\\AppData\\Local\\nvim-data\\site\\pack\\packer\\start\\Comment.nvim",
    url = "https://github.com/numToStr/Comment.nvim"
  },
  LuaSnip = {
    loaded = true,
    path = "C:\\Users\\dmitr\\AppData\\Local\\nvim-data\\site\\pack\\packer\\start\\LuaSnip",
    url = "https://github.com/L3MON4D3/LuaSnip"
  },
  ReplaceWithRegister = {
    loaded = true,
    path = "C:\\Users\\dmitr\\AppData\\Local\\nvim-data\\site\\pack\\packer\\start\\ReplaceWithRegister",
    url = "https://github.com/vim-scripts/ReplaceWithRegister"
  },
  ["argtextobj.vim"] = {
    loaded = true,
    path = "C:\\Users\\dmitr\\AppData\\Local\\nvim-data\\site\\pack\\packer\\start\\argtextobj.vim",
    url = "https://github.com/vim-scripts/argtextobj.vim"
  },
  ["auto-save.nvim"] = {
    loaded = true,
    path = "C:\\Users\\dmitr\\AppData\\Local\\nvim-data\\site\\pack\\packer\\start\\auto-save.nvim",
    url = "https://github.com/pocco81/auto-save.nvim"
  },
  ["cmp-buffer"] = {
    loaded = true,
    path = "C:\\Users\\dmitr\\AppData\\Local\\nvim-data\\site\\pack\\packer\\start\\cmp-buffer",
    url = "https://github.com/hrsh7th/cmp-buffer"
  },
  ["cmp-cmdline"] = {
    loaded = true,
    path = "C:\\Users\\dmitr\\AppData\\Local\\nvim-data\\site\\pack\\packer\\start\\cmp-cmdline",
    url = "https://github.com/hrsh7th/cmp-cmdline"
  },
  ["cmp-nvim-lsp"] = {
    loaded = true,
    path = "C:\\Users\\dmitr\\AppData\\Local\\nvim-data\\site\\pack\\packer\\start\\cmp-nvim-lsp",
    url = "https://github.com/hrsh7th/cmp-nvim-lsp"
  },
  ["cmp-nvim-lua"] = {
    loaded = true,
    path = "C:\\Users\\dmitr\\AppData\\Local\\nvim-data\\site\\pack\\packer\\start\\cmp-nvim-lua",
    url = "https://github.com/hrsh7th/cmp-nvim-lua"
  },
  ["cmp-path"] = {
    loaded = true,
    path = "C:\\Users\\dmitr\\AppData\\Local\\nvim-data\\site\\pack\\packer\\start\\cmp-path",
    url = "https://github.com/hrsh7th/cmp-path"
  },
  cmp_luasnip = {
    loaded = true,
    path = "C:\\Users\\dmitr\\AppData\\Local\\nvim-data\\site\\pack\\packer\\start\\cmp_luasnip",
    url = "https://github.com/saadparwaiz1/cmp_luasnip"
  },
  ["editorconfig-vim"] = {
    loaded = true,
    path = "C:\\Users\\dmitr\\AppData\\Local\\nvim-data\\site\\pack\\packer\\start\\editorconfig-vim",
    url = "https://github.com/editorconfig/editorconfig-vim"
  },
  ["friendly-snippets"] = {
    loaded = true,
    path = "C:\\Users\\dmitr\\AppData\\Local\\nvim-data\\site\\pack\\packer\\start\\friendly-snippets",
    url = "https://github.com/rafamadriz/friendly-snippets"
  },
  ["github-url-opener"] = {
    loaded = true,
    path = "C:\\Users\\dmitr\\AppData\\Local\\nvim-data\\site\\pack\\packer\\start\\github-url-opener",
    url = "C:\\Users\\dmitr\\nvim-plugins\\github-url-opener\\"
  },
  ["gitsigns.nvim"] = {
    loaded = true,
    path = "C:\\Users\\dmitr\\AppData\\Local\\nvim-data\\site\\pack\\packer\\start\\gitsigns.nvim",
    url = "https://github.com/lewis6991/gitsigns.nvim"
  },
  ["impatient.nvim"] = {
    loaded = true,
    path = "C:\\Users\\dmitr\\AppData\\Local\\nvim-data\\site\\pack\\packer\\start\\impatient.nvim",
    url = "https://github.com/lewis6991/impatient.nvim"
  },
  ["indent-blankline.nvim"] = {
    loaded = true,
    path = "C:\\Users\\dmitr\\AppData\\Local\\nvim-data\\site\\pack\\packer\\start\\indent-blankline.nvim",
    url = "https://github.com/lukas-reineke/indent-blankline.nvim"
  },
  ["lualine.nvim"] = {
    loaded = true,
    path = "C:\\Users\\dmitr\\AppData\\Local\\nvim-data\\site\\pack\\packer\\start\\lualine.nvim",
    url = "https://github.com/nvim-lualine/lualine.nvim"
  },
  ["markdown-preview.nvim"] = {
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "C:\\Users\\dmitr\\AppData\\Local\\nvim-data\\site\\pack\\packer\\opt\\markdown-preview.nvim",
    url = "https://github.com/iamcco/markdown-preview.nvim"
  },
  ["marks.nvim"] = {
    loaded = true,
    path = "C:\\Users\\dmitr\\AppData\\Local\\nvim-data\\site\\pack\\packer\\start\\marks.nvim",
    url = "https://github.com/chentoast/marks.nvim"
  },
  ["my-formatter"] = {
    loaded = true,
    path = "C:\\Users\\dmitr\\AppData\\Local\\nvim-data\\site\\pack\\packer\\start\\my-formatter",
    url = "C:\\Users\\dmitr\\nvim-plugins\\my-formatter\\"
  },
  ["nvim-autopairs"] = {
    loaded = true,
    path = "C:\\Users\\dmitr\\AppData\\Local\\nvim-data\\site\\pack\\packer\\start\\nvim-autopairs",
    url = "https://github.com/windwp/nvim-autopairs"
  },
  ["nvim-cmp"] = {
    loaded = true,
    path = "C:\\Users\\dmitr\\AppData\\Local\\nvim-data\\site\\pack\\packer\\start\\nvim-cmp",
    url = "https://github.com/hrsh7th/nvim-cmp"
  },
  ["nvim-lsp-installer"] = {
    loaded = true,
    path = "C:\\Users\\dmitr\\AppData\\Local\\nvim-data\\site\\pack\\packer\\start\\nvim-lsp-installer",
    url = "https://github.com/williamboman/nvim-lsp-installer"
  },
  ["nvim-lspconfig"] = {
    loaded = true,
    path = "C:\\Users\\dmitr\\AppData\\Local\\nvim-data\\site\\pack\\packer\\start\\nvim-lspconfig",
    url = "https://github.com/neovim/nvim-lspconfig"
  },
  ["nvim-scrollview"] = {
    loaded = true,
    path = "C:\\Users\\dmitr\\AppData\\Local\\nvim-data\\site\\pack\\packer\\start\\nvim-scrollview",
    url = "https://github.com/dstein64/nvim-scrollview"
  },
  ["nvim-treesitter"] = {
    loaded = true,
    path = "C:\\Users\\dmitr\\AppData\\Local\\nvim-data\\site\\pack\\packer\\start\\nvim-treesitter",
    url = "https://github.com/nvim-treesitter/nvim-treesitter"
  },
  ["nvim-ts-context-commentstring"] = {
    loaded = true,
    path = "C:\\Users\\dmitr\\AppData\\Local\\nvim-data\\site\\pack\\packer\\start\\nvim-ts-context-commentstring",
    url = "https://github.com/JoosepAlviste/nvim-ts-context-commentstring"
  },
  ["nvim-web-devicons"] = {
    loaded = false,
    needs_bufread = false,
    path = "C:\\Users\\dmitr\\AppData\\Local\\nvim-data\\site\\pack\\packer\\opt\\nvim-web-devicons",
    url = "https://github.com/kyazdani42/nvim-web-devicons"
  },
  nvimesweeper = {
    loaded = true,
    path = "C:\\Users\\dmitr\\AppData\\Local\\nvim-data\\site\\pack\\packer\\start\\nvimesweeper",
    url = "https://github.com/seandewar/nvimesweeper"
  },
  ["packer.nvim"] = {
    loaded = true,
    path = "C:\\Users\\dmitr\\AppData\\Local\\nvim-data\\site\\pack\\packer\\start\\packer.nvim",
    url = "https://github.com/wbthomason/packer.nvim"
  },
  ["plenary.nvim"] = {
    loaded = true,
    path = "C:\\Users\\dmitr\\AppData\\Local\\nvim-data\\site\\pack\\packer\\start\\plenary.nvim",
    url = "https://github.com/nvim-lua/plenary.nvim"
  },
  ["presence.nvim"] = {
    loaded = true,
    path = "C:\\Users\\dmitr\\AppData\\Local\\nvim-data\\site\\pack\\packer\\start\\presence.nvim",
    url = "https://github.com/andweeb/presence.nvim"
  },
  ["readme-diff"] = {
    loaded = true,
    path = "C:\\Users\\dmitr\\AppData\\Local\\nvim-data\\site\\pack\\packer\\start\\readme-diff",
    url = "C:\\Users\\dmitr\\nvim-plugins\\readme-diff\\"
  },
  ["targets.vim"] = {
    loaded = true,
    path = "C:\\Users\\dmitr\\AppData\\Local\\nvim-data\\site\\pack\\packer\\start\\targets.vim",
    url = "https://github.com/wellle/targets.vim"
  },
  ["telescope-fzf-native.nvim"] = {
    loaded = true,
    path = "C:\\Users\\dmitr\\AppData\\Local\\nvim-data\\site\\pack\\packer\\start\\telescope-fzf-native.nvim",
    url = "https://github.com/nvim-telescope/telescope-fzf-native.nvim"
  },
  ["telescope.nvim"] = {
    loaded = true,
    path = "C:\\Users\\dmitr\\AppData\\Local\\nvim-data\\site\\pack\\packer\\start\\telescope.nvim",
    url = "https://github.com/nvim-telescope/telescope.nvim"
  },
  ["todo-comments.nvim"] = {
    loaded = true,
    path = "C:\\Users\\dmitr\\AppData\\Local\\nvim-data\\site\\pack\\packer\\start\\todo-comments.nvim",
    url = "https://github.com/folke/todo-comments.nvim"
  },
  ["vim-apathy"] = {
    loaded = true,
    path = "C:\\Users\\dmitr\\AppData\\Local\\nvim-data\\site\\pack\\packer\\start\\vim-apathy",
    url = "https://github.com/tpope/vim-apathy"
  },
  ["vim-better-whitespace"] = {
    loaded = true,
    path = "C:\\Users\\dmitr\\AppData\\Local\\nvim-data\\site\\pack\\packer\\start\\vim-better-whitespace",
    url = "https://github.com/ntpeters/vim-better-whitespace"
  },
  ["vim-dirvish"] = {
    loaded = true,
    path = "C:\\Users\\dmitr\\AppData\\Local\\nvim-data\\site\\pack\\packer\\start\\vim-dirvish",
    url = "https://github.com/justinmk/vim-dirvish"
  },
  ["vim-dirvish-dovish"] = {
    loaded = true,
    path = "C:\\Users\\dmitr\\AppData\\Local\\nvim-data\\site\\pack\\packer\\start\\vim-dirvish-dovish",
    url = "https://github.com/roginfarrer/vim-dirvish-dovish"
  },
  ["vim-dispatch"] = {
    loaded = true,
    path = "C:\\Users\\dmitr\\AppData\\Local\\nvim-data\\site\\pack\\packer\\start\\vim-dispatch",
    url = "https://github.com/tpope/vim-dispatch"
  },
  ["vim-dotenv"] = {
    loaded = true,
    path = "C:\\Users\\dmitr\\AppData\\Local\\nvim-data\\site\\pack\\packer\\start\\vim-dotenv",
    url = "https://github.com/tpope/vim-dotenv"
  },
  ["vim-endwise"] = {
    loaded = true,
    path = "C:\\Users\\dmitr\\AppData\\Local\\nvim-data\\site\\pack\\packer\\start\\vim-endwise",
    url = "https://github.com/tpope/vim-endwise"
  },
  ["vim-exchange"] = {
    loaded = true,
    path = "C:\\Users\\dmitr\\AppData\\Local\\nvim-data\\site\\pack\\packer\\start\\vim-exchange",
    url = "https://github.com/tommcdo/vim-exchange"
  },
  ["vim-game-code-break"] = {
    loaded = true,
    path = "C:\\Users\\dmitr\\AppData\\Local\\nvim-data\\site\\pack\\packer\\start\\vim-game-code-break",
    url = "https://github.com/johngrib/vim-game-code-break"
  },
  ["vim-indent-object"] = {
    loaded = true,
    path = "C:\\Users\\dmitr\\AppData\\Local\\nvim-data\\site\\pack\\packer\\start\\vim-indent-object",
    url = "https://github.com/michaeljsmith/vim-indent-object"
  },
  ["vim-lastplace"] = {
    loaded = true,
    path = "C:\\Users\\dmitr\\AppData\\Local\\nvim-data\\site\\pack\\packer\\start\\vim-lastplace",
    url = "https://github.com/farmergreg/vim-lastplace"
  },
  ["vim-markdown"] = {
    loaded = true,
    path = "C:\\Users\\dmitr\\AppData\\Local\\nvim-data\\site\\pack\\packer\\start\\vim-markdown",
    url = "https://github.com/tpope/vim-markdown"
  },
  ["vim-obsession"] = {
    loaded = true,
    path = "C:\\Users\\dmitr\\AppData\\Local\\nvim-data\\site\\pack\\packer\\start\\vim-obsession",
    url = "https://github.com/tpope/vim-obsession"
  },
  ["vim-paragraph-motion"] = {
    loaded = true,
    path = "C:\\Users\\dmitr\\AppData\\Local\\nvim-data\\site\\pack\\packer\\start\\vim-paragraph-motion",
    url = "https://github.com/dbakker/vim-paragraph-motion"
  },
  ["vim-plugin-ruscmd"] = {
    loaded = true,
    path = "C:\\Users\\dmitr\\AppData\\Local\\nvim-data\\site\\pack\\packer\\start\\vim-plugin-ruscmd",
    url = "https://github.com/powerman/vim-plugin-ruscmd"
  },
  ["vim-prettier"] = {
    loaded = false,
    needs_bufread = true,
    only_cond = false,
    path = "C:\\Users\\dmitr\\AppData\\Local\\nvim-data\\site\\pack\\packer\\opt\\vim-prettier",
    url = "https://github.com/prettier/vim-prettier"
  },
  ["vim-repeat"] = {
    loaded = true,
    path = "C:\\Users\\dmitr\\AppData\\Local\\nvim-data\\site\\pack\\packer\\start\\vim-repeat",
    url = "https://github.com/tpope/vim-repeat"
  },
  ["vim-searchindex"] = {
    loaded = true,
    path = "C:\\Users\\dmitr\\AppData\\Local\\nvim-data\\site\\pack\\packer\\start\\vim-searchindex",
    url = "https://github.com/google/vim-searchindex"
  },
  ["vim-sensible"] = {
    loaded = true,
    path = "C:\\Users\\dmitr\\AppData\\Local\\nvim-data\\site\\pack\\packer\\start\\vim-sensible",
    url = "https://github.com/tpope/vim-sensible"
  },
  ["vim-snake"] = {
    loaded = true,
    path = "C:\\Users\\dmitr\\AppData\\Local\\nvim-data\\site\\pack\\packer\\start\\vim-snake",
    url = "https://github.com/zyedidia/vim-snake"
  },
  ["vim-sneak"] = {
    loaded = true,
    path = "C:\\Users\\dmitr\\AppData\\Local\\nvim-data\\site\\pack\\packer\\start\\vim-sneak",
    url = "https://github.com/justinmk/vim-sneak"
  },
  ["vim-surround"] = {
    loaded = true,
    path = "C:\\Users\\dmitr\\AppData\\Local\\nvim-data\\site\\pack\\packer\\start\\vim-surround",
    url = "https://github.com/tpope/vim-surround"
  },
  ["vim-textobj-comment"] = {
    loaded = true,
    path = "C:\\Users\\dmitr\\AppData\\Local\\nvim-data\\site\\pack\\packer\\start\\vim-textobj-comment",
    url = "https://github.com/glts/vim-textobj-comment"
  },
  ["vim-textobj-entire"] = {
    loaded = true,
    path = "C:\\Users\\dmitr\\AppData\\Local\\nvim-data\\site\\pack\\packer\\start\\vim-textobj-entire",
    url = "https://github.com/kana/vim-textobj-entire"
  },
  ["vim-textobj-line"] = {
    loaded = true,
    path = "C:\\Users\\dmitr\\AppData\\Local\\nvim-data\\site\\pack\\packer\\start\\vim-textobj-line",
    url = "https://github.com/kana/vim-textobj-line"
  },
  ["vim-textobj-user"] = {
    loaded = true,
    path = "C:\\Users\\dmitr\\AppData\\Local\\nvim-data\\site\\pack\\packer\\start\\vim-textobj-user",
    url = "https://github.com/kana/vim-textobj-user"
  },
  ["vim-unimpaired"] = {
    loaded = true,
    path = "C:\\Users\\dmitr\\AppData\\Local\\nvim-data\\site\\pack\\packer\\start\\vim-unimpaired",
    url = "https://github.com/tpope/vim-unimpaired"
  },
  vimtex = {
    loaded = true,
    path = "C:\\Users\\dmitr\\AppData\\Local\\nvim-data\\site\\pack\\packer\\start\\vimtex",
    url = "https://github.com/lervag/vimtex"
  }
}

time([[Defining packer_plugins]], false)
-- Setup for: markdown-preview.nvim
time([[Setup for markdown-preview.nvim]], true)
try_loadstring("\27LJ\2\n=\0\0\2\0\4\0\0056\0\0\0009\0\1\0005\1\3\0=\1\2\0K\0\1\0\1\2\0\0\rmarkdown\19mkdp_filetypes\6g\bvim\0", "setup", "markdown-preview.nvim")
time([[Setup for markdown-preview.nvim]], false)
vim.cmd [[augroup packer_load_aucmds]]
vim.cmd [[au!]]
  -- Filetype lazy-loads
time([[Defining lazy-load filetype autocommands]], true)
vim.cmd [[au FileType typescriptreact ++once lua require("packer.load")({'vim-prettier'}, { ft = "typescriptreact" }, _G.packer_plugins)]]
vim.cmd [[au FileType less ++once lua require("packer.load")({'vim-prettier'}, { ft = "less" }, _G.packer_plugins)]]
vim.cmd [[au FileType svelte ++once lua require("packer.load")({'vim-prettier'}, { ft = "svelte" }, _G.packer_plugins)]]
vim.cmd [[au FileType vue ++once lua require("packer.load")({'vim-prettier'}, { ft = "vue" }, _G.packer_plugins)]]
vim.cmd [[au FileType markdown ++once lua require("packer.load")({'vim-prettier', 'markdown-preview.nvim'}, { ft = "markdown" }, _G.packer_plugins)]]
vim.cmd [[au FileType yaml ++once lua require("packer.load")({'vim-prettier'}, { ft = "yaml" }, _G.packer_plugins)]]
vim.cmd [[au FileType html ++once lua require("packer.load")({'vim-prettier'}, { ft = "html" }, _G.packer_plugins)]]
vim.cmd [[au FileType graphql ++once lua require("packer.load")({'vim-prettier'}, { ft = "graphql" }, _G.packer_plugins)]]
vim.cmd [[au FileType scss ++once lua require("packer.load")({'vim-prettier'}, { ft = "scss" }, _G.packer_plugins)]]
vim.cmd [[au FileType javascript ++once lua require("packer.load")({'vim-prettier'}, { ft = "javascript" }, _G.packer_plugins)]]
vim.cmd [[au FileType css ++once lua require("packer.load")({'vim-prettier'}, { ft = "css" }, _G.packer_plugins)]]
vim.cmd [[au FileType json ++once lua require("packer.load")({'vim-prettier'}, { ft = "json" }, _G.packer_plugins)]]
vim.cmd [[au FileType typescript ++once lua require("packer.load")({'vim-prettier'}, { ft = "typescript" }, _G.packer_plugins)]]
time([[Defining lazy-load filetype autocommands]], false)
vim.cmd("augroup END")
vim.cmd [[augroup filetypedetect]]
time([[Sourcing ftdetect script at: C:\Users\dmitr\AppData\Local\nvim-data\site\pack\packer\opt\vim-prettier\ftdetect\css.vim]], true)
vim.cmd [[source C:\Users\dmitr\AppData\Local\nvim-data\site\pack\packer\opt\vim-prettier\ftdetect\css.vim]]
time([[Sourcing ftdetect script at: C:\Users\dmitr\AppData\Local\nvim-data\site\pack\packer\opt\vim-prettier\ftdetect\css.vim]], false)
time([[Sourcing ftdetect script at: C:\Users\dmitr\AppData\Local\nvim-data\site\pack\packer\opt\vim-prettier\ftdetect\graphql.vim]], true)
vim.cmd [[source C:\Users\dmitr\AppData\Local\nvim-data\site\pack\packer\opt\vim-prettier\ftdetect\graphql.vim]]
time([[Sourcing ftdetect script at: C:\Users\dmitr\AppData\Local\nvim-data\site\pack\packer\opt\vim-prettier\ftdetect\graphql.vim]], false)
time([[Sourcing ftdetect script at: C:\Users\dmitr\AppData\Local\nvim-data\site\pack\packer\opt\vim-prettier\ftdetect\html.vim]], true)
vim.cmd [[source C:\Users\dmitr\AppData\Local\nvim-data\site\pack\packer\opt\vim-prettier\ftdetect\html.vim]]
time([[Sourcing ftdetect script at: C:\Users\dmitr\AppData\Local\nvim-data\site\pack\packer\opt\vim-prettier\ftdetect\html.vim]], false)
time([[Sourcing ftdetect script at: C:\Users\dmitr\AppData\Local\nvim-data\site\pack\packer\opt\vim-prettier\ftdetect\javascript.vim]], true)
vim.cmd [[source C:\Users\dmitr\AppData\Local\nvim-data\site\pack\packer\opt\vim-prettier\ftdetect\javascript.vim]]
time([[Sourcing ftdetect script at: C:\Users\dmitr\AppData\Local\nvim-data\site\pack\packer\opt\vim-prettier\ftdetect\javascript.vim]], false)
time([[Sourcing ftdetect script at: C:\Users\dmitr\AppData\Local\nvim-data\site\pack\packer\opt\vim-prettier\ftdetect\json.vim]], true)
vim.cmd [[source C:\Users\dmitr\AppData\Local\nvim-data\site\pack\packer\opt\vim-prettier\ftdetect\json.vim]]
time([[Sourcing ftdetect script at: C:\Users\dmitr\AppData\Local\nvim-data\site\pack\packer\opt\vim-prettier\ftdetect\json.vim]], false)
time([[Sourcing ftdetect script at: C:\Users\dmitr\AppData\Local\nvim-data\site\pack\packer\opt\vim-prettier\ftdetect\less.vim]], true)
vim.cmd [[source C:\Users\dmitr\AppData\Local\nvim-data\site\pack\packer\opt\vim-prettier\ftdetect\less.vim]]
time([[Sourcing ftdetect script at: C:\Users\dmitr\AppData\Local\nvim-data\site\pack\packer\opt\vim-prettier\ftdetect\less.vim]], false)
time([[Sourcing ftdetect script at: C:\Users\dmitr\AppData\Local\nvim-data\site\pack\packer\opt\vim-prettier\ftdetect\lua.vim]], true)
vim.cmd [[source C:\Users\dmitr\AppData\Local\nvim-data\site\pack\packer\opt\vim-prettier\ftdetect\lua.vim]]
time([[Sourcing ftdetect script at: C:\Users\dmitr\AppData\Local\nvim-data\site\pack\packer\opt\vim-prettier\ftdetect\lua.vim]], false)
time([[Sourcing ftdetect script at: C:\Users\dmitr\AppData\Local\nvim-data\site\pack\packer\opt\vim-prettier\ftdetect\markdown.vim]], true)
vim.cmd [[source C:\Users\dmitr\AppData\Local\nvim-data\site\pack\packer\opt\vim-prettier\ftdetect\markdown.vim]]
time([[Sourcing ftdetect script at: C:\Users\dmitr\AppData\Local\nvim-data\site\pack\packer\opt\vim-prettier\ftdetect\markdown.vim]], false)
time([[Sourcing ftdetect script at: C:\Users\dmitr\AppData\Local\nvim-data\site\pack\packer\opt\vim-prettier\ftdetect\php.vim]], true)
vim.cmd [[source C:\Users\dmitr\AppData\Local\nvim-data\site\pack\packer\opt\vim-prettier\ftdetect\php.vim]]
time([[Sourcing ftdetect script at: C:\Users\dmitr\AppData\Local\nvim-data\site\pack\packer\opt\vim-prettier\ftdetect\php.vim]], false)
time([[Sourcing ftdetect script at: C:\Users\dmitr\AppData\Local\nvim-data\site\pack\packer\opt\vim-prettier\ftdetect\ruby.vim]], true)
vim.cmd [[source C:\Users\dmitr\AppData\Local\nvim-data\site\pack\packer\opt\vim-prettier\ftdetect\ruby.vim]]
time([[Sourcing ftdetect script at: C:\Users\dmitr\AppData\Local\nvim-data\site\pack\packer\opt\vim-prettier\ftdetect\ruby.vim]], false)
time([[Sourcing ftdetect script at: C:\Users\dmitr\AppData\Local\nvim-data\site\pack\packer\opt\vim-prettier\ftdetect\scss.vim]], true)
vim.cmd [[source C:\Users\dmitr\AppData\Local\nvim-data\site\pack\packer\opt\vim-prettier\ftdetect\scss.vim]]
time([[Sourcing ftdetect script at: C:\Users\dmitr\AppData\Local\nvim-data\site\pack\packer\opt\vim-prettier\ftdetect\scss.vim]], false)
time([[Sourcing ftdetect script at: C:\Users\dmitr\AppData\Local\nvim-data\site\pack\packer\opt\vim-prettier\ftdetect\svelte.vim]], true)
vim.cmd [[source C:\Users\dmitr\AppData\Local\nvim-data\site\pack\packer\opt\vim-prettier\ftdetect\svelte.vim]]
time([[Sourcing ftdetect script at: C:\Users\dmitr\AppData\Local\nvim-data\site\pack\packer\opt\vim-prettier\ftdetect\svelte.vim]], false)
time([[Sourcing ftdetect script at: C:\Users\dmitr\AppData\Local\nvim-data\site\pack\packer\opt\vim-prettier\ftdetect\typescript.vim]], true)
vim.cmd [[source C:\Users\dmitr\AppData\Local\nvim-data\site\pack\packer\opt\vim-prettier\ftdetect\typescript.vim]]
time([[Sourcing ftdetect script at: C:\Users\dmitr\AppData\Local\nvim-data\site\pack\packer\opt\vim-prettier\ftdetect\typescript.vim]], false)
time([[Sourcing ftdetect script at: C:\Users\dmitr\AppData\Local\nvim-data\site\pack\packer\opt\vim-prettier\ftdetect\vue.vim]], true)
vim.cmd [[source C:\Users\dmitr\AppData\Local\nvim-data\site\pack\packer\opt\vim-prettier\ftdetect\vue.vim]]
time([[Sourcing ftdetect script at: C:\Users\dmitr\AppData\Local\nvim-data\site\pack\packer\opt\vim-prettier\ftdetect\vue.vim]], false)
time([[Sourcing ftdetect script at: C:\Users\dmitr\AppData\Local\nvim-data\site\pack\packer\opt\vim-prettier\ftdetect\xml.vim]], true)
vim.cmd [[source C:\Users\dmitr\AppData\Local\nvim-data\site\pack\packer\opt\vim-prettier\ftdetect\xml.vim]]
time([[Sourcing ftdetect script at: C:\Users\dmitr\AppData\Local\nvim-data\site\pack\packer\opt\vim-prettier\ftdetect\xml.vim]], false)
time([[Sourcing ftdetect script at: C:\Users\dmitr\AppData\Local\nvim-data\site\pack\packer\opt\vim-prettier\ftdetect\yaml.vim]], true)
vim.cmd [[source C:\Users\dmitr\AppData\Local\nvim-data\site\pack\packer\opt\vim-prettier\ftdetect\yaml.vim]]
time([[Sourcing ftdetect script at: C:\Users\dmitr\AppData\Local\nvim-data\site\pack\packer\opt\vim-prettier\ftdetect\yaml.vim]], false)
vim.cmd("augroup END")

_G._packer.inside_compile = false
if _G._packer.needs_bufread == true then
  vim.cmd("doautocmd BufRead")
end
_G._packer.needs_bufread = false

if should_profile then save_profiles() end

end)

if not no_errors then
  error_msg = error_msg:gsub('"', '\\"')
  vim.api.nvim_command('echohl ErrorMsg | echom "Error in packer_compiled: '..error_msg..'" | echom "Please check your config for correctness" | echohl None')
end
