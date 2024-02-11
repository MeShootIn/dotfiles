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

  REM Updating through other package managers.
  call choco upgrade all --yes
  call scoop update
  call scoop update --all
  call npm update --global

  REM Updating both Classic and Stable Yarn.
  call yarn set version stable
  call yarn set version classic
  call yarn global upgrade

  REM Cleanup apps by removing old versions.
  call scoop cleanup --all --global

  REM Git and others...
  call git update-git-for-windows -y
  call nvim -c "set shell=cmd | PlugUpgrade | PlugUpdate | PlugClean | qa"

  REM Saving package lists and package managers' configs to the corresponding
  REM files.
  call "%USERPROFILE%\startup\save_configs.bat"

  REM Utility activation.
  call "%USERPROFILE%\disable_caps_lock\on.bat"
)

echo:
echo END

pause
