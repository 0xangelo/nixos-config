URL=$(curl -sS https://api.github.com/gists/$1 | jq -r '.files[].raw_url')
curl -sS $URL
