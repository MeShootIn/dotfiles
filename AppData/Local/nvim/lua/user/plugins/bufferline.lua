local status_ok, _ = pcall(require, 'bufferline')
if not status_ok then
  vim.notify('Failed to load plugin "akinsho/bufferline.nvim"')
  return
end

local function mySplit(str, sep)
  if sep == nil then
    sep = "%s"
  end

  local t = {}

  for str in string.gmatch(str, "([^" .. sep .. "]+)") do
    table.insert(t, str)
  end

  return t
end

require('bufferline').setup {
  options = {
    offsets = {
      {
        filetype = 'NvimTree',
        text = function()
          local splitted = mySplit(vim.fn.getcwd(), '\\')

          return '/' .. splitted[#splitted] .. '/'
        end,
        highlight = 'Directory',
        text_align = 'center',
      }
    },
  }
}
