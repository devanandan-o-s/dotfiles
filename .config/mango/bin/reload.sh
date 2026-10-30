#!/bin/bash
# Reload mango config (Noctalia keeps running; no restart needed)
if mango -c "$HOME/.config/mango/config.conf" -p; then
    mmsg -d reload_config
    notify-send "Config reloaded" "Mango config applied"
else
    notify-send -u critical "Mango config error" "Run: mango -c ~/.config/mango/config.conf -p"
fi
