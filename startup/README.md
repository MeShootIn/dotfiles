# startup

Startup script for Windows 10.

## Installation

1. Create a shortcut in your startup folder. Navigate to this folder
  - via the run dialogscreen (<kbd>Win</kbd> + <kbd>R</kbd>):
     ```
     shell:startup
     ```
  - or via `cmd`:
     ```cmd
     cd "%HOMEDRIVE%%HOMEPATH%\AppData\Roaming\Microsoft\Windows\Start Menu\Programs\Startup"
     ```

2. Set the path of this shortcut to:
   ```cmd
   %INSTALLATION_DIR%\startup\run_as_admin.bat
   ```
