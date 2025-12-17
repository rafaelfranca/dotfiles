# Agent Context for Dotfiles

This document provides context for AI coding assistants working with these dotfiles.

## Overview

These dotfiles are managed using [chezmoi](https://www.chezmoi.io/), a dotfile manager that uses a source-target model with templating support.

## Key Design Decisions

### Chezmoi Naming Conventions

Files in `~/.local/share/chezmoi/` use special prefixes that determine how they're applied:

- **`dot_`**: Creates hidden files (e.g., `dot_zshrc` → `~/.zshrc`)
- **`executable_`**: Makes files executable (e.g., `executable_git-backport` → executable script)
- **`.tmpl`**: Template files processed by chezmoi (e.g., `dot_zshrc.tmpl`)
- **`run_onchange_`**: Scripts that run when their content changes
- **`run_onchange_before_`**: Scripts that run before applying changes

### Directory Structure

```
~/.local/share/chezmoi/
├── .chezmoiignore            # Platform-specific file exclusions
├── .chezmoi.toml.tmpl        # Chezmoi configuration
├── dot_aliases/              # Shell aliases → ~/.aliases/
├── dot_bin/                  # Executable scripts → ~/.bin/
├── dot_config/               # XDG config → ~/.config/
│   ├── git/                  # Git ignore/attributes
│   └── starship.toml         # Starship prompt config
├── dot_gitconfig             # Main git config → ~/.gitconfig
├── dot_zshrc.user.tmpl       # User-specific zsh config
├── symlink_dot_zshrc         # Zsh config symlink
├── run_onchange_before_install-packages-darwin.sh.tmpl  # macOS packages
└── run_onchange_before_install-packages-linux.sh.tmpl   # Linux packages
```

## Platform-Specific Configuration

### macOS-Specific Features

1. **Conditional templating**: Uses `{{- if eq .chezmoi.os "darwin" -}}` for macOS-only config
2. **Homebrew packages**: Managed via `run_onchange_before_install-packages-darwin.sh.tmpl`
   - Embeds Brewfile directly in script using bash here-document
   - Runs automatically when package list changes
   - Uses `brew bundle --no-lock --file=/dev/stdin`

### Linux-Specific Features

1. **Package installation**: Managed via `run_onchange_before_install-packages-linux.sh.tmpl`
   - Installs Starship prompt and Fira Code Nerd Font
   - Skipped on NixOS (uses declarative package management)
2. **NixOS support**: Special handling via `.chezmoiignore`
   - Uses system zsh config instead of dotfiles version

### Platform Detection

Templates must safely check platform before accessing OS-specific variables:

```bash
# Safe: Check OS before accessing osRelease
{{- if and (eq .chezmoi.os "linux") (eq .chezmoi.osRelease.id "nixos") }}

# Unsafe: osRelease doesn't exist on macOS
{{- if eq .chezmoi.osRelease.id "nixos" }}
```

### Templates in `.zshrc`

The `.zshrc` file uses chezmoi templating to conditionally include Mac-specific configuration:

```bash
{{- if eq .chezmoi.os "darwin" }}
# Mac-specific configurations
export SSH_AUTH_SOCK=$(gpgconf --list-dirs agent-ssh-socket)
{{- end }}
```

## Shell Configuration (Zsh)

- **Primary shell**: Zsh (no bash/readline configuration needed)
- **Aliases**: Organized in `~/.aliases/*.sh` files, sourced in `.zshrc`
- **Custom scripts**: Stored in `~/.bin/` (added to PATH)

## Git Configuration

### File Locations

- **Primary config**: `~/.gitconfig` (takes precedence over XDG)
- **Ignore patterns**: `~/.config/git/ignore` (XDG location)
- **Attributes**: `~/.config/git/attributes` (XDG location)

### Why Not Full XDG for Git?

`~/.gitconfig` is used instead of `~/.config/git/config` because:
- Git reads `~/.gitconfig` AFTER `~/.config/git/config` (higher precedence)
- Other tools may write to `~/.gitconfig`, and we want our config to win
- More widely recognized and standard location

Supporting files (ignore, attributes) use XDG for better organization.

## Common Operations

### Adding New Files

```bash
# Regular file
chezmoi add ~/.some-file

# Executable script
chezmoi add --template ~/.bin/script-name
# Then rename in source: executable_script-name

# Edit in source to add prefixes/suffixes as needed
```

### Adding Packages (macOS)

Edit `run_onchange_before_install-packages-darwin.sh.tmpl` and add to the here-document:

```bash
brew "package-name"
cask "application-name"
mas "App Name", id: 123456
```

### Testing Changes

```bash
# See what would change
chezmoi diff

# Dry run with details
chezmoi apply --dry-run --verbose
```
## Troubleshooting

### Check what chezmoi sees

```bash
# List managed files
chezmoi managed

# See target path for a source file
chezmoi target-path ~/.local/share/chezmoi/dot_zshrc.tmpl

# See source path for a target file
chezmoi source-path ~/.zshrc
```

### Verify templates

```bash
# Execute template to see output
chezmoi execute-template < ~/.local/share/chezmoi/dot_zshrc.tmpl
```

## References

- [Chezmoi documentation](https://www.chezmoi.io/)
- [Source state attributes](https://www.chezmoi.io/reference/source-state-attributes/)
- [macOS guide](https://www.chezmoi.io/user-guide/machines/macos/)
- [Templating reference](https://www.chezmoi.io/reference/templates/)
