#!/usr/bin/env zsh

setopt ERR_EXIT
setopt NO_UNSET

repo=$0:A:h:h

if [[ $# -eq 0 ]]; then
  args=(
    test-packages
    --settings $repo/config/default/meteor_settings.json
    $repo/fds:settings/
  )
else
  args=( $@ )
fi

cd $repo/fds:settings
exec meteor $args

