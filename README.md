# Common Tools for Homebrew

Casks for [Common Tools](https://oddurs.github.io/common-tools/), small native utilities for the Mac.

```sh
brew install --cask oddurs/common-tools/common-stats   # system stats in the menu bar
brew install --cask oddurs/common-tools/common-keys    # fixes words typed on the wrong keyboard
brew install --cask oddurs/common-tools/common-bar     # hides the menu bar icons you rarely use
```

The builds are signed but not yet notarized; each cask clears the quarantine flag after installing, so the app opens without the "can't verify the developer" step. `brew upgrade` keeps them current.

The casks are written by the Release workflow of [oddurs/common-tools](https://github.com/oddurs/common-tools) (`scripts/cask`); don't edit them here.
