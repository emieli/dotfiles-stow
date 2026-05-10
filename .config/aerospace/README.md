# MacOS settings
Inspired by: https://github.com/agenttank/dotfiles_macos/tree/main
```
defaults write com.apple.dock autohide -bool true && killall Dock
defaults write com.apple.dock autohide-delay -float 10000 && killall Dock
defaults write com.apple.dock no-bouncing -bool TRUE && killall Dock
defaults write -g NSAutomaticWindowAnimationsEnabled -bool false
defaults write -g NSWindowShouldDragOnGesture -bool true
```
