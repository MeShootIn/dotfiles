local commands = {
  -- NOTE akinsho/bufferline.nvim => without "tabnew"
  -- zsh terminal.
  {
    'T',
    ":call ExecInShell('zsh', 'tabnew | terminal')",
    { desc = 'Open zsh terminal in new tab.' },
  },
  -- universal-ctags
  {
    'Ctags',
    '!ctags -R .',
    { desc = 'Generate file "tags".' },
  },
  -- tpope/vim-obsession
  {
    'MySession',
    ':Obsession .session.vim',
    { desc = 'Creating a Vim session using the "tpope/vim-obsession" plugin.' },
  },
}

for _, command in pairs(commands) do
  vim.api.nvim_create_user_command(command[1], command[2], command[3])
end
