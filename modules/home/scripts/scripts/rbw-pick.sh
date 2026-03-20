#!/usr/bin/env bash

rbw unlock \
  && entry="$(rbw ls | fuzzel --dmenu)" \
  && field="$(rbw get --list-fields "$entry" | fuzzel --dmenu)" \
  && rbw get --clipboard --field "$field" "$entry"
