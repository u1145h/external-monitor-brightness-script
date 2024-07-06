# External Monitor Brightness
This is a simple script that allows you to change external Monitor Brightness on Linux. Add this script to your Linux "Keybinding" to make it work with your Keyboard Shortcut

1. Install 'ddcutil'
```bash
sudo pacman -S ddcutil
```

2. Clone the repository and Copy/Move 'scripts' folder to your config folder
```bash
git clone https://github.com/u1145h/external-monitor-brightness-script
cd external-monitor-brightness-script/
```

3. Execute the Script File
```bash
chmod +x ~/.config/scripts/set_brightness.sh
```

### Add Your Custom Keybinding (Example - Hyprland)
```bash
bind = , XF86MonBrightnessUp, exec, ~/.config/scripts/set_brightness.sh up HDMI
bind = , XF86MonBrightnessDown, exec, ~/.config/scripts/set_brightness.sh down HDMI
```