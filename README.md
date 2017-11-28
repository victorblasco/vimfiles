# vimfiles

## Installation

Install last vim version with homebrew:

    brew update
    brew install vim

Install `the_silver_search` (needed for `ag` plugin):

    brew install the_silver_searcher

Install [Monaco patched font](https://gist.github.com/victorblasco/e37cadde3c59acf8384b).

Install [fzf](https://github.com/junegunn/fzf):

    brew install fzf

    # To install useful key bindings and fuzzy completion:
    $(brew --prefix)/opt/fzf/install

Reload .vimrc, open `vim` and `:PlugInstall` to install plugins.

`:GoInstallBinaries` to setup vim-go plugin.

## Plugin manager

[vim-plug](https://github.com/junegunn/vim-plug)