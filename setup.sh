#!/bin/bash
set -e

# Cleanup incase script failed before.
for p in LibStub CallbackHandler-1.0 AceAddon-3.0 AceEvent-3.0 AceDB-3.0 AceLocale-3.0 AceGUI-3.0 AceConsole-3.0 AceConfig-3.0 AceHook-3.0 LibUIDropDownMenu LibDropDownExtension-1.0; do
  rm $p -rf
done

rm /tmp/ace3.zip -f
rm /tmp/Ace3 -rf
rm /tmp/\!LibUIDropDownMenu -rf

# Download/Extrace Ace3 Libs
curl -Lo /tmp/ace3.zip "https://edge.forgecdn.net/files/3312/435/Ace3-Release-r1252.zip"
unzip /tmp/ace3.zip -d /tmp
for p in LibStub CallbackHandler-1.0 AceAddon-3.0 AceEvent-3.0 AceDB-3.0 AceLocale-3.0 AceGUI-3.0 AceConsole-3.0 AceConfig-3.0 AceHook-3.0; do
  cp -r /tmp/Ace3/$p $p
done
rm /tmp/Ace3 -rf

# Download LibDropDownExtension Lib
mkdir LibDropDownExtension-1.0
curl -Lo LibDropDownExtension-1.0/LibDropDownExtension.lua "https://raw.githubusercontent.com/Vladinator89/wow-addon-libdropdownextension/master/LibDropDownExtension.lua"

# Download/Extract LibDropDownMenu Lib
curl -Lo /tmp/LibDropDownMenu.zip "https://www.wowace.com/projects/libuidropdownmenu/files/latest"
unzip /tmp/LibDropDownMenu.zip -d /tmp
cp -r /tmp/\!LibUIDropDownMenu/LibUIDropDownMenu LibUIDropDownMenu
rm /tmp/\!LibUIDropDownMenu -rf
