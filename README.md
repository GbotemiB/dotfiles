# dotfiles

Personal terminal dotfiles managed with [chezmoi](https://www.chezmoi.io/).

## What's included

| File | Target | Description |
|------|--------|-------------|
| `dot_bashrc` | `~/.bashrc` | Bash shell configuration |
| `dot_zshrc` | `~/.zshrc` | Zsh shell configuration |
| `dot_gitconfig.tmpl` | `~/.gitconfig` | Git configuration (templated with name/email) |
| `dot_gitignore_global` | `~/.gitignore_global` | Global git ignore rules |
| `dot_vimrc` | `~/.vimrc` | Vim configuration |
| `dot_tmux.conf` | `~/.tmux.conf` | Tmux configuration |
| `dot_config/starship.toml` | `~/.config/starship.toml` | [Starship](https://starship.rs) prompt |
| `.chezmoi.toml.tmpl` | chezmoi config | Per-machine config (name, email, shell) |

## Quick install

Run the one-liner below on a fresh machine. It will install chezmoi (if
needed) and apply all dotfiles:

```bash
curl -fsSL https://raw.githubusercontent.com/GbotemiB/dotfiles/main/install.sh | bash
```

Or, if you prefer to inspect the script first:

```bash
curl -fsSL https://raw.githubusercontent.com/GbotemiB/dotfiles/main/install.sh -o install.sh
bash install.sh
```

## Manual setup

1. **Install chezmoi** (if not already installed):

   ```bash
   sh -c "$(curl -fsSL https://get.chezmoi.io)" -- -b ~/.local/bin
   ```

2. **Initialise from this repo:**

   ```bash
   chezmoi init https://github.com/GbotemiB/dotfiles.git
   ```

   chezmoi will prompt you for:
   - Your full name
   - Your email address
   - Your default shell (`bash` or `zsh`)

3. **Preview what will change:**

   ```bash
   chezmoi diff
   ```

4. **Apply the dotfiles:**

   ```bash
   chezmoi apply
   ```

## Day-to-day usage

| Task | Command |
|------|---------|
| Edit a managed file | `chezmoi edit ~/.bashrc` |
| Pull latest changes and apply | `chezmoi update` |
| See pending changes | `chezmoi diff` |
| Add a new file to chezmoi | `chezmoi add ~/.config/some-tool/config` |
| Open the source directory | `chezmoi cd` |
| Re-run on a new machine | `chezmoi init --apply https://github.com/GbotemiB/dotfiles.git` |

## Local overrides

Each config supports a machine-local override file that is **not** tracked
by chezmoi, letting you add host-specific settings without touching the
shared repo:

| Shell / Tool | Local override file |
|---|---|
| Bash | `~/.bashrc.local` |
| Zsh | `~/.zshrc.local` |
| Vim | `~/.vimrc.local` |
| tmux | `~/.tmux.conf.local` |

## Requirements

- [chezmoi](https://www.chezmoi.io/) ≥ 2.x
- A POSIX shell (bash or zsh)
- Optional: [Starship](https://starship.rs) prompt, [tmux](https://github.com/tmux/tmux), [vim](https://www.vim.org/)
