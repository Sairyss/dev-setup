# tmux config
echo "[TMUX] setting up links for tmux config..."
git clone https://github.com/gpakosz/.tmux.git ~/.tmux &&
  # create a symlink for modified tmux config
  mv ~/.tmux.conf.local ~/.tmux.conf.local.backup &&
  ln -s $CURRENT_DIR/.tmux.conf.local ~/.tmux.conf.local
echo "[TMUX] done"
