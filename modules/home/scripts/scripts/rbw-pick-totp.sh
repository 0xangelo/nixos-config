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
# Step 1: Get list of entries
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
# Step 2: Let user select with fuzzel
# ──────────────────────────────────────────────────────────────────────────────
selection=$(echo "$entries" | fuzzel --dmenu 2>&1) || {
    # fuzzel failed (crashed, not installed, Wayland socket issue, etc.)
    # Exit code 2 is normal on cancel → only notify-send -u on real failure
    if [[ $? -ne 2 || -n "$selection" ]]; then  # something actually went wrong
        notify-send \
            -u critical \
            --icon=search-icon \
            --app-name "fuzzel" \
            "Error" "$selection"
        exit 1
    fi
}

if [[ -z "$selection" ]]; then
    # User cancelled (Esc / close) → silent exit (common UX for menus)
    exit 0
    # Or if you prefer to notify:
    # notify-send -u normal "rbw totp" "Selection cancelled"
    # exit 0
fi

# ──────────────────────────────────────────────────────────────────────────────
# Step 3: Get and copy TOTP
# ──────────────────────────────────────────────────────────────────────────────
output=$(rbw totp --clipboard "$selection" 2>&1)
status=$?

if [[ $status -ne 0 ]]; then
    notify-bw critical "$selection" "$output"
    exit 1
fi

# Success (optional notification – comment out if too spammy)
notify-bw low "$selection" "TOTP copied"

exit 0
