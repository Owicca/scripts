#!/usr/bin/env

function pick_one {
  local prompt="${1} ?:"
  shift
  local choices=()
  for param in ${@};do
    choices+=(${param})
  done;

  local PS3=${prompt}
  select ch in ${choices[@]};do
    echo $ch
    return 0
  done;
}
