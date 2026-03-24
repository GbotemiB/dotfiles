#!/usr/bin/env bash
# install.sh — Bootstrap chezmoi and apply this dotfiles repo
# Usage: curl -fsSL https://raw.githubusercontent.com/GbotemiB/dotfiles/main/install.sh | bash
#    or: bash install.sh

set -euo pipefail

DOTFILES_REPO="https://github.com/GbotemiB/dotfiles.git"
CHEZMOI_BIN="${HOME}/.local/bin/chezmoi"

# ── Helpers ───────────────────────────────────────────────────────────────────
info()  { printf '\e[1;34m[INFO]\e[0m  %s\n' "$*"; }
ok()    { printf '\e[1;32m[ OK ]\e[0m  %s\n' "$*"; }
warn()  { printf '\e[1;33m[WARN]\e[0m  %s\n' "$*" >&2; }
die()   { printf '\e[1;31m[ERR ]\e[0m  %s\n' "$*" >&2; exit 1; }

# ── Install chezmoi if missing ────────────────────────────────────────────────
install_chezmoi() {
    if command -v chezmoi &>/dev/null; then
        ok "chezmoi already installed: $(command -v chezmoi)"
        return
    fi

    info "Installing chezmoi to ${CHEZMOI_BIN} …"
    mkdir -p "${HOME}/.local/bin"

    if command -v curl &>/dev/null; then
        sh -c "$(curl -fsSL https://get.chezmoi.io)" -- -b "${HOME}/.local/bin"
    elif command -v wget &>/dev/null; then
        sh -c "$(wget -qO- https://get.chezmoi.io)" -- -b "${HOME}/.local/bin"
    else
        die "Neither curl nor wget found. Please install one and retry."
    fi

    # Ensure ~/.local/bin is on PATH for the rest of this script
    export PATH="${HOME}/.local/bin:${PATH}"
    ok "chezmoi installed."
}

# ── Apply dotfiles ────────────────────────────────────────────────────────────
apply_dotfiles() {
    info "Initialising chezmoi from ${DOTFILES_REPO} …"
    chezmoi init --apply "${DOTFILES_REPO}"
    ok "Dotfiles applied."
}

# ── Main ──────────────────────────────────────────────────────────────────────
main() {
    info "Starting dotfiles bootstrap …"
    install_chezmoi
    apply_dotfiles
    ok "All done! Open a new shell to enjoy your new environment."
}

main "$@"
