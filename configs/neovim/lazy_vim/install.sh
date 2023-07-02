# Run this script after installing Lazy Vim https://github.com/folke/lazy.nvim

CURRENT_DIR=$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)

echo "[neovim] creating sym links for lazy vim config..."

mv ~/.config/nvim/config/lazy.lua ~/.config/nvim/config/lazy.lua.backup &&
  ln -s $CURRENT_DIR/config/lazy.lua ~/.config/nvim/config/lazy.lua

mv ~/.config/nvim/config/keymaps.lua ~/.config/nvim/config/keymaps.lua.backup &&
  ln -s $CURRENT_DIR/config/keymaps.lua ~/.config/nvim/config/keymaps.lua

mv ~/.config/nvim/plugins/plugins.lua ~/.config/nvim/plugins/plugins.lua.backup &&
  ln -s $CURRENT_DIR/plugins/plugins.lua ~/.config/nvim/plugins/plugins.lua

ln -s $CURRENT_DIR/plugins/colorscheme.lua ~/.config/nvim/plugins/colorscheme.lua
