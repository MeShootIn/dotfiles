@echo off

echo START...
echo:

Ping www.google.com -n 1 -w 1000 > null

if errorlevel 1 (
  echo No internet connection!
) else (
  call "%USERPROFILE%/disable_caps_lock/on.bat"
  call nvim -c "PlugUpgrade | PlugUpdate | PlugClean | qa"
  call git update-git-for-windows -y
  call choco upgrade all -y
  call scoop update '*'
  call npm update -g
  call yarn global upgrade
)

echo:
echo END

pause
