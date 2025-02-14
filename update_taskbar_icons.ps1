# Folder where custom icons are stored
$iconFolder = "C:\CustomIcons"

# Path to the pinned taskbar shortcuts on Windows
$taskbarShortcuts = "$env:APPDATA\Microsoft\Internet Explorer\Quick Launch\User Pinned\TaskBar"

# Check if the icon folder exists
if (!(Test-Path $iconFolder)) {
    Write-Host "The specified icon folder does not exist: $iconFolder"
    exit
}

# Loop through all pinned shortcuts
Get-ChildItem -Path $taskbarShortcuts -Filter "*.lnk" | ForEach-Object {
    $shortcutFile = $_.FullName
    $appName = $_.BaseName
    $iconFile = "$iconFolder\$appName.ico"

    if (Test-Path $iconFile) {
        # Update the shortcut's icon
        $shell = New-Object -ComObject WScript.Shell
        $shortcut = $shell.CreateShortcut($shortcutFile)
        $shortcut.IconLocation = $iconFile
        $shortcut.Save()
        Write-Host "Updated: $shortcutFile -> $iconFile"
    } else {
        Write-Host "No icon file found for: $appName"
    }
}

# Restart Explorer to apply changes
Stop-Process -Name explorer -Force
Start-Process explorer