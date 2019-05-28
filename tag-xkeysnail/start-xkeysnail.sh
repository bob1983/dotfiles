#!/usr/bin/env bash
if [ -x /usr/local/bin/xkeysnail ]; then
  xhost +SI:localuser:root
  sudo /usr/local/bin/xkeysnail /home/bob/dotfiles/tag-xkeysnail/xkeysnail-config.py &
fi
