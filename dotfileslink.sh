# powerlevel10kのインストール
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ~/powerlevel10k
echo 'source ~/powerlevel10k/powerlevel10k.zsh-theme' >>~/.zshrc

############ enhancdのインストール ############
mkdir ~/Tools
git clone git@github.com:b4b4r07/enhancd.git ~/Tools/enhancd
echo 'source ~/Tools/enhancd/init.sh' >>~/.zshrc

############ lazygitのインストール ############
brew install jesseduffield/lazygit/lazygit

############ lazyvimのインストール ############
# required
mv ~/.config/nvim{,.bak}
# optional but recommended
mv ~/.local/share/nvim{,.bak}
mv ~/.local/state/nvim{,.bak}
mv ~/.cache/nvim{,.bak}
# git clone nvim
git clone https://github.com/LazyVim/starter ~/.config/nvim
# remove git
rm -rf ~/.config/nvim/.git

############ 設定ファイルのリンク作成 ############
ln -sf ~/dotfiles/.vimrc ~/.vimrc
ln -sf ~/dotfiles/init.vim ~/init.vim
ln -sf ~/dotfiles/nvim/lua/config/keymaps.lua ~/.config/nvim/lua/config/keymaps.lua
