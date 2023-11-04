local status_ok, _ = pcall(require, 'colorizer')
if not status_ok then
  vim.notify('Failed to load plugin "NvChad/nvim-colorizer.lua"')
  return
end

-- require('colorizer').setup()
require('colorizer').setup {
  filetypes = {
    'html',
    'css',
    'sass',
    'scss',
    'less',
    'javascript',
    'javascriptreact',
    'typescript',
    'typescriptreact',
  },
  user_default_options = {
    RRGGBBAA = true, -- #RRGGBBAA hex codes.
    AARRGGBB = true, -- 0xAARRGGBB hex codes.
    css = true, -- Enable all CSS features: RGB, RRGGBB, names, rgb_fn, hsl_fn.
    mode = 'background',
    tailwind = false, -- Enable tailwind colors
    -- Parsers can contain values used in `user_default_options`.
    sass = { enable = true, parsers = { 'css' }, }, -- Enable Sass colors.
    virtualtext = "■",
    always_update = false, -- Update color values even if buffer is not focused.
  },
}
