#!/usr/bin/env bash

CURRENT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

script="#($CURRENT_DIR/scripts/ssh-count.sh)"
pattern="\#{ssh-count}"

do_interpolation() {
  local string="$1"
  local interpolated="${string/$pattern/$script}"

  echo "$interpolated"
}

update_tmux_option() {
  local option="$1"
  local option_value="$(tmux show-option -gqv "$option")"
  local new_option_value="$(do_interpolation "$option_value")"

  tmux set-option -gq "$option" "$new_option_value"
}


update_tmux_option "status-right"
