@echo off

echo START...
echo:

REM Internet connection test.
ping www.google.com -n 1 -w 1000 > null

if errorlevel 1 (
  echo No internet connection!
) else (
  REM For better compatibility.
  cd %USERPROFILE%

  REM Git and others...
  call git update-git-for-windows -y
  call nvim -c "set shell=cmd | PlugUpgrade | PlugUpdate | PlugClean | qa"
  call heroku update

  REM Updating through other package managers.
  call choco upgrade all --yes
  call scoop update
  call scoop update --all
  call npm update --global

  REM Updating both Classic and Stable Yarn.
  call yarn set version classic
  call yarn global upgrade
  call yarn set version stable

  REM Utility activation.
  call "%USERPROFILE%/disable_caps_lock/on.bat"
)

echo:
echo END

pause
