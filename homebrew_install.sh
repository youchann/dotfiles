#!/bin/bash

echo "installing homebrew..."
which brew >/dev/null 2>&1 || /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

echo "run brew doctor..."
which brew >/dev/null 2>&1 && brew doctor

echo "run brew update..."
which brew >/dev/null 2>&1 && brew update

echo "ok. run brew upgrade..."

brew upgrade --all

formulas=(
    git
    wget
    curl
    tree
    zsh-completions
    zsh-autosuggestions
    fzf
    cask
    mysql
    vim
)

echo "start brew install apps..."
for formula in "${formulas[@]}"; do
    brew install $formula || brew upgrade $formula
done

casks=(
    google-chrome
    google-japanese-ime
    slack
    alfred
    iterm2
    visual-studio-code
    zoom
    docker
    sequel-pro
    postman
    clipy
)

echo "start brew cask install apps..."
for cask in "${casks[@]}"; do
    brew install $cask --cask
done

brew cleanup
brew cask cleanup

cat << END

**************************************************
HOMEBREW INSTALLED! bye.
**************************************************

END
