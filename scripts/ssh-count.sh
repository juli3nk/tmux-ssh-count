#!/usr/bin/env bash

main() {
  local count="$(ps a -o command | grep "^[s]sh " | grep -Evc "git-receive-pack")"

  if [ "$count" -gt 0 ]; then
    echo "#[fg=$thm_yellow,bg=$thm_black]$separator_left█#[default]#[fg=$thm_black,bg=$thm_yellow]SSH #[default]#[fg=$thm_white,bg=$thm_gray] ${count} #[default]#[fg=$thm_gray,bg=$thm_black]$separator_right#[default]"
  fi
}


main
