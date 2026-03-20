#!/usr/bin/env bash
# rbw-totp-fuzzy: Select entry with fuzzel → copy TOTP to clipboard
# Shows notifications on errors from rbw ls, fuzzel, or rbw totp

notify-bw() {
    local urgency
    local summary
    local body
    urgency=$1
    summary=$2
    body=$3
    notify-send \
        -u "$urgency" \
        --app-name "Bitwarden" \
        --icon=bitwarden-tray \
        "$summary" "$body"
}

# ──────────────────────────────────────────────────────────────────────────────
# Get list of entries
# ──────────────────────────────────────────────────────────────────────────────
entries=$(rbw ls 2>&1) || {
    # rbw ls failed → most common: vault locked / not unlocked
    notify-bw critical "ls failed" "$entries"
    exit 1
}

if [[ -z "$entries" ]]; then
    notify-bw normal "Warning" "No entries found in vault"
    exit 0
fi

# ──────────────────────────────────────────────────────────────────────────────
# Let user select entry with fuzzel
# ──────────────────────────────────────────────────────────────────────────────
entry=$(echo "$entries" | fuzzel --dmenu 2>&1) || {
    # fuzzel failed (crashed, not installed, Wayland socket issue, etc.)
    # Exit code 2 is normal on cancel → only notify-send -u on real failure
    if [[ $? -ne 2 || -n "$entry" ]]; then  # something actually went wrong
        notify-send \
            -u critical \
            --icon=search-icon \
            --app-name "fuzzel" \
            "Error" "$entry"
        exit 1
    fi
}

if [[ -z "$entry" ]]; then
    # User cancelled (Esc / close) → silent exit (common UX for menus)
    exit 0
    # Or if you prefer to notify:
    # notify-send -u normal "rbw totp" "Selection cancelled"
    # exit 0
fi

# ──────────────────────────────────────────────────────────────────────────────
# Get list of fields
# ──────────────────────────────────────────────────────────────────────────────
fields=$(rbw get --list-fields "$entry" 2>&1) || {
    # rbw ls failed → most common: vault locked / not unlocked
    notify-bw critical "--list-fields failed" "$entries"
    exit 1
}

if [[ -z "$fields" ]]; then
    notify-bw normal "Warning" "No fields found in $entry"
    exit 0
fi

# ──────────────────────────────────────────────────────────────────────────────
# Let user select field with fuzzel
# ──────────────────────────────────────────────────────────────────────────────
field=$(echo "$fields" | fuzzel --dmenu 2>&1) || {
    # fuzzel failed (crashed, not installed, Wayland socket issue, etc.)
    # Exit code 2 is normal on cancel → only notify-send -u on real failure
    if [[ $? -ne 2 || -n "$field" ]]; then  # something actually went wrong
        notify-send \
            -u critical \
            --icon=search-icon \
            --app-name "fuzzel" \
            "Error" "$entry"
        exit 1
    fi
}

if [[ -z "$field" ]]; then
    # User cancelled (Esc / close) → silent exit (common UX for menus)
    exit 0
    # Or if you prefer to notify:
    # notify-send -u normal "rbw totp" "Selection cancelled"
    # exit 0
fi

# ──────────────────────────────────────────────────────────────────────────────
# Get entry field
# ──────────────────────────────────────────────────────────────────────────────
output=$(rbw get --clipboard --field "$field" "$entry" 2>&1)
status=$?

if [[ $status -ne 0 ]]; then
    notify-bw critical "$entry -> $field" "$output"
    exit 1
fi

# Success (optional notification – comment out if too spammy)
notify-bw low "$entry" "$field copied"

exit 0
