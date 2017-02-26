import XMonad
import System.IO
import XMonad.Actions.CycleWS
import XMonad.Hooks.DynamicLog
import XMonad.Hooks.EwmhDesktops
import XMonad.Hooks.ManageDocks
import XMonad.Hooks.ManageHelpers
import XMonad.Layout.Gaps
import XMonad.Layout.Spacing
import XMonad.Layout.ResizableTile
import XMonad.Util.EZConfig
import XMonad.Util.Run(spawnPipe)
import XMonad.Util.SpawnOnce
import qualified XMonad.StackSet as W

main = do
  wsbar <- spawnPipe myWsBar
  xmonad $ docks $ ewmh defaultConfig
    { borderWidth        = myBorderWidth
    , terminal           = myTerminal
    , focusFollowsMouse  = myFocusFollowsMouse
    , normalBorderColor  = myNormalBorderColor
    , focusedBorderColor = myFocusedBorderColor
    , startupHook        = myStartupHook
    , manageHook         = myManageHook
    , layoutHook         = myLayout
    , logHook            = myLogHook wsbar
    , handleEventHook    = myEventHook
    , workspaces         = myWorkspaces
    , modMask            = myModMask
    }
    `removeKeysP` myRemoveKeysP
    `additionalKeysP` myAdditionalKeysP

-- base
myBorderWidth = 1
myModMask = mod4Mask
myTerminal = "xmonad-run terminal"
myWorkspaces = map show [1..3]
myFocusFollowsMouse = True
myNormalBorderColor = mainColor
myFocusedBorderColor = accentColor1
myEventHook = fullscreenEventHook

-- color
mainColor = "black"
subColor1 = "white"
subColor2  = "gray"
accentColor1  = "blue"
accentColor2  = "#00008b"

-- layout
myLayout = avoidStruts
  $ spacing gwW
  $ gaps [(U, gwU),(D, gwD),(L, gwL),(R, gwR)]
  $ (ResizableTall 1 (1/40) (1/2) [])
  where
    gwW = 7
    gwU = 7
    gwD = 7
    gwL = 0
    gwR = 0

-- startup
myStartupHook = spawnOnce "xmonad-run startup"

-- loghook
myLogHook h = dynamicLogWithPP $ myWsPP { ppOutput = hPutStrLn h }

-- managehook
myManageHook = composeAll
  [ manageDocks
  , isDialog           --> doFloat
  , isFullscreen       --> doFullFloat
  , className =? "feh" --> doCenterFloat
  ]

-- xmobar
myWsBar = "xmobar -i $XDG_CONFIG_HOME/xmonad/icons/ $XDG_CONFIG_HOME/xmonad/xmobar.hs"
myWsPP = xmobarPP
  { ppOrder           = \(ws:l:t:_)  -> [ws]
  , ppCurrent         = xmobarColor subColor1 accentColor2 . wrap " " "* "
  , ppUrgent          = xmobarColor subColor2 mainColor    . wrap " " " "
  , ppVisible         = xmobarColor subColor2 mainColor    . wrap " " " "
  , ppHidden          = xmobarColor subColor2 mainColor    . wrap " " " "
  , ppHiddenNoWindows = xmobarColor subColor2 mainColor    . wrap " " "- "
  , ppTitle           = xmobarColor subColor1 mainColor
  , ppOutput          = putStrLn
  , ppWsSep           = ""
  , ppSep             = " "
  }

-- keybind
myRemoveKeysP =
  [ "M-S-p"
  , "M-n"
  , "M-<Space>"
  ,"M-S-<Return>"
  ]

myAdditionalKeysP =
  -- system
  [ ("<XF86AudioRaiseVolume>",  spawn "xmonad-run volume +")
  , ("<XF86AudioLowerVolume>",  spawn "xmonad-run volume -")
  , ("<XF86AudioMute>",         spawn "xmonad-run volume m")
  , ("<XF86MonBrightnessUp>",   spawn "xmonad-run brightness +")
  , ("<XF86MonBrightnessDown>", spawn "xmonad-run brightness -")
  , ("M-S-m",                   spawn "xmonad-run mouse toggle")
  , ("M-C-h",                   spawn "xmonad-run mouse left")
  , ("M-C-j",                   spawn "xmonad-run mouse down")
  , ("M-C-k",                   spawn "xmonad-run mouse up")
  , ("M-C-l",                   spawn "xmonad-run mouse right")
  , ("M-C-m",                   spawn "xmonad-run mouse click")
  , ("M-C-r",                   spawn "xmonad-run screencast")
  , ("M-S-r",                   spawn "xmonad-run screencast --select")
  , ("<Print>",                 spawn "xmonad-run screenshot")
  , ("S-<Print>",               spawn "xmonad-run screenshot --select")
  , ("M-p",                     spawn "xmonad-run power")
  , ("M-q",                     spawn "xmonad-run restart")
  -- window operations
  , ("M-l",                     nextWS)
  , ("M-h",                     prevWS)
  , ("M-S-l",                   shiftToNext)
  , ("M-S-h",                   shiftToPrev)
  , ("M-,",                     sendMessage Shrink)
  , ("M-.",                     sendMessage Expand)
  -- launch app
  , ("M-<Return>",              spawn myTerminal)
  , ("M-r",                     spawn "xmonad-run launcher")
  , ("M-b",                     spawn "xmonad-run browser")
  , ("M-c",                     spawn "xmonad-run color-picker")
  , ("M-e",                     spawn "xmonad-run editor")
  , ("M-S-e",                   spawn "xmonad-run email")
  , ("M-f",                     spawn "xmonad-run file-manager")
  , ("M-m",                     spawn "xmonad-run music-player")
  , ("M-a",                     spawn "xmonad-run system-activity")
  , ("M-y",                     spawn "xmonad-run youtube")
  , ("M-v",                     spawn "xmonad-run volume-manager")
  ]
