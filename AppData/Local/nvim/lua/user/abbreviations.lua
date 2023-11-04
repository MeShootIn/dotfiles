-- TODO Buffer-local:
-- https://learnvimscriptthehardway.stevelosh.com/chapters/13.html
-- autocmd
-- ...
local function noreabbrev(mode, from, to)
  local cmd = '%snoreabbrev <expr> %s v:lua.dotfiles.abbrev.command("%s", "%s")'

  vim.cmd(cmd:format(mode, from, from, to))
end

-- inoreabbrev
local function ina(from, to)
  noreabbrev('i', from, to)
end

-- cnoreabbrev
local function cna(from, to)
  noreabbrev('c', from, to)
end

-- !noreabbrev (both 'i' and 'c')
local function ana(from, to)
  noreabbrev('!', from, to)
end
