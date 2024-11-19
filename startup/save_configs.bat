@echo off

REM This is the folder where the configs and lists of installed applications
REM will be stored.
set MY_CONFIGS_DIR="%USERPROFILE%\.config\my-configs\"

if not exist %MY_CONFIGS_DIR% (
  mkdir %MY_CONFIGS_DIR%
)

set ORIGINAL_DIR="%CD%"
cd %MY_CONFIGS_DIR%

REM Scoop and others...
call scoop export>scoop.json
call npm list --global --depth=0 --json>npm.json

REM Chocolatey installed packages.
set CHOCO_PACKAGES_CONFIG="packages.config"

if exist %MY_CONFIGS_DIR% (
  del %CHOCO_PACKAGES_CONFIG%
)

call choco export --output-file-path=%CHOCO_PACKAGES_CONFIG% --include-version-numbers

cd %ORIGINAL_DIR%
