# Run "zsh" as default shell
if [ -t 1 ]; then
  exec zsh
fi
