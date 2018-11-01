# dotfiles

## Bootstrapping a New Machine

1. Clone the repo.
2. Run `./copy-gits-to-local` to get everything on your local machine.
3. Run `./link-locals-to-git` to link everything back into git again.

### Add Something New

To add the file `~/Library/Preferences/com.googlecode.iterm2.plist`, do this:

```
mkdir -p ./home/Library/Preferences/
ln -f ~/Library/Preferences/com.googlecode.iterm2.plist ./home/Library/Preferences/com.googlecode.iterm2.plist
```

## Useful Installs

### Homebrew

```
$ brew leaves
bash-completion
fish
git
htop
python
swi-prolog
tree
watch

$ brew cask ls
keepingyouawake
minikube
```

Running Minikube (local kubernetes):
- Install hyperkit (https://github.com/kubernetes/minikube/blob/master/docs/drivers.md#hyperkit-driver)
- brew cask install minikube
- minikube start --vm-driver=hyperkit

### Other

```
limes
1Password
Dropbox
Caffeine
Docker
Chrome
GrandPerspective
iTerm
Moom
Slack
Spotify
TotalSpaces2
Visual Studio Code
MenuMeters
```

## VSCode

Listing extensions could look like this:

```
$ ls -al ~/.vscode/extensions/
drwxr-xr-x   9 khu  staff  288 Sep 17 12:03 arcticicestudio.nord-visual-studio-code-0.6.0
drwxr-xr-x  12 khu  staff  384 Oct 16 10:32 editorconfig.editorconfig-0.12.5
drwxr-xr-x  16 khu  staff  512 Oct 17 12:29 euskadi31.json-pretty-printer-1.0.1
drwxr-xr-x   9 khu  staff  288 Oct 10 12:26 gerane.theme-acai-0.0.2
drwxr-xr-x   9 khu  staff  288 Oct 10 12:27 gerane.theme-boron-0.0.4
drwxr-xr-x   9 khu  staff  288 Oct 10 12:32 gerane.theme-earthsong-0.0.2
drwxr-xr-x   9 khu  staff  288 Oct 10 12:34 gerane.theme-halflife-0.0.3
drwxr-xr-x   9 khu  staff  288 Oct 10 12:35 gerane.theme-kabbotta-0.0.2
drwxr-xr-x  10 khu  staff  320 Oct 10 12:25 graf009.eagle-oceanic-next-1.0.2
drwxr-xr-x   8 khu  staff  256 Aug 29 16:30 hoovercj.vscode-power-mode-2.2.0
drwxr-xr-x  13 khu  staff  416 Oct 10 12:39 monket.karl-okeeffes-theme-2.23.0
drwxr-xr-x  12 khu  staff  384 Aug 18 14:11 oderwat.indent-rainbow-7.2.4
drwxr-xr-x  16 khu  staff  512 Sep 26 16:40 peterjausovec.vscode-docker-0.3.1
drwxr-xr-x  19 khu  staff  608 Sep 17 12:02 teabyii.ayu-0.16.0
drwxr-xr-x  14 khu  staff  448 Aug  4 19:07 ulthes.theme-firewatch-1.0.3
drwxr-xr-x  20 khu  staff  640 Oct 19 15:10 vscodevim.vim-0.16.11
drwxr-xr-x  10 khu  staff  320 Oct 11 09:44 wart.ariake-dark-0.1.1
drwxr-xr-x  10 khu  staff  320 Oct 11 09:46 will-stone.plastic-2.2.0
drwxr-xr-x   7 khu  staff  224 Oct 11 09:45 yummygum.city-lights-theme-1.0.11
drwxr-xr-x  11 khu  staff  352 Oct 10 12:25 zyst.egoist-one-1.18.0
```

## Key Repeat

```
# Allow key repeat.
defaults write -g ApplePressAndHoldEnabled -bool false

# Normal minimum is 15 (225 ms).
defaults write -g InitialKeyRepeat -int 13

# Normal minimum is 2 (30 ms).
defaults write -g KeyRepeat -int 1.5
```

## iTerm2 Themes

https://iterm2colorschemes.com/
