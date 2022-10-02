#!/usr/bin/env bash

set -ex

(

gnome-extensions disable ubuntu-dock@ubuntu.com
gsettings set org.gnome.desktop.background picture-uri ""
gsettings set org.gnome.desktop.background primary-color '#000000'
gsettings set org.gnome.desktop.background color-shading-type 'solid'
gsettings set org.gnome.desktop.interface gtk-theme 'Adwaita-dark'

# gsettings set org.gnome.shell.extensions.desktop-icons show-trash false
# gsettings set org.gnome.shell.extensions.desktop-icons show-home false

gsettings set org.gnome.shell.extensions.ding show-trash false
gsettings set org.gnome.shell.extensions.ding show-home false

gsettings set org.gtk.Settings.FileChooser clock-format '12h'
gsettings set org.gnome.desktop.interface clock-format '12h'

)
