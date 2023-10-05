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

# List of packages to install with Homebrew
# 2023-07-27 - Added microsoft-teams
# 2023-10-02 - Made the package names more explicit
packages=(
homebrew/cask/zoom
homebrew/cask/adobe-acrobat-reader
homebrew/cask/google-drive
homebrew/cask/google-chrome
homebrew/cask/firefox
homebrew/cask/microsoft-teams
  # Add more packages to install here
)


# Concatenate contents of all .package files and append to $packages.
# Added so that we can have department or user specific package lists.
for package_file in *.package; do
  echo "Adding packages from $package_file..."
  packages+=$'\n'"$(cat $package_file)"$'\n'
done


# Install the packages using Homebrew
echo "Installing packages..."
brew install $packages

echo "All packages installed successfully."

#for package in "${packages[@]}"; do
  # 2023-10-2 Removed the upgrade command for each package, the install command does this automatically
  #if brew list "$package" &>/dev/null; then
	# 2023-07-27 - Changed behavior from skipping the package to updating it instead
    #echo "$package is already installed. Skipping..."
	#brew upgrade "$package"
  #else
    #brew install $packages
    #brew upgrade
  #fi
#done