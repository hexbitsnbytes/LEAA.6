-- vim: set expandtab:
import XMonad
import XMonad.Layout.Spacing
import XMonad.Hooks.FadeInactive
import XMonad.Util.CustomKeys
import XMonad.Hooks.Place
import XMonad.Hooks.DynamicLog
import XMonad.Util.Paste

inskey _ = [ ((noModMask,        0x1008ff13), spawn "amixer set Master 5%+")
           , ((noModMask,        0x1008ff11), spawn "amixer set Master 5%-")
           , ((noModMask,        0x1008ff02), spawn "xbacklight -inc 10 -time 0 -steps 1")
           , ((noModMask,        0x1008ff03), spawn "xbacklight -dec 10 -time 0 -steps 1")
           , ((shiftMask,            0xff61), spawn "sleep 0.2; scrot -s -e 'mv $f ~/Screenshots/'")
           , ((noModMask,            0xff61), spawn "sleep 0.2; scrot    -e 'mv $f ~/Screenshots/'")
           , ((mod4Mask,               0x6c), spawn "xscreensaver-command -lock")
           , ((mod1Mask .|. shiftMask, 0x20), spawn "xterm ranger")
           ]

myWorkspaces = [ "1:main"
               , "2:web"
               , "3:mail"
               , "4:music"
               , "5:office"
               , "6"
               , "7"
               , "8"
               , "9"
               , "0"
               , "-"
               , "="
               ]

myManageHook = composeAll
    [ className =? "XClock"      --> placeHook (withGaps (10, 10, 10, 10) $ fixed (1, 0)) <+> doShift (myWorkspaces !! 0) <+> doFloat
    , className =? "Audacious"   --> placeHook (withGaps (50, 10, 10, 10) $ fixed (1, 0)) <+> doShift (myWorkspaces !! 0) <+> doFloat
    , className =? "spotify"     --> doShift (myWorkspaces !! 3)
    , className =? "Thunderbird" --> doShift (myWorkspaces !! 2)
    , className =? "Chromium"    --> doFloat <+> doShift (myWorkspaces !! 1)
    , className =? "Hexchat"     --> doShift (myWorkspaces !! 1)
    , className =? "Xmessage"    --> placeHook (fixed (0.5, 0.5)) <+> doFloat
    , appName =? "irssi"         --> doShift (myWorkspaces !! 1)
    , className =? "feh"         --> placeHook (fixed (0.5, 0.5)) <+> doFloat
    ]

myLayoutHook = spacing 1 $ let tall = Tall 1 (3/100) (1/2) 
                           in  tall ||| Mirror tall ||| Full


main = xmonad =<< xmobar defaultConfig
    { terminal           = "uxterm"
    --, modMask          = mod4Mask
    , borderWidth        = 5
    , normalBorderColor  = "#000000"
    , focusedBorderColor = "#000000"
    , workspaces         = myWorkspaces
    , manageHook         = myManageHook <+> manageHook defaultConfig
    , layoutHook         = myLayoutHook
    , logHook            = fadeInactiveLogHook 0.8
    , keys               = customKeys (const []) inskey
    }
