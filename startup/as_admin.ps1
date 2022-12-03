# TODO
# powershell "& $($pwd.Path)\kek.ps1"
# Start-Process powershell -Verb RunAs -ArgumentList "$($pwd.Path)\kek.ps1"
# Start-Process -Verb runas "$($pwd.Path)\kek.bat"
# Start-Process powershell -Verb RunAs -ArgumentList "$($pwd.Path)\kek.ps1"

Start-Process -Verb runas "$($pwd.Path)\startup.bat"
