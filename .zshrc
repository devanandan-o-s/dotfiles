
# Enable Powerlevel10k instant prompt.
# Keep this near the top of ~/.zshrc.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# Oh My Zsh
export ZSH="$HOME/.oh-my-zsh"

# Theme
ZSH_THEME="powerlevel10k/powerlevel10k"

# Plugins
plugins=(
  git
  zsh-autosuggestions
  zsh-syntax-highlighting
)

# Load Oh My Zsh
source "$ZSH/oh-my-zsh.sh"

# Powerlevel10k configuration
[[ ! -f "$HOME/.p10k.zsh" ]] || source "$HOME/.p10k.zsh"

# Qt 6 theme configuration
export QT_QPA_PLATFORMTHEME=qt6ct

# User-local executables (including Antigravity CLI)
export PATH="$HOME/.local/bin:$PATH"

# Zoxide: use zoxide when running cd
eval "$(zoxide init --cmd cd zsh)"
