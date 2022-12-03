local status_ok, todo_comments = pcall(require, 'todo-comments')
if not status_ok then
  vim.notify('Failed to load plugin "todo-comments"')
  return
end

todo_comments.setup {
  keywords = {
    FIXME = {
      icon = '', -- icon used for the sign, and in search results
      color = 'error', -- can be a hex color, or a named color (see below)
      alt = { 'FIX', 'BUG', 'FIXIT', 'ISSUE' }, -- a set of other keywords that
      -- all map to this keyword
    },
    DEBUG = {
      icon = '',
      color = 'hint',
    },
  },
  highlight = {
    pattern = [[.*<(KEYWORDS)\s*]], -- pattern or table of patterns, used for
    -- highlightng (vim regex)
  },
  search = {
    pattern = [[\b(KEYWORDS)\b]], -- match without the extra colon. You'll
    -- likely get false positives
  }
}
