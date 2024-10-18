@echo off

echo START...
echo:

REM Internet connection test.
ping www.google.com -n 1 -w 1000 > null

if %ERRORLEVEL% neq 0 (
  echo No internet connection!
) else (
  REM To prevent possible errors.
  cd %USERPROFILE%

  REM Updating packages and package managers themselves.
  call choco upgrade all --yes
  call scoop update
  call scoop update --all
  call npm update --global
  call yarn set version stable
  call yarn set version classic
  call yarn global upgrade

  REM Updating utilities natively.
  call git update-git-for-windows -y
  call nvim -c "set shell=cmd | PlugUpgrade | PlugUpdate | PlugClean | qa"

  REM Cleanup apps.
  call scoop cleanup --all --global
  del "%USERPROFILE%\AppData\Local\nvim-data\shada\main.shada.tmp.*"

  REM Saving package lists and package managers' configs to the corresponding
  REM files.
  call "%USERPROFILE%\startup\save_configs.bat"

  REM Utilities activation.
  call "%USERPROFILE%\disable_caps_lock\on.bat"
)

echo:
echo END

pause
