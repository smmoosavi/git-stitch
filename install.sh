#!/usr/bin/env bash
set -euo pipefail

usage() { printf 'Usage: %s [prefix]\nDefault prefix: ~/.local\n' "${0##*/}"; }
if [[ ${1-} == --help || ${1-} == -h ]]; then usage; exit 0; fi
[[ $# -le 1 && ( $# == 0 || -n $1 ) ]] || { usage >&2; exit 1; }

source_dir=$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")" && pwd)
prefix=${1:-$HOME/.local}
install -d -- "$prefix/bin" "$prefix/share/man/man1"
install -m 755 -- "$source_dir/bin/git-move" "$prefix/bin/git-move"
install -m 644 -- "$source_dir/man/man1/git-move.1" "$prefix/share/man/man1/git-move.1"
printf 'Installed git-move in %s/bin\n' "$prefix"
