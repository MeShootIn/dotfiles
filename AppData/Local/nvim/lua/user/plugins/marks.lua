-- Normal mode:
-- mx              Set mark x
-- dmx             Delete mark x
-- m[0-9]          Add a bookmark (not eraseable by dm[0-9]): 0-9 == !@#-*().
-- dm[0-9]         Delete all bookmarks from bookmark group[0-9].
-- dm-             Delete all marks on the current line
-- dm<space>       Delete all marks in the current buffer
-- dm=             Delete the bookmark under the cursor.
-- m]              Move to next mark
-- m[              Move to previous mark
-- m:              Preview mark. This will prompt you for a specific mark to
--                 preview; press <cr> to preview the next mark.
--
-- CLI:
-- `:MarksListBuf` - fill the location list with all marks in the current
-- buffer.
-- `:MarksListGlobal` - fill the location list with all global marks in open
-- buffers.
-- `:MarksListAll` - fill the location list with all marks in all open buffers.
local status_ok, marks = pcall(require, 'marks')
if not status_ok then
  vim.notify('Failed to load plugin "chentoast/marks.nvim"')
  return
end

marks.setup {}
