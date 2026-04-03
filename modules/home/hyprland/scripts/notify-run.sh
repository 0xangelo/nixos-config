# Usage: notify-run [notify-send options/args] -- <command> [args...]

# Split args on --
cmd_args=()
notify_args=()
found_sep=false

for arg in "$@"; do
    if [[ "$arg" == "--" && "$found_sep" == false ]]; then
        found_sep=true
    elif [[ "$found_sep" == true ]]; then
        cmd_args+=("$arg")
    else
        notify_args+=("$arg")
    fi
done

if [[ "$found_sep" == false || ${#cmd_args[@]} -eq 0 ]]; then
    echo "Usage: notify-run [notify-send args] -- <command> [args...]" >&2
    exit 1
fi

WID=$(hyprctl activewindow -j | jq -r '.address')

"${cmd_args[@]}"
exit_code=$?

action=$(notify-send -A "focus=Focus Terminal" "${notify_args[@]}")
[[ "$action" == "focus" ]] && hyprctl dispatch focuswindow "address:$WID"

exit $exit_code
