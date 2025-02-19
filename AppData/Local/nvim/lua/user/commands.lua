local commands = {
  -- universal-ctags
  {
    'MyTags',
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
