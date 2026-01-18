#!/bin/sh

set -eu

ARCH=$(uname -m)
VERSION=$(wget -qO- https://www.gitkraken.com/download | grep "name: " | cut -d"'" -f2) # example command to get version of application here
export ARCH VERSION
export OUTNAME=gitkraken-"$VERSION"-"$ARCH".AppImage
export ADD_HOOKS="self-updater.bg.hook"
export UPINFO="gh-releases-zsync|${GITHUB_REPOSITORY%/*}|${GITHUB_REPOSITORY#*/}|test|*$ARCH.AppImage.zsync"
export ICON=/usr/share/pixmaps/gitkraken.png
export DESKTOP=/usr/share/applications/gitkraken.desktop
export DEPLOY_OPENGL=1
export DEPLOY_VULKAN=1

# Deploy dependencies
quick-sharun /opt/gitkraken/gitkraken

# Additional changes can be done in between here

# Turn AppDir into AppImage
wget -q https://github.com/pkgforge-dev/appimagetool-uruntime/releases/download/continuous/appimagetool-x86_64.AppImage -O /usr/local/bin/appimagetool ; chmod +x /usr/local/bin/appimagetool

export APPIMAGE_EXTRACT_AND_RUN=1

appimagetool --no-appstream -u "$UPINFO" AppDir "$OUTNAME"
