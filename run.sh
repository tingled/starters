# zsh
sudo apt-get install -y zsh curl git
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

# fzf
git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
~/.fzf/install

cp .tmux.conf ~/

# git clone git@github.com:vim/vim.git

git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
cp .vimrc ~/

sudo cp bin/* /usr/local/bin/

cp .gitignore_global ~/
git config --global core.excludesfile ~/.gitignore_global
