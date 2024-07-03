export BW_SESSION=$(
  bw unlock \
    "$(gpg --decrypt ~/.config/Bitwarden\ CLI/bw.gpg 2> /dev/null)" \
    --raw \
    2> /dev/null
  )

