#!/bin/bash

sudo pacman -Sc --noconfirm
sudo pacman -Qdt --noconfirm
sudo pacman -Rns $(pacman -Qtdq) --noconfirm
yay -Sc --noconfirm
sudo journalctl --vacuum-size=50M
paccache -r
