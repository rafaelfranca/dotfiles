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
- **Homebrew**: Package management with brew bundle (macOS only)
- **Linux**: Starship and font installation (non-NixOS systems)
- **Scripts**: Custom executables in `~/.bin/`
- **Aliases**: Organized shell aliases in `~/.aliases/`

## Daily usage

### Update dotfiles

```bash
# Pull latest changes from repository
chezmoi update
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

- **macOS**: Installs Homebrew packages and applies Mac-specific settings
- **Linux**: Installs Starship and fonts (except on NixOS)
- **NixOS**: Uses system zsh config

## Package management (macOS)

Packages are managed via Homebrew and automatically installed/updated when the package list changes:

```bash
# Edit the package list
chezmoi edit ~/.local/share/chezmoi/run_onchange_before_install-packages-darwin.sh.tmpl

# Apply changes (will run brew bundle automatically)
chezmoi apply
```

## Learn more

- [Chezmoi documentation](https://www.chezmoi.io/)
- [Quick start guide](https://www.chezmoi.io/quick-start/)
- [User guide](https://www.chezmoi.io/user-guide/command-overview/)
