#!/bin/bash
# Mango autostart (niri-session did part of this for you; mango does not)
set +e

# Environment for systemd and D-Bus activated apps
systemctl --user import-environment DISPLAY WAYLAND_DISPLAY XDG_CURRENT_DESKTOP XDG_SESSION_DESKTOP XDG_SESSION_TYPE
dbus-update-activation-environment --systemd WAYLAND_DISPLAY XDG_CURRENT_DESKTOP XDG_SESSION_TYPE

# Portals (screen sharing, file pickers). Only started if installed.
[ -x /usr/libexec/xdg-desktop-portal-gtk ] && /usr/libexec/xdg-desktop-portal-gtk >/dev/null 2>&1 &
[ -x /usr/libexec/xdg-desktop-portal-wlr ] && /usr/libexec/xdg-desktop-portal-wlr >/dev/null 2>&1 &
sleep 1
/usr/libexec/xdg-desktop-portal >/dev/null 2>&1 &

# GTK dark mode preference
gsettings set org.gnome.desktop.interface color-scheme 'prefer-dark'

# Clipboard history, only if cliphist is installed
if command -v cliphist >/dev/null 2>&1; then
    pkill -x wl-paste
    wl-paste --watch cliphist store &
fi

# Noctalia v5 shell (bar, launcher, notifications, dock, OSD, wallpaper, idle/lock)
noctalia &
