# External Monitor Brightness
This is a simple script that allows you to change external Monitor Brightness on Linux. Add this script to your Linux "Keybinding" to make it work with your Keyboard Shortcut

Install 'ddcutil'
```bash
sudo pacman -S ddcutil
```

### Execute
```bash
chmod +x ~/.config/hypr/scripts/set_brightness.sh
```

### Keybinding (Example - Hyprland)
```bash
bind = , XF86MonBrightnessUp, exec, ~/.config/hypr/scripts/set_brightness.sh up HDMI
bind = , XF86MonBrightnessDown, exec, ~/.config/hypr/scripts/set_brightness.sh down HDMI
```
