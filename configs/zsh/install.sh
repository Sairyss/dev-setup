echo '[ZSH] Setting up custom zsh configs'
CURRENT_DIR=$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)
mkdir ~/.zsh/custom
ln -s $CURRENT_DIR/zsh/aliases.sh ~/.zsh/custom/aliases.sh
ln -s $CURRENT_DIR/zsh/config.sh ~/.zsh/custom/config.sh
ln -s $CURRENT_DIR/zsh/functions.sh ~/.zsh/custom/functions.sh
echo 'source ~/.zsh/custom/config.sh' >>~/.zshrc
echo '[ZSH] done'
