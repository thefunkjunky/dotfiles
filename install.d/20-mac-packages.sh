#!/bin/ bash
# Ignore if we're not on OSX
[[ "$OSTYPE" =~ ^darwin ]] || exit 0

# Keep-alive: update existing sudo time stamp if set, otherwise do nothing.
 while true; do sudo -n true; sleep 60; kill -0 "$$" || exit; done 2>/dev/null &

# make sure we have xcode...homebrew requires
if test ! $(which brew); then
   echo "Installing homebrew..."
   ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
fi
   brew update

# Ask for the administrator password upfront.
sudo -v

# Keep-alive: update existing sudo time stamp if set, otherwise do nothing.
while true; do sudo -n true; sleep 60; kill -0 "$$" || exit; done 2>/dev/null &


if test ! $(which brew); then
  echo "Installing homebrew..."
  ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
fi

# Install more recent versions of some OS X tools
brew tap homebrew/dupes
brew install homebrew/dupes/grep

# Make sure we’re using the latest Homebrew.
brew update

# Upgrade any already-installed formulae.
brew upgrade


# Let's get the latest bash
brew install bash
brew install bash-completion2


# Install GNU core utilities (those that come with OS X are outdated).
# Don’t forget to add `$(brew --prefix coreutils)/libexec/gnubin` to `$PATH`.
brew install coreutils

# Install GNU `find`, `locate`, `updatedb`, and `xargs`, g-prefixed
brew install findutils --with-default-names

# Install more recent versions of some OS X tools.
brew install vim --override-system-vi

brew install gnu-indent --with-default-names
brew install gnu-sed --with-default-names
brew install gnutls --with-default-names
brew install grep --with-default-names
brew install gnu-tar --with-default-names
brew install gnu-which --with-default-names
brew install gawk


# This will install all the stuff we need for reasons
brew install caskroom/cask/brew-cask
brew cask install google-chrome
brew cask install google-chrome-canary
brew cask install dropbox
brew cask install shiftit
brew cask install viscosity
brew cask install sublime-text
brew cask install alfred
brew cask install google-drive
brew cask install skype
brew cask install u-torrent
brew cask install firefox-aurora
brew cask install sublime-text-3
brew cask install keepassx
brew cask install caskroom/bomrewbrew-versions/java6
brew cask install pycharm
brew cask install slack
brew cask install wireshark
brew cask install adobe-reader
brew cask install texshop
brew cask install calibre
brew install finch
brew install pianobar
brew install docker
brew install tree
brew install htop
brew install terminal-notifier
brew install git
brew install gnu-sed
brew insatll gnu-grep
brew insatll gnu-which
brew install vim --override-system-vi


# Work stuff
brew install rbenv
brew install plenv
brew install pyenv
brew install net-snmp

# Remove outdated versions from the cellar.
brew cleanup

# This enables shiftit in security preferences, no seriously it does.
sudo sqlite3 "/Library/Application Support/com.apple.TCC/TCC.db" 'update access set allowed="1" where client like "%shiftit%";'



LOCALBASH="/usr/local/bin/bash"
if ! grep -q $LOCALBASH /etc/shells; then
  echo $LOCALBASH | sudo tee -a /etc/shells
  sudo chsh -s $LOCALBASH $USER
fi

# Move /usr/local/bin to the top of the path
sudo sed -i '' '/^\/usr\/local\/bin/!H;//p;$!d;g;s/\n//' /etc/paths


