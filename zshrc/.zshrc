# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# read powerlevel10k
source ~/powerlevel10k/powerlevel10k.zsh-theme

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

# tmux related
alias ta='tmux a -t'
alias tl='tmux ls'

# itermを開くたびにtmuxを起動しないようにする
count=`ps aux | grep tmux | grep -v grep | wc -l`
if [ $count -eq 0 ]; then
    echo `tmux`
elif [ $count -eq 1 ]; then
    echo `tmux a`
fi

# plugins
plugins=(git zsh-syntax-highlighting zsh-autosuggestions)

source $ZSH/oh-my-zsh.sh

source ~/Tools/enhancd/init.sh
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
export ENHANCD_FILTER="fzf --height 40%:fzy"

# alias related vim
alias vi='nvim'
alias vim='nvim'

# count characters in file
alias count='wc -m'

# Texに関わるコマンドを実行するためのPATH
export PATH=$PATH:/usr/local/texlive/2023/bin/universal-darwin

export PATH="$HOME/.cargo/bin:$PATH"
