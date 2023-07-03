# Run this script after installing Lazy Vim https://github.com/folke/lazy.nvim

CURRENT_DIR=$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)

echo "[neovim] creating sym links for lazy vim config..."

mv ~/.config/nvim/lua/config/lazy.lua ~/.config/nvim/lua/config/lazy.lua.backup &&
  ln -s $CURRENT_DIR/config/lazy.lua ~/.config/nvim/lua/config/lazy.lua

mv ~/.config/nvim/lua/config/keymaps.lua ~/.config/nvim/lua/config/keymaps.lua.backup &&
  ln -s $CURRENT_DIR/config/keymaps.lua ~/.config/nvim/lua/config/keymaps.lua

ln -s $CURRENT_DIR/plugins/plugins.lua ~/.config/nvim/lua/plugins/plugins.lua

ln -s $CURRENT_DIR/plugins/colorscheme.lua ~/.config/nvim/lua/plugins/colorscheme.lua
