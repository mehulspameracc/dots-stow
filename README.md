# Introduction

This is a Dotfiles folder structured for Unix Systems.
This should be used with Stow.
Install stow on your machine with

**On MacOS**
```bash
brew install stow
```

**On Linux**
```bash
# <pkg_manager> install stow
```

## Instructions

- Clone this git repo to your home folder
- Run stow on this folder to copy all folders to home with `stow .`
- Stow can also be used with `stow -t $HOME .` where -t targets the $HOME Directory, and `.` represents the current directory or where dotfiles are located.
- Run `stow <folder_Name>` to copy only that folder to its location
- Go through instructions in its actual folder for certain configs, such as kvantum, docker, or fonts.
