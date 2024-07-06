#!/bin/bash

# Define paths to store the current brightness levels
BRIGHTNESS_FILE_HDMI="$HOME/.config/hypr/monitor_brightness_hdmi"
BRIGHTNESS_FILE_DP="$HOME/.config/hypr/monitor_brightness_dp"
STEP=5  # Percentage step for brightness adjustment

# Helper function to adjust brightness
adjust_brightness() {
    local monitor=$1
    local direction=$2
    local bus=$3
    local brightness_file=$4

    # Read the current brightness level
    if [ -f "$brightness_file" ]; then
        BRIGHTNESS=$(cat "$brightness_file")
    else
        BRIGHTNESS=50  # Default brightness level
    fi

    # Adjust the brightness level
    case "$direction" in
        up)
            BRIGHTNESS=$((BRIGHTNESS + STEP))
            if [ "$BRIGHTNESS" -gt 100 ]; then
                BRIGHTNESS=100
            fi
            ;;
        down)
            BRIGHTNESS=$((BRIGHTNESS - STEP))
            if [ "$BRIGHTNESS" -lt 0 ]; then
                BRIGHTNESS=0
            fi
            ;;
        *)
            echo "Usage: $0 {up|down} {HDMI|DP}"
            exit 1
            ;;
    esac

    # Set the new brightness level
    ddcutil setvcp 10 $BRIGHTNESS --bus $bus

    # Save the current brightness level
    echo $BRIGHTNESS > "$brightness_file"
}

# Check which monitor to adjust
case "$2" in
    HDMI)
        adjust_brightness "HDMI-A-1" "$1" 1 "$BRIGHTNESS_FILE_HDMI"
        ;;
# Extra Monitors
#    DP) 
#        adjust_brightness "DP-1" "$1" 2 "$BRIGHTNESS_FILE_DP"
#        ;;
    *)
        echo "Usage: $0 {up|down} {HDMI|DP}"
        exit 1
        ;;
esac
