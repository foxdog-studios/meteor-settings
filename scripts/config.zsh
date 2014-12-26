#!/usr/bin/env zsh

setopt ERR_EXIT
setopt NO_UNSET

if [[ $# -ne 1 ]]; then
  cat <<-'EOF'
		Set the default config.

		Usage:

		    $ config.zsh CONFIG_NAME
	EOF
  exit 1
fi

repo=$0:A:h:h
target=$repo/config/$1

if [[ ! -d $target ]]; then
  print -- "'$1' is not a config name"
  exit 1
fi

link_name=$repo/config/default
rm --force $link_name
ln --symbolic                                       \
   --no-target-directory                            \
   --                                               \
   "$(realpath --relative-to=$link_name:h $target)" \
   $link_name

