-- PLUGIN SETTINGS ---
-- The command `:Prettier` by default is synchronous, but can also be forced
-- async.
vim.g['prettier#exec_cmd_async'] = 1
-- Prettier QuickFix window.
vim.g['prettier#quickfix_enabled'] = 0
vim.g['prettier#quickfix_auto_focus'] = 0



-- OVERWRITE DEFAULT PRETTIER CONFIGURATION ---
-- BUG Doesn't work with >2.3.1 (default version).

-- -- Max line length that prettier will wrap on: a number or 'auto' (use
-- -- textwidth).
-- vim.g['prettier#config#print_width'] = 80
-- -- Number of spaces per indentation level: a number or 'auto' (use softtabstop).
-- vim.g['prettier#config#tab_width'] = 2
-- -- Use tabs instead of spaces: true, false, or auto (use the expandtab setting).
-- vim.g['prettier#config#use_tabs'] = 'auto'
-- -- flow|babylon|typescript|css|less|scss|json|graphql|markdown or empty string
-- -- (let prettier choose).
-- vim.g['prettier#config#parser'] = ''
-- -- TODO cli-override|file-override|prefer-file
-- vim.g['prettier#config#config_precedence'] = 'file-override'
-- -- always|never|preserve
-- vim.g['prettier#config#prose_wrap'] = 'preserve'
-- -- TODO css|strict|ignore
-- vim.g['prettier#config#html_whitespace_sensitivity'] = 'css'
-- -- false|true
-- vim.g['prettier#config#require_pragma'] = false
-- -- Define the flavor of line endings.
-- -- lf|crlf|cr|all
-- vim.g['prettier#config#end_of_line'] = 'lf'

return {
  ft = {
    'css',
    'graphql',
    'html',
    'javascript',
    'json',
    'less',
    'lua',
    'markdown',
    'php',
    'ruby',
    'scss',
    'svelte',
    'typescript',
    'vue',
    'xml',
    'yaml',
  },
}
