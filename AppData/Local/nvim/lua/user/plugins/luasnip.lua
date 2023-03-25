local status_ok, ls = pcall(require, 'luasnip')
if not status_ok then
  vim.notify('Failed to load plugin "luasnip"')
  return
end

local status_ok, cmp = pcall(require, 'cmp')
if not status_ok then
  vim.notify('Failed to load plugin "cmp"')
  return
end

local has_words_before = function()
  local line, col = unpack(vim.api.nvim_win_get_cursor(0))
  return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match('%s') == nil
end

cmp.setup({
  -- ... Your other configuration ...
  mapping = {
    -- ... Your other mappings ...
    ['<Tab>'] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_next_item()
      elseif ls.expand_or_jumpable() then
        ls.expand_or_jump()
      elseif has_words_before() then
        cmp.complete()
      else
        fallback()
      end
    end, { 'i', 's' }),

    ['<S-Tab>'] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_prev_item()
      elseif ls.jumpable(-1) then
        ls.jump(-1)
      else
        fallback()
      end
    end, { 'i', 's' }),
    -- ... Your other mappings ...
  },
  -- ... Your other configuration ...
})
