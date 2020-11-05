# dotfiles

## Bootstrapping a New Machine

1. Clone the repo.
2. Run `./copy-gits-to-local` to get everything on your local machine.
3. Run `./link-locals-to-git` to link everything back into git again.

## Add Something New

To add the file `~/Library/Preferences/com.googlecode.iterm2.plist`, do this:

```
mkdir -p ./home/Library/Preferences/
ln -f ~/Library/Preferences/com.googlecode.iterm2.plist ./home/Library/Preferences/com.googlecode.iterm2.plist
```

## Useful Installs

### Misc

```
1Password
Brave
Chrome
Cog
Command Line Tools
Docker
Dropbox
Firefox
GrandPerspective
Homebrew
iTerm
Limes
MenuMeters
Moom
Slack
Spotify
TotalSpaces2
Transmission
Visual Studio Code
```

### Via Homebrew

```
$ brew leaves
awscli
bash-completion
fish
git
httpie
tree
watch

$ brew list --cask
keepingyouawake
```


## VSCode

Listing extensions could look like this:

```
$ ls -al ~/.vscode/extensions/
drwxr-xr-x   9 khu  staff   288 Jun 17 15:17 arcticicestudio.nord-visual-studio-code-0.14.0/
drwxr-xr-x  14 khu  staff   448 Apr  6 10:24 azemoh.one-monokai-0.4.6/
drwxr-xr-x  10 khu  staff   320 Aug 18 08:23 csstools.postcss-1.0.9/
drwxr-xr-x  13 khu  staff   416 Sep 14 10:12 dahong.theme-bear-2.1.0/
drwxr-xr-x  15 khu  staff   480 Jul 27 09:41 dbaeumer.vscode-eslint-2.1.8/
drwxr-xr-x  13 khu  staff   416 May 25 13:49 editorconfig.editorconfig-0.15.1/
drwxr-xr-x  15 khu  staff   480 Dec 11  2018 euskadi31.json-pretty-printer-1.1.0/
drwxr-xr-x   9 khu  staff   288 Oct 17  2019 gerane.theme-acai-0.0.5/
drwxr-xr-x   9 khu  staff   288 Oct 17  2019 gerane.theme-earthsong-0.0.5/
drwxr-xr-x   9 khu  staff   288 Oct 17  2019 gerane.theme-mellow-0.0.5/
drwxr-xr-x   9 khu  staff   288 Oct 17  2019 gerane.theme-oblivion-0.0.5/
drwxr-xr-x   9 khu  staff   288 Oct 17  2019 gerane.theme-revelation-0.0.5/
drwxr-xr-x  10 khu  staff   320 Oct 10  2018 graf009.eagle-oceanic-next-1.0.2/
drwxr-xr-x  11 khu  staff   352 Jun 24  2019 jolaleye.horizon-theme-vscode-2.0.2/
drwxr-xr-x   9 khu  staff   288 Jun 24  2019 mischah.relaxed-theme-1.0.5/
drwxr-xr-x  13 khu  staff   416 Aug 18 08:23 ms-azuretools.vscode-docker-1.5.0/
drwxr-xr-x  12 khu  staff   384 Nov 12  2019 ms-vscode.vscode-typescript-tslint-plugin-1.2.3/
drwxr-xr-x  15 khu  staff   480 Sep 13 11:51 octref.vetur-0.27.3/
drwxr-xr-x   9 khu  staff   288 Jul 27 09:41 robertrossmann.remedy-4.21.0/
drwxr-xr-x  11 khu  staff   352 Jul 27 09:41 rokoroku.vscode-theme-darcula-1.2.1/
drwxr-xr-x   9 khu  staff   288 Jan 29  2020 smlombardi.slime-3.2.1/
drwxr-xr-x  12 khu  staff   384 Jun 24  2019 sveggiani.vscode-field-lights-0.0.11/
drwxr-xr-x  21 khu  staff   672 Jun 17 15:17 teabyii.ayu-0.20.1/
drwxr-xr-x  16 khu  staff   512 Sep 23  2019 tinkertrain.theme-panda-1.3.0/
drwxr-xr-x   7 khu  staff   224 Apr  6 10:19 tomphilbin.gruvbox-themes-1.0.0/
drwxr-xr-x  14 khu  staff   448 Aug  4  2018 ulthes.theme-firewatch-1.0.3/
drwxr-xr-x  14 khu  staff   448 Jul 27 09:41 vscodevim.vim-1.16.0/
drwxr-xr-x  11 khu  staff   352 Aug 26 15:13 will-stone.plastic-4.1.0/
drwxr-xr-x   8 khu  staff   256 Apr  1 14:43 yummygum.city-lights-theme-1.1.8/
drwxr-xr-x  11 khu  staff   352 Oct 10  2018 zyst.egoist-one-1.18.0/
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

## Keyboard

```
cp keyboard "~/Library/Keyboard Layouts/"
# ... manually set current input source to new keyboard ...
plutil -convert xml1 ~/Library/Preferences/com.apple.HIToolbox.plist
vim ~/Library/Preferences/com.apple.HIToolbox.plist
# ... remove all references to the ones you don't want ...
```

See:

Edit: the method above seems to have stopped working in 10.9. This worked in both 10.9 or 10.8 though:

Change the current input source to your custom keyboard layout.
Open ~/Library/Preferences/com.apple.HIToolbox.plist (in 10.9) or ~/Library/Preferences/ByHost/com.apple.HIToolbox.*.plist (in 10.8 and earlier). You can convert the plist to XML with plutil -convert xml1.
Remove the input source or input sources you want to disable from the AppleEnabledInputSources dictionary. If there is an AppleDefaultAsciiInputSource key, remove it.
Restart.


## iTerm Themes

https://iterm2colorschemes.com/


## SSH Setup

Create folders for keys:

```
mkdir -p ~/.ssh/keys
mkdir -p ~/.ssh/keys/atuin
mkdir -p ~/.ssh/keys/github
mkdir -p ~/.ssh/keys/codecommit
```

Create keys as necessary:

```
ssh-keygen -t ed25519 -C "your_email@example.com"
```

In `~/.ssh/config`, configure different remotes:

```
Host github.com
    User git
    IdentityFile ~/.ssh/keys/github/private
    IdentitiesOnly yes

Host git-codecommit-private
    HostName git-codecommit.eu-west-1.amazonaws.com
    User APKA...
    IdentityFile ~/.ssh/keys/codecommit/private
    IdentitiesOnly yes

Host git-codecommit-aws-playground
	HostName git-codecommit.eu-west-1.amazonaws.com
	User APKA...
	IdentityFile ~/.ssh/keys/codecommit/aws-playground
	IdentitiesOnly yes

Host git-codecommit-aws-hejare
	HostName git-codecommit.eu-west-1.amazonaws.com
	User APKA...
	IdentityFile ~/.ssh/keys/codecommit/aws-hejare
	IdentitiesOnly yes
```
