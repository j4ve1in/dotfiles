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
myTerminal = "app-run terminal"
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
myStartupHook = spawnOnce "system-run startup"

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
  -- window operations
  [ ("M-,",                     sendMessage Shrink)
  , ("M-.",                     sendMessage Expand)
  , ("M-S-h",                   shiftToPrev)
  , ("M-S-l",                   shiftToNext)
  , ("M-h",                     prevWS)
  , ("M-l",                     nextWS)
  -- system operations
  , ("<Print>",                 spawn "system-run screenshot")
  , ("<XF86AudioLowerVolume>",  spawn "system-run volume -")
  , ("<XF86AudioMute>",         spawn "system-run volume m")
  , ("<XF86AudioRaiseVolume>",  spawn "system-run volume +")
  , ("<XF86MonBrightnessDown>", spawn "system-run brightness -")
  , ("<XF86MonBrightnessUp>",   spawn "system-run brightness +")
  , ("M-C-s",                   spawn "system-run screencast")
  , ("M-S-m",                   spawn "system-run mouse")
  , ("M-S-s",                   spawn "system-run screencast --select")
  , ("M-q",                     spawn "system-run restart")
  , ("S-<Print>",               spawn "system-run screenshot --select")
  -- launch applications
  , ("M-<Return>",              spawn myTerminal)
  , ("M-C-c",                   spawn "app-run calendar")
  , ("M-C-n",                   spawn "app-run network-manager")
  , ("M-C-p",                   spawn "app-run password-manager")
  , ("M-S-a",                   spawn "app-run system-activity")
  , ("M-S-e",                   spawn "app-run email")
  , ("M-S-v",                   spawn "app-run volume-manager")
  , ("M-a",                     spawn "app-run aggregator")
  , ("M-b",                     spawn "app-run browser")
  , ("M-c",                     spawn "app-run chat-tool")
  , ("M-e",                     spawn "app-run editor")
  , ("M-f",                     spawn "app-run file-manager")
  , ("M-i",                     spawn "app-run irc")
  , ("M-m",                     spawn "app-run music-player")
  , ("M-p",                     spawn "app-run power-manager")
  , ("M-r",                     spawn "app-run launcher")
  , ("M-v",                     spawn "app-run video")
  ]
