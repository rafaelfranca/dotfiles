# Dotfiles

My personal dotfiles managed with [chezmoi](https://www.chezmoi.io/).

## Quick Start

### Install on a new machine

```bash
# Install chezmoi and apply dotfiles
sh -c "$(curl -fsLS get.chezmoi.io)" -- init --apply rafaelfranca
```

### Manual installation

```bash
# Install chezmoi
brew install chezmoi

# Initialize and apply dotfiles
chezmoi init rafaelfranca
chezmoi apply
```

## What's included

- **Shell**: Zsh configuration with custom prompt and aliases
- **Starship**: Cross-platform prompt with custom configuration
- **Git**: Global configuration, ignore patterns, and attributes
- **macOS applications and CLI packages**: Managed declaratively by `nixos-config/hosts/Rafaels-MacBook-Air/` and `nixos-config/home/rafael/darwin.nix`
- **Linux**: Starship and font installation (non-NixOS systems)
- **Scripts**: Custom executables in `~/.bin/`
- **Aliases**: Organized shell aliases in `~/.aliases/`

## Daily usage

### Update dotfiles

```bash
# Pull latest changes from repository
chezmoi update
```

### Choose a Git signing key

```bash
# Pick a signing key for the current repository
git-signing-key

# Set the global default signing key
git-signing-key --global

# Only show GPG keys
git-signing-key --gpg

# Only show SSH keys
git-signing-key --ssh
```

### Edit dotfiles

```bash
# Edit a file with your default editor
chezmoi edit ~/.zshrc
```

### Add new files

```bash
# Add a file to be managed by chezmoi
chezmoi add ~/.some-config-file

# Add an executable script
chezmoi add --template ~/.bin/my-script
```

### Check what would change

```bash
# See what chezmoi would do without applying
chezmoi diff

# Dry run
chezmoi apply --dry-run --verbose
```

## Platform-specific configuration

Configuration automatically adapts based on the operating system:

- **macOS**: Mac-specific dotfiles remain here; applications and CLI packages are owned by `nixos-config/hosts/Rafaels-MacBook-Air/`, and the 1Password SSH agent is owned by `nixos-config/home/rafael/darwin.nix`
- **Linux**: Installs Starship and fonts (except on NixOS)
- **NixOS**: Uses system zsh config

## Package management (macOS)

The personal Mac's applications and CLI packages are managed by nix-darwin:

- Homebrew casks and Mac App Store applications: `nixos-config/hosts/Rafaels-MacBook-Air/`
- Nix-provided CLI tools: `nixos-config/home/rafael/darwin.nix`

Chezmoi continues to own cross-platform dotfiles and Linux package bootstrap. Run `chezmoi apply --dry-run --verbose` to inspect dotfile changes without applying them.

## Learn more

- [Chezmoi documentation](https://www.chezmoi.io/)
- [Quick start guide](https://www.chezmoi.io/quick-start/)
- [User guide](https://www.chezmoi.io/user-guide/command-overview/)
