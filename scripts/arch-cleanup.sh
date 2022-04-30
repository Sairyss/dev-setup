#!/bin/bash

sudo pacman -Sc --noconfirm
sudo pacman -Qdt
sudo pacman -Rns $(pacman -Qtdq)
yay -Sc --noconfirm
sudo journalctl --vacuum-size=50M
paccache -r
