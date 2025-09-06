# dotfiles-stow
Use Stow to manage dotfiles

## Requirements
Ensure you have the following installed on your system for intial setup.
```
$ *apt/yum/etc* install git stow
```

## Usage
First, clone the dotfiles repo to your $HOME directory using git:
```
$ git clone git@github.com/emieli/dotfiles-stow.git
$ cd dotfiles
```
Then use GNU stow to create symlinks for your new dotfiles:
```
~/dotfiles-stow$ stow .
```
