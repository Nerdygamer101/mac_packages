#!/bin/bash

# Check if Homebrew is already installed
if ! command -v brew &> /dev/null; then
  echo "Installing Homebrew..."
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
  (echo; echo 'eval "$(/opt/homebrew/bin/brew shellenv)"') >> /Users/$USER/.zprofile
  eval "$(/opt/homebrew/bin/brew shellenv)"
else
  echo "Homebrew is already installed. Updating..."
  brew update
fi


# Concatenate contents of all .package files and append to $packages.
# Added so that we can have department or user specific package lists.
for package_file in *.package; do
  echo "Adding packages from $package_file..."
  packages+=$'\n'"$(cat $package_file)"$'\n'
done


# Install the packages using Homebrew
echo "Installing packages..."
echo "List of packages: $packages"
brew install $packages

echo "All packages installed successfully."