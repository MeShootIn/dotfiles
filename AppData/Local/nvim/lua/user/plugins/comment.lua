local status_ok, comment = pcall(require, 'Comment')
if not status_ok then
  vim.notify('Failed to load plugin "numToStr/Comment.nvim"')
  return
end

-- 'gcA' - add comment at the end of line
-- Other usages: https://github.com/numToStr/Comment.nvim#-usage
comment.setup {
  ignore = '^$', -- ignore empty lines
  -- FIXME JoosepAlviste/nvim-ts-context-commentstring
  -- pre_hook = require('ts_context_commentstring.integrations.comment_nvim').create_pre_hook(),
}
