autoload -Uz compinit
compinit
eval "$(oh-my-posh init zsh --config '~/.config/ohmyposh/config.toml')"

HISTFILE=$HOME/.zhistory
SAVEHIST=1000
HISTSIZE=999
setopt share_history
setopt hist_expire_dups_first
setopt hist_ignore_dups
setopt hist_verify
bindkey "^[[A" history-search-backward
bindkey "^[[B" history-search-forward

# custom alias
alias vim="nvim"
alias ls="eza --icons"
alias g="git"
alias cdg="z ~/dev"
alias cdc="z ~/.config"
alias cd="z"
alias configupdate="sudo darwin-rebuild switch --flake ~/.config/nix#szelam"

# uv setting
eval "$(uv generate-shell-completion zsh)"
# Fix completions for uv run to autocomplete .py files
_uv_run_mod() {
    if [[ "$words[2]" == "run" && "$words[CURRENT]" != -* ]]; then
        _arguments '*:filename:_files -g "*.py"'
    else
        _uv "$@"
    fi
}
compdef _uv_run_mod uv
#

# custom path
export PATH="$PATH:/Users/szelam/.local/bin"
export PATH="$PATH:/Users/szelam/.local/share/bob/nvim-bin"
export PATH="/opt/homebrew/opt/llvm/bin:$PATH"
export LDFLAGS="-L/opt/homebrew/opt/llvm/lib"
export CPPFLAGS="-I/opt/homebrew/opt/llvm/include"
export LIBRARY_PATH="/opt/homebrew/lib"
export PATH="$HOME/.cargo/bin:$PATH"
export GOPATH=$HOME/go
export PATH=$PATH:$GOROOT/bin:$GOPATH/bin
export PATH=$PATH:$(go env GOPATH)/bin 

source ~/.zsh/zsh-autosuggestions/zsh-autosuggestions.plugin.zsh
source ~/.zsh/zsh-syntax-highlighting/zsh-syntax-highlighting.plugin.zsh

eval "$(zoxide init zsh)"

# influx-cli completion
#compdef influx

_cli_zsh_autocomplete() {
    local -a opts
    local cur
    cur=${words[-1]}
    if [[ "$cur" == "-"* ]]; then
        opts=("${(@f)$(_CLI_ZSH_AUTOCOMPLETE_HACK=1 ${words[@]:0:#words[@]-1} ${cur} --generate-bash-completion)}")
    else
        opts=("${(@f)$(_CLI_ZSH_AUTOCOMPLETE_HACK=1 ${words[@]:0:#words[@]-1} --generate-bash-completion)}")
    fi

    if [[ "${opts[1]}" != "" ]]; then
        _describe 'values' opts
    else
        _files
    fi

    return
}

compdef _cli_zsh_autocomplete influx

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/Users/szelam/anaconda3/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/Users/szelam/anaconda3/etc/profile.d/conda.sh" ]; then
        . "/Users/szelam/anaconda3/etc/profile.d/conda.sh"
    else
        export PATH="/Users/szelam/anaconda3/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<

[[ -s "/Users/szelam/.gvm/scripts/gvm" ]] && source "/Users/szelam/.gvm/scripts/gvm"
