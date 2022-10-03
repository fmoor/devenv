#!/usr/bin/env bash

set -ex

VERSION="2.0.0"
NAME="arduino-ide_2.0.0_Linux_64bit.AppImage"
INSTALL_PATH="$HOME/.local/bin"
SKETCH_DIR="$HOME/Arduino"

if [[ ! -d "$INSTALL_PATH" ]]; then
    mkdir -p "$INSTALL_PATH"
fi

if [[ ! -f "$INSTALL_PATH/$NAME" ]]; then
    (
        cd "$INSTALL_PATH" && \
        curl -O "https://downloads.arduino.cc/arduino-ide/$NAME"
    )
fi

chmod +x "$INSTALL_PATH/$NAME"
sudo adduser fmoor dialout
sudo apt-get purge brltty

if [[ ! -d "$SKETCH_DIR" ]]; then
    mkdir "$SKETCH_DIR"
fi

cat << EOF > "$HOME/.local/share/applications/arduino.desktop"
[Desktop Entry]
Version=$VERSION
Type=Application
Name=Arduino IDE
Exec="$INSTALL_PATH/$NAME" %f
Categories=Development;IDE;
Terminal=false
EOF
