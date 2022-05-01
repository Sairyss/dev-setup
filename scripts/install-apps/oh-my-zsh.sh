# oh-my-zsh
git clone https://github.com/robbyrussell/oh-my-zsh.git ~/.oh-my-zsh >/dev/null &&

  # zsh syntax highlighting https://github.com/zsh-users/zsh-syntax-highlighting
  git clone https://github.com/zsh-users/zsh-syntax-highlighting.git "$HOME/.zsh-syntax-highlighting" --depth 1 ^^ >/dev/null &&

  # autosuggestions https://github.com/zsh-users/zsh-autosuggestions
  git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
