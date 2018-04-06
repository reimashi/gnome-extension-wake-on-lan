#!/bin/bash

EXT_NAME="gnome-extension-wake-on-lan@reimashi.github.com"

INSTALL_DIR=`realpath ~/.local/share/gnome-shell/extensions/${EXT_NAME}`
echo -e "Gnome extensions directory: \e[1;34m${INSTALL_DIR}\e[0m"

BASEDIR=$(dirname "$0")
SOURCE_DIR=`realpath ${BASEDIR}/../dist`
echo -e "Source code directory: \e[1;34m${SOURCE_DIR}\e[0m"

echo -n "Copying files... "
mkdir -p ${INSTALL_DIR}
cp -Rf ${SOURCE_DIR}/* ${INSTALL_DIR}
echo -e "\e[0;32mOK\e[0m"

echo -n "Enabling extension... "
EXTENSION_LIST=$(gsettings get org.gnome.shell enabled-extensions | sed 's/^@as //' | tr -d '[]')
[ "${EXTENSION_LIST}" != "" ] && EXTENSION_LIST="${EXTENSION_LIST},"
EXTENSION_ENABLED=$(echo ${EXTENSION_LIST} | grep ${EXT_NAME})
[ "$EXTENSION_ENABLED" = "" ] && gsettings set org.gnome.shell enabled-extensions "[${EXTENSION_LIST}'${EXT_NAME}']"
echo -e "\e[0;32mOK\e[0m"

echo -n "Reloading gnome shell... "
gnome-shell --replace &
# dbus-send --type=method_call --print-reply --dest=org.gnome.Shell /org/gnome/Shell org.gnome.Shell.Eval string:'global.reexec_self()'
echo -e "\e[0;32mOK\e[0m"
