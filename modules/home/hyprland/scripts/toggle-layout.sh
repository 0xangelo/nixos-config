META=$(hyprctl activeworkspace -j | jq '{id, tiledLayout}')

# Get current layout
CURRENT=$(echo "$META" | jq -r .tiledLayout)

if [ "$CURRENT" = "scrolling" ]; then
    hyprctl keyword general:layout monocle
    NEW="monocle"
    # notify-send --urgency low "Hyprland Layout" "Switched to Monocle" -t 1500  # Optional notification
elif [ "$CURRENT" = "monocle" ]; then
    hyprctl keyword general:layout scrolling
    NEW="scrolling"
    # notify-send --urgency "Hyprland Layout" "Switched to Scrolling" -t 1500
else
    # Fallback: switch to scrolling if on something else (dwindle/master)
    # hyprctl keyword general:layout scrolling
    notify-send --urgency low "Hyprland" "Cannot toggle from $CURRENT"
    return 0
fi

hyprctl keyword workspace "$(echo "$META" | jq .id), layout:$NEW"
