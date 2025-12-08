# basic zsh options
setopt autocd
setopt histignoredups sharehistory
setopt extended_glob
setopt promptsubst

HISTFILE="$HOME/.zsh_history"

### Added by Zinit's installer
if [[ ! -f $HOME/.local/share/zinit/zinit.git/zinit.zsh ]]; then
    print -P "%F{33} %F{220}Installing %F{33}ZDHARMA-CONTINUUM%F{220} Initiative Plugin Manager (%F{33}zdharma-continuum/zinit%F{220})…%f"
    command mkdir -p "$HOME/.local/share/zinit" && command chmod g-rwX "$HOME/.local/share/zinit"
    command git clone https://github.com/zdharma-continuum/zinit "$HOME/.local/share/zinit/zinit.git" && \
        print -P "%F{33} %F{34}Installation successful.%f%b" || \
        print -P "%F{160} The clone has failed.%f%b"
fi

source "$HOME/.local/share/zinit/zinit.git/zinit.zsh"
autoload -Uz _zinit
(( ${+_comps} )) && _comps[zinit]=_zinit
### End of Zinit's installer chunk

# zinit
zinit light zsh-users/zsh-completions
zinit snippet OMZP::fzf
zinit snippet OMZP::sudo

autoload -Uz compinit
compinit -d "$HOME/.zcompdump"

zinit light Aloxaf/fzf-tab
zinit light zsh-users/zsh-autosuggestions
zinit light zsh-users/zsh-syntax-highlighting

# eza
alias l="eza -lah --icons"
alias lt="eza -lah --icons --tree"
alias ls="eza --icons"
alias ll="eza -l --icons"

# zellij
alias zj="zellij"

# bat
alias cat="bat -p"

# zoxide
alias zz='__zoxide_zi'
alias cd="z"
eval "$(zoxide init zsh)"

# mise
eval "$(mise activate zsh)"

# starship
eval "$(starship init zsh)"
