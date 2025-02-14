# Update Taskbar Icons Script

## Description

This PowerShell script updates the icons for pinned taskbar shortcuts based on custom icon files stored in a specified folder. If a matching icon file is found, it updates the shortcut's icon and restarts Windows Explorer to apply the changes.

This script is especially useful if the pinned shortcut displays the default unknown icon, and manually changing the icon does not work.

## Requirements

- Custom icons stored in `C:\CustomIcons` (or modify the script to point to another folder)

## Installation

1. Save the script as `update_taskbar_icons.ps1`.
2. Place your custom `.ico` files in `C:\CustomIcons`.

## Usage

1. Open **PowerShell** as Administrator.
2. If needed, allow script execution:
   ```powershell
   Set-ExecutionPolicy RemoteSigned -Scope CurrentUser
   ```
3. Navigate to the script's directory:
   ```powershell
   cd "C:\path\to\script"
   ```
4. Run the script:
   ```powershell
   .\update_taskbar_icons.ps1
   ```

## How It Works

- The script checks if the `C:\CustomIcons` folder exists.
- It scans the pinned taskbar shortcuts.
- If a matching `.ico` file exists for a shortcut, it updates the shortcut icon.
- Finally, it restarts Windows Explorer to apply changes.

## Notes

- Ensure that your `.ico` files have the ***exact same name*** as the corresponding application shortcuts.
- This script can resolve issues where pinned taskbar shortcuts revert to the default unknown icon, even after manually setting a custom icon.
