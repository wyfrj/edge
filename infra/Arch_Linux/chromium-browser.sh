#!/bin/bash

XDG_CONFIG_HOME=${XDG_CONFIG_HOME:-~/.config}

# Allow users to override command-line options
if [[ -f $XDG_CONFIG_HOME/Chromium-flags.conf ]]; then
   Chromium_USER_FLAGS="$(cat $XDG_CONFIG_HOME/Chromium-flags.conf)"
fi

# Launch
exec /opt/chromium.org/Chromium/Chromium-browser $Chromium_USER_FLAGS "$@"
