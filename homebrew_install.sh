#!/bin/bash

echo "installing homebrew..."
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

echo "run brew doctor..."
brew doctor

echo "run brew update..."
brew update

echo "ok. run brew upgrade..."

brew upgrade

formulas=(
    git
    wget
    curl
    tree
    fzf
    ghq
    cask
    mysql
    vim
    awscli
    jq
)

echo "start brew install apps..."
for formula in "${formulas[@]}"; do
    brew install $formula || brew upgrade $formula
done

casks=(
    slack
    raycast
    warp
    visual-studio-code
    zoom
    docker
    sequel-ace
    github
    notion
    anki
    aws-vault
    brave-browser
    google-cloud-sdk
)

echo "start brew cask install apps..."
for cask in "${casks[@]}"; do
    brew install $cask --cask
done

cat << END

**************************************************
HOMEBREW INSTALLED! bye.
**************************************************

END
