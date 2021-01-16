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
drwxr-xr-x  11 khu  staff  352 Jan 16 12:19 akamud.vscode-theme-onedark-2.2.3/
drwxr-xr-x  12 khu  staff  384 Nov  6 22:48 ankitcode.firefly-3.0.1/
drwxr-xr-x   9 khu  staff  288 Jan 14 11:13 arcticicestudio.nord-visual-studio-code-0.15.0/
drwxr-xr-x   8 khu  staff  256 Nov  6 22:48 barrsan.reui-1.1.4/
drwxr-xr-x  10 khu  staff  320 Jan 14 11:15 dline.cobaltnext-0.3.1/
drwxr-xr-x  13 khu  staff  416 Dec  7 09:51 editorconfig.editorconfig-0.16.4/
drwxr-xr-x  15 khu  staff  480 Nov  5 16:12 euskadi31.json-pretty-printer-1.1.0/
drwxr-xr-x  10 khu  staff  320 Jan 16 12:21 fisheva.eva-theme-1.0.2/
drwxr-xr-x   9 khu  staff  288 Jan 16 12:37 ganevru.slime-solid-1.0.0/
drwxr-xr-x  22 khu  staff  704 Jan 16 12:25 gulajavaministudio.mayukaithemevsc-1.6.0/
drwxr-xr-x   9 khu  staff  288 Nov  6 22:49 ionutvmi.spacegray-vscode-1.2.6/
drwxr-xr-x  11 khu  staff  352 Dec  3 17:10 marcellus-easley.theme-firewatch-blacked-0.0.1/
drwxr-xr-x  13 khu  staff  416 Dec 16 09:57 ms-azuretools.vscode-docker-1.9.0/
drwxr-xr-x  15 khu  staff  480 Dec 14 09:23 octref.vetur-0.31.3/
drwxr-xr-x  11 khu  staff  352 Jan 16 12:24 rokoroku.vscode-theme-darcula-1.2.3/
drwxr-xr-x  13 khu  staff  416 Jan 14 11:02 sallar.vscode-duotone-dark-0.3.3/
drwxr-xr-x  21 khu  staff  672 Jan 16 12:20 teabyii.ayu-0.20.1/
drwxr-xr-x  16 khu  staff  512 Jan 16 12:23 tinkertrain.theme-panda-1.3.0/
drwxr-xr-x  12 khu  staff  384 Jan 15 23:33 toba.vsfire-1.4.1/
drwxr-xr-x  13 khu  staff  416 Jan 14 11:01 travis.simple-dark-0.3.2/
drwxr-xr-x  14 khu  staff  448 Dec  3 17:10 ulthes.theme-firewatch-1.0.3/
drwxr-xr-x   6 khu  staff  192 Jan 14 11:13 viktorqvarfordt.vscode-pitch-black-theme-1.2.4/
drwxr-xr-x   8 khu  staff  256 Jan 16 12:25 vitoravelino.mosaic-0.0.1/
drwxr-xr-x  15 khu  staff  480 Dec 11 00:35 vscodevim.vim-1.18.5/
drwxr-xr-x  12 khu  staff  384 Jan 16 12:35 will-stone.plastic-4.3.1/
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
