CURRENT_DIR=$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)

echo "[VIM] setting up links for vim config..."
# create a symlink for neovim config
mv ~/.config/nvim/init.vim ~/.config/nvim/init.vim.backup &&
  ln -s $CURRENT_DIR/init.vim ~/.config/nvim/init.vim

# install LunarVim https://github.com/LunarVim/LunarVim
bash <(curl -s https://raw.githubusercontent.com/lunarvim/lunarvim/master/utils/installer/install.sh) &&
  # create a symlink for lunar vim config
  mv ~/.config/lvim/config.lua ~/.config/lvim/config.lua.backup &&
  ln -s $CURRENT_DIR/config.lua ~/.config/lvim/config.lua
echo "[VIM] done"

ln -s $CURRENT_DIR/lv ~/.local/bin
