#!/bin/bash



write () {
  TEXT_FILE="$HOME/.cache/eww-notif"

  tiramisu -j | while read -r line; do
    source=$(echo "$line" | jq .source)
    summary=$(echo "$line" | jq .summary)
    body=$(echo "$line" | jq .body)

    printf "%s\n%s - %s\n\n" "${source:1:-1}" "${summary:1:-1}" "${body:1:-1}" >> "$TEXT_FILE"
  done
}

get () {
  TEXT_FILE="$HOME/.cache/eww-notif"
  cat "$TEXT_FILE"
}

clear () {
  TEXT_FILE="$HOME/.cache/eww-notif"
  printf "" > "$TEXT_FILE"
}

if [ "$1" == "write" ]; then
  write
elif [ "$1" == "get" ]; then
  get
elif [ "$1" == "clear" ]; then
  clear
fi