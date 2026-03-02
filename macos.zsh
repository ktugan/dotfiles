# macOS-specific configuration

# locale fix
export LC_ALL=en_US.UTF-8

# GNU coreutils (installed via homebrew)
PATH="/usr/local/opt/coreutils/libexec/gnubin:$PATH"

# Homebrew
export PATH="$HOME/homebrew/bin:$HOME/homebrew/sbin:$PATH"

# pnpm
export PNPM_HOME="/Users/kadirt/Library/pnpm"
case ":$PATH:" in
  *":$PNPM_HOME:"*) ;;
  *) export PATH="$PNPM_HOME:$PATH" ;;
esac
