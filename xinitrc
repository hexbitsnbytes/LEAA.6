#!/bin/sh

userresources=$HOME/.Xresources
usermodmap=$HOME/.Xmodmap
sysresources=/etc/X11/xinit/.Xresources
sysmodmap=/etc/X11/xinit/.Xmodmap

# merge in defaults and keymaps

if [ -f $sysresources ]; then
    xrdb -merge $sysresources
fi

if [ -f $sysmodmap ]; then
    xmodmap $sysmodmap
fi

if [ -f "$userresources" ]; then
    xrdb -merge "$userresources"
fi

if [ -f "$usermodmap" ]; then
    xmodmap "$usermodmap"
fi

# Disable touchpad
#$HOME/bin/dtouch

# Compositing manager with shadows and 25ms fade
/usr/bin/compton -bcf --fade-delta="15"

# Random background image
#RNDIMAGE=$(find $HOME/Téléchargements/screensaver*.jpg | shuf | head -n1)
#RNDIMAGE=$(find $HOME/Téléchargements/screensaver*.jpeg) 
#feh --bg-scale "${RNDIMAGE}"
feh --bg-scale "$HOME/Téléchargements/screensaver_cosmos.jpeg" 

# xrandr
# $HOME/.screenlayout/defaultLayout.sh

# xmonad
/usr/bin/xmonad

# Disable touchpad
# Should probably work on the hook, when mouse is attached
#xinput disable $(xinput list | grep TouchPad | cut -f2 | cut -d= -f2)
#                                                ^           ^
#                                              id=xx   ->    xx
