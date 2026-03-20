#!/usr/bin/env bash
# rbw-totp-fuzzy: Select entry with fuzzel → copy TOTP to clipboard
# Shows notifications on errors from rbw ls, fuzzel, or rbw totp

# set -euo pipefail

# ──────────────────────────────────────────────────────────────────────────────
# Step 1: Get list of entries
# ──────────────────────────────────────────────────────────────────────────────
entries=$(rbw ls 2>&1) || {
    # rbw ls failed → most common: vault locked / not unlocked
    notify-send -u critical "rbw ls failed" "$entries"
    exit 1
}

if [[ -z "$entries" ]]; then
    notify-send -u normal --app-name "rbw" "Warning" "No entries found in vault"
    exit 0
fi

# ──────────────────────────────────────────────────────────────────────────────
# Step 2: Let user select with fuzzel
# ──────────────────────────────────────────────────────────────────────────────
selection=$(echo "$entries" | fuzzel --dmenu 2>&1) || {
    # fuzzel failed (crashed, not installed, Wayland socket issue, etc.)
    # Exit code 1 is normal on cancel → only notify-send -u on real failure
    if [[ $? -ne 1 || -n "$selection" ]]; then  # something actually went wrong
        notify-send -u critical --app-name "fuzzel" "Error" "$selection"
    fi
    exit 1
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
selection="CIE PIN"
output=$(rbw totp --clipboard "$selection" 2>&1)
status=$?

if [[ $status -ne 0 ]]; then
    notify-send -u critical --app-name "rbw" "$selection" "$output"
    exit 1
fi

# Success (optional notification – comment out if too spammy)
notify-send -u low --app-name "rbw" "$selection" "TOTP copied"

exit 0
