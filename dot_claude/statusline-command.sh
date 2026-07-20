#!/bin/sh

# Ensure Homebrew and common tool paths are available in non-interactive shells
export PATH="/opt/homebrew/bin:/usr/local/bin:/usr/bin:/bin:$PATH"

# Verify jq is available — if not, output a fallback and exit cleanly
if ! command -v jq >/dev/null 2>&1; then
  printf "statusline: jq not found"
  exit 0
fi

input=$(cat)

total_tokens=$(echo "$input" | jq -r '.context_window.total_input_tokens // 0')
used_pct=$(echo "$input" | jq -r 'if .context_window.used_percentage != null then (.context_window.used_percentage | tostring) else "" end')

# No messages yet: show 0.0k (0%)
if [ -z "$used_pct" ] || [ "$used_pct" = "null" ]; then
  printf "\033[1;32m0.0k\033[0m \033[2m(0%%)\033[0m"
  exit 0
fi

# Format tokens as e.g. 23.1k
tokens_num=$(echo "$total_tokens" | tr -d '"')
if [ "$tokens_num" -ge 1000 ] 2>/dev/null; then
  formatted=$(awk "BEGIN { printf \"%.1fk\", $tokens_num / 1000 }")
else
  formatted="${tokens_num}"
fi

# Round percentage to integer
pct=$(printf "%.0f" "$used_pct")

# Token count: red at 100k+, orange from 80k–99k, green below 80k; percentage in muted/dimmed
if [ "$tokens_num" -ge 100000 ] 2>/dev/null; then
  token_color="\033[1;31m"
elif [ "$tokens_num" -ge 80000 ] 2>/dev/null; then
  token_color="\033[1;33m"
else
  token_color="\033[1;32m"
fi
printf "${token_color}%s\033[0m \033[2m(%s%%)\033[0m" "$formatted" "$pct"
