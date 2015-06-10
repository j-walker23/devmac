# Before getting started: install Xcode AND OPEN IT TO ACCEPT THE TERMS & CONDITIONS
#xcode-select --install # click install on prompt

# Setup our profile
echo "source .profile" >> .bash_profile
touch .profile

# Initialize Hombrew 
ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
brew doctor
brew update

# Setup Cask
echo export HOMEBREW_CASK_OPTS=\"--appdir=/Applications\" >> .profile
source .profile 
brew install brew-cask
brew install git
brew install maven
brew cask install caskroom/homebrew-versions/java7

# Install apps
brew tap caskroom/versions
brew cask install 1password sublime-text3 tower slack vlc dropbox macvim filezilla bettertouchtool intellij-idea pycharm appcode android-studio

# Install some useful utilities 
brew install wget


mkdir -p mac/themes
wget https://raw.github.com/altercation/solarized/master/osx-terminal.app-colors-solarized/xterm-256color/Solarized%20Dark%20xterm-256color.terminal -O mac/themes/solarized-dark.terminal
open -a Terminal.app mac/themes/solarized-dark.terminal
## Setup UI according to http://net.tutsplus.com/tutorials/tools-and-tips/how-to-customize-your-command-prompt/


brew install zsh
curl -L https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh | sh
sed -ie 's/robbyrussell/dwelch/g' .zshrc
wget https://gist.github.com/dwelch2344/8589538/raw/399de9f833d3db25bf3509b3349dc093e1636735/dwelch.zsh-theme -O .oh-my-zsh/themes/dwelch.zsh-theme


# Update Ruby with rbenv
brew install rbenv ruby-build
echo "eval \"\$(rbenv init -)\"" >> .profile
source .profile
CONFIGURE_OPTS="--with-openssl-dir=`brew --prefix openssl` --without-tcl --without-tk" rbenv install 2.0.0-p195
rbenv global 2.0.0-p195


# Install the cocoapods!!!
sudo gem install cocoapods
pod setup

# nginx for local dev with Intellij
brew install nginx
ln -sfv /usr/local/opt/nginx/*.plist ~/Library/LaunchAgents

git config --global merge.ff no

brew install node
npm install -g npm@latest
npm install -g bower
npm install -g grunt-cli
npm install -g sass
npm install -g coffee-script
gem update --system
gem install compass

defaults write com.apple.finder AppleShowAllFiles -boolean true ; killall Finder

# http://burnedpixel.com/blog/setting-up-git-and-github-on-your-mac/#keychainhelper
#http://olivierlacan.com/posts/why-is-git-https-not-working-on-github/

cp ~/dev/devmac/ides/idea.vmoptions ~/Library/Preferences/IntellijIdea14/idea.vmoptions

sudo scutil --set ComputerName "john"
sudo scutil --set HostName "john"
