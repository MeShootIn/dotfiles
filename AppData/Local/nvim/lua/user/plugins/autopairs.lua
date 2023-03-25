local status_ok, npairs = pcall(require, 'nvim-autopairs')
if not status_ok then
  vim.notify('Failed to load plugin "nvim-autopairs"')
  return
end

local Rule = require 'nvim-autopairs.rule'
local cond = require 'nvim-autopairs.conds'

npairs.setup {
  enable_check_bracket_line = false, -- Don't add pairs if it already has a
  -- close pair in the same line
  disable_filetype = { 'TelescopePrompt', 'NvimTree', 'packer' },
  check_ts = true,
  ts_config = {
    lua = { 'string', 'source' },
    javascript = { 'string', 'template_string' },
    java = false,
  },
  fast_wrap = {
    -- map = '<C-e>',
    map = '<Nop>',
    chars = { '{', '[', '(', '"', '\'', '`' },
    pattern = string.gsub([[ [%'%'%)%>%]%)%}%,] ]], '%s+', ''),
    offset = 0,
    end_key = '$',
    keys = 'qwertyuiopzxcvbnmasdfghjkl',
    check_comma = true,
    highlight = 'PmenuSel',
    highlight_grey = 'LineNr',
  },
}

-- If you want insert `(` after select function or method item
local cmp_autopairs = require 'nvim-autopairs.completion.cmp'

local cmp_status_ok, cmp = pcall(require, 'cmp')
if not cmp_status_ok then
  vim.notify('Failed to load plugin "cmp"')
  return
end

local handlers = require('nvim-autopairs.completion.handlers')

-- Mapping <CR>
cmp.event:on(
  'confirm_done',
  cmp_autopairs.on_confirm_done({
    filetypes = {
      -- "*" is a alias to all filetypes
      ["*"] = {
        ["("] = {
          kind = {
            cmp.lsp.CompletionItemKind.Function,
            cmp.lsp.CompletionItemKind.Method,
          },
          handler = handlers["*"]
        }
      },
      lua = {
        ["("] = {
          kind = {
            cmp.lsp.CompletionItemKind.Function,
            cmp.lsp.CompletionItemKind.Method
          },
          ---@param char string
          ---@param item item completion
          ---@param bufnr buffer number
          handler = function(char, item, bufnr)
            -- Your handler function. Inpect with print(vim.inspect{char, item, bufnr})
          end
        }
      },
      -- Disable for tex
      tex = false
    }
  })
)

-- https://github.com/windwp/nvim-autopairs/wiki/Custom-rules
npairs.add_rules {
  -- Add spaces between parentheses
  Rule(' ', ' ')
      :with_pair(function(opts)
        local pair = opts.line:sub(opts.col - 1, opts.col)
        return vim.tbl_contains({ '()', '[]', '{}' }, pair)
      end),
  Rule('( ', ' )')
      :with_pair(function() return false end)
      :with_move(function(opts)
        return opts.prev_char:match('.%)') ~= nil
      end)
      :use_key(')'),
  Rule('{ ', ' }')
      :with_pair(function() return false end)
      :with_move(function(opts)
        return opts.prev_char:match('.%}') ~= nil
      end)
      :use_key('}'),
  Rule('[ ', ' ]')
      :with_pair(function() return false end)
      :with_move(function(opts)
        return opts.prev_char:match('.%]') ~= nil
      end)
      :use_key(']'),
  -- Auto addspace on `=`
  Rule('=', '')
      :with_pair(cond.not_filetypes({ 'html', 'sh', 'bash', 'zsh', 'csh', 'tcsh', 'dash' }))
      :with_pair(cond.not_inside_quote())
      :with_pair(function(opts)
        local last_char = opts.line:sub(opts.col - 1, opts.col - 1)
        if last_char:match('[%w%=%s]') then
          return true
        end
        return false
      end)
      :replace_endpair(function(opts)
        local prev_2char = opts.line:sub(opts.col - 2, opts.col - 1)
        local next_char = opts.line:sub(opts.col, opts.col)
        next_char = next_char == ' ' and '' or ' '
        if prev_2char:match('%w$') then
          return '<bs> =' .. next_char
        end
        if prev_2char:match('%=$') then
          return next_char
        end
        if prev_2char:match('=') then
          return '<bs><bs>=' .. next_char
        end
        return ''
      end)
      :set_end_pair_length(0)
      :with_move(cond.none())
      :with_del(cond.none())
}
