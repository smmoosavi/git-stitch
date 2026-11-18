<img src="assets/icon.svg" width="64" height="64" alt="">

# git-stitch

Small tools for reshaping Git history without opening an editor.

Requires Bash 4+, Git 2.38+, and the `install` and `realpath` utilities.

```sh
./install.sh                # installs to ~/.local
./install.sh /custom/prefix # optional prefix
```

Add the prefix's `bin` directory to `PATH` (default: `~/.local/bin`).

## git-move

```sh
git move HEAD --before=HEAD~2
git move abc1234 --after=def5678
git move -h
```

Moves one commit, keeping it separate. Both commits must be ancestors of
`HEAD`; the replayed history must contain no merges. Requires clean tracked
files. Reordering rewrites commit hashes and may cause conflicts or change
the resulting code.

After resolving conflicts, stage the files and run `git rebase --continue`.
Cancel with `git rebase --abort`. Full help: `git move --help` (requires `man`).
