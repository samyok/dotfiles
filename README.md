
## current packages

* nvim
* fish
* ideavim
* gitconfig
* cursor

## installing stow

```bash
brew install stow
```

## useful stow commands

```bash
stow <packagename> # activates symlink
stow --adopt <packagename> # links said package.
stow -n <packagename> # trial runs or simulates symlink generation. Effective for checking for errors
stow -D <packagename> # delete stowed package
stow -R <packagename> # restows package
```

## creating a stow package

```bash
# create package
mkdir <packagename>
cd <packagename>

# in current config, do `pwd`, then copy the folder path AFTER your home directory
# eg. `/User/samyok/Library/Application\ Support/Cursor/User` becomes `Library/Application\ Support/Cursor/User`
# then insert that below
# eg. `mkdir -p Library/Application\ Support/Cursor/User`
mkdir -p <settingspath>

# touch the settings files
# eg. `touch settings.json`
touch <filename>

# adopt to link the files and move the actual files to this repo
cd ..
stow --adopt <packagename>
```

## credits

stow guide from deepak's blog: https://dr563105.github.io/blog/manage-dotfiles-with-gnu-stow/
