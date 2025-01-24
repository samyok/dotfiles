
## current packages

* nvim
* fish
* ideavim

## installing stow

```bash
brew install stow
```

## useful stow commands

```bash
stow <packagename> # activates symlink
stow -n <packagename> # trial runs or simulates symlink generation. Effective for checking for errors
stow -D <packagename> # delete stowed package
stow -R <packagename> # restows package
```

## credits

stow guide from deepak's blog: https://dr563105.github.io/blog/manage-dotfiles-with-gnu-stow/
