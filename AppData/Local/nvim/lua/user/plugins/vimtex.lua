-- Usage:
-- \ll - compile
-- \lt - TOC
-- FIXME \lv - forward search
-- FIXME \le - quickfix
--
-- Motions and Text Objects:
-- `[[`, `[]`, `][`, `]]` - move between [[sub]sub]section boundaries.
-- `(i/a)c` - Inner/Around Change.
-- `se` - Surrounding Environment (\begin{itemize} -> cse -> ...equation...).
-- NOTE Autocomplete for environments.
-- `tsd` - Toggle between `()` and `\left(`, `\left)` (same for `[]`).
-- `tse` - Toggle the `*` in environments.

-- LaTeX viewer options.
vim.g.tex_flavor = 'latex'
vim.g.vimtex_view_general_viewer = 'okular'
vim.g.vimtex_view_general_options = '--unique file:@pdf\\#src:@line@tex'
vim.g.vimtex_compiler_method = 'latexmk'
vim.g.vimtex_toc_config = { split_width = 40 }
vim.g.vimtex_quickfix_open_on_warning = 0
