META=$(hyprctl activeworkspace -j | jq '{id, tiledLayout}')

# Get current layout
CURRENT=$(echo "$META" | jq -r .tiledLayout)

if [ "$CURRENT" = "scrolling" ]; then
    NEW="monocle"
elif [ "$CURRENT" = "monocle" ]; then
    NEW="scrolling"
else
    notify-send --urgency low "Hyprland" "Cannot toggle from $CURRENT"
    return 0
fi

hyprctl keyword workspace "$(echo "$META" | jq .id), layout:$NEW"
