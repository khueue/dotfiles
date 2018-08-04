# dotfiles

## Bootstrapping a New Machine

1. Clone the repo.
2. Run `./copy-gits-to-local` to get everything on your local machine.
3. Run `./link-locals-to-git` to link everything back into git again.

## Useful Installs

### Homebrew

```
$ brew leaves
awscli
bash-completion
fish
git
htop
tree
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

#### VSCode

Listing extensions could look like this:

```
$ ls -al ~/.vscode/extensions/
drwxr-xr-x  12 khu  staff  384 Aug  4 19:06 editorconfig.editorconfig-0.12.4
drwxr-xr-x  14 khu  staff  448 Aug  4 19:07 ulthes.theme-firewatch-1.0.3
drwxr-xr-x  20 khu  staff  640 Aug  4 11:24 vscodevim.vim-0.15.7
```

## Configuration

### Key Repeat

```
# Normal minimum is 15 (225 ms).
defaults write -g InitialKeyRepeat -int 13

# Normal minimum is 2 (30 ms).
defaults write -g KeyRepeat -int 1.5
```
