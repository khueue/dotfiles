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
awscli
bash-completion
fish
git
htop
swi-prolog
tree
watch

$ brew cask ls
keepingyouawake
```

### Other

```
Limes
1Password
Brave
Dropbox
Docker
Firefox
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
drwxr-xr-x   9 khu  staff   288 Jun  1 11:49 arcticicestudio.nord-visual-studio-code-0.10.0
drwxr-xr-x   9 khu  staff   288 Jul 22 10:05 arcticicestudio.nord-visual-studio-code-0.11.0
drwxr-xr-x  14 khu  staff   448 Nov 29  2018 arthurwang.vsc-prolog-0.8.23
drwxr-xr-x  11 khu  staff   352 Jun 24 15:02 atomiks.moonlight-0.8.3
drwxr-xr-x  11 khu  staff   352 Feb 15 15:30 editorconfig.editorconfig-0.13.0
drwxr-xr-x  15 khu  staff   480 Dec 11  2018 euskadi31.json-pretty-printer-1.1.0
drwxr-xr-x   9 khu  staff   288 Oct 10  2018 gerane.theme-acai-0.0.2
drwxr-xr-x   9 khu  staff   288 Oct 10  2018 gerane.theme-boron-0.0.4
drwxr-xr-x   9 khu  staff   288 Oct 10  2018 gerane.theme-earthsong-0.0.2
drwxr-xr-x   9 khu  staff   288 Oct 10  2018 gerane.theme-halflife-0.0.3
drwxr-xr-x   9 khu  staff   288 Oct 10  2018 gerane.theme-kabbotta-0.0.2
drwxr-xr-x   9 khu  staff   288 Jun 24 15:10 gerane.theme-mellow-0.0.2
drwxr-xr-x   9 khu  staff   288 Jun 24 15:18 gerane.theme-oblivion-0.0.2
drwxr-xr-x   9 khu  staff   288 Dec  7  2018 gerane.theme-revelation-0.0.2
drwxr-xr-x   9 khu  staff   288 Jun 24 15:22 gerane.theme-stark-0.0.2
drwxr-xr-x  10 khu  staff   320 Oct 10  2018 graf009.eagle-oceanic-next-1.0.2
drwxr-xr-x   8 khu  staff   256 Aug 29  2018 hoovercj.vscode-power-mode-2.2.0
drwxr-xr-x  11 khu  staff   352 Jun 24 14:57 jolaleye.horizon-theme-vscode-2.0.2
drwxr-xr-x   9 khu  staff   288 Jun 24 15:01 mischah.relaxed-theme-1.0.5
drwxr-xr-x  13 khu  staff   416 Jun 22 22:40 monket.karl-okeeffes-theme-3.4.0
drwxr-xr-x  13 khu  staff   416 Jul 15 11:29 monket.karl-okeeffes-theme-3.5.0
drwxr-xr-x  12 khu  staff   384 Jul 10 08:07 ms-azuretools.vscode-docker-0.7.0
drwxr-xr-x  17 khu  staff   544 Jun 30 21:40 octref.vetur-0.21.1
drwxr-xr-x  11 khu  staff   352 Mar 19 10:46 oderwat.indent-rainbow-7.4.0
drwxr-xr-x  12 khu  staff   384 Jul 19 12:50 slevesque.vscode-zipexplorer-0.3.1
drwxr-xr-x   9 khu  staff   288 Dec  7  2018 smlombardi.slime-2.34.0
drwxr-xr-x  12 khu  staff   384 Jun 24 14:59 sveggiani.vscode-field-lights-0.0.11
drwxr-xr-x  24 khu  staff   768 Feb  4 10:02 teabyii.ayu-0.18.0
drwxr-xr-x   9 khu  staff   288 Jul 12 14:31 thomas-baumgaertner.vcl-0.1.2
drwxr-xr-x  14 khu  staff   448 Aug  4  2018 ulthes.theme-firewatch-1.0.3
drwxr-xr-x  17 khu  staff   544 May 22 22:32 vscodevim.vim-1.8.1
drwxr-xr-x  17 khu  staff   544 Jul 15 10:12 vscodevim.vim-1.8.2
drwxr-xr-x  10 khu  staff   320 Mar 19 10:46 wart.ariake-dark-0.2.2
drwxr-xr-x  11 khu  staff   352 Jun 24 15:05 whizkydee.material-palenight-theme-1.9.5
drwxr-xr-x  15 khu  staff   480 Jul  8 00:16 will-stone.plastic-2.4.0
drwxr-xr-x   7 khu  staff   224 Jun 30 21:39 yummygum.city-lights-theme-1.1.5
drwxr-xr-x  11 khu  staff   352 Oct 10  2018 zyst.egoist-one-1.18.0
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

## iTerm Themes

https://iterm2colorschemes.com/
