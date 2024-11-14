case $1 in
  "-h") echo "\
Utility for setting an alias to a manually imported Sui private key.

Usage: rename-sui-address <HEX-ADDRESS> <ALIAS>"; exit 0 ;;
esac
sui keytool import $(sui keytool export --key-identity $1 --json | jq -r .exportedPrivateKey) ed25519 --alias $2
