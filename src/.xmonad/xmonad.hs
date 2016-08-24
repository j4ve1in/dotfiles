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

main :: IO ()

main = do
  wsbar <- spawnPipe myWsBar
  xmonad $ ewmh defaultConfig
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
    `additionalKeys` myAdditionalKeys
    `additionalKeysP` myAdditionalKeysP

-- color
mainColor = "black"
subColor1 = "white"
subColor2  = "gray"
accentColor  = "blue"

myBorderWidth = 1
myModMask = mod4Mask
myTerminal = "urxvt-tmux"
myWorkspaces = map show [1..3]
myFocusFollowsMouse = True
myNormalBorderColor = mainColor
myFocusedBorderColor = accentColor
myEventHook = fullscreenEventHook

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
myStartupHook = do
  spawnOnce "urxvtd -q -f -o"
  spawnOnce "tmux new-session -s 0 -d"
  spawnOnce "touchpad-toggle"

-- loghook
myLogHook h = dynamicLogWithPP $ wsPP { ppOutput = hPutStrLn h }

-- managehook
myManageHook = composeAll
  [ manageDocks
  , isFullscreen            --> doFullFloat
  , className =? "feh"      --> doCenterFloat
  ]

-- xmobar
myWsBar = "xmobar -i ~/.xmonad/icons/ ~/.xmonad/xmobar.hs"
wsPP = xmobarPP
  { ppOrder           = \(ws:l:t:_)  -> [ws]
  , ppCurrent         = xmobarColor subColor1 accentColor . wrap " " "* "
  , ppUrgent          = xmobarColor subColor2 mainColor   . wrap " " " "
  , ppVisible         = xmobarColor subColor2 mainColor   . wrap " " " "
  , ppHidden          = xmobarColor subColor2 mainColor   . wrap " " " "
  , ppHiddenNoWindows = xmobarColor subColor2 mainColor   . wrap " " "- "
  , ppTitle           = xmobarColor subColor1 mainColor
  , ppOutput          = putStrLn
  , ppWsSep           = ""
  , ppSep             = " "
  }

-- keybind
myRemoveKeysP =
  [ "M-S-p"
  ,"M-S-<Return>"
  ]

myAdditionalKeys =
  -- moving workspace by number
  [ ((myModMask .|. m, k), windows $ f i)
    | (i, k) <- zip myWorkspaces [xK_1 .. xK_3]
  , (f, m) <- [(W.greedyView, 0), (W.shift, shiftMask)]
  ]

myAdditionalKeysP =
  -- Volume setting media keys
  [ ("<XF86AudioRaiseVolume>",  spawn "volume +")
  , ("<XF86AudioLowerVolume>",  spawn "volume -")
  , ("<XF86AudioMute>",         spawn "volume m")
  , ("M-S-s",                   spawn "volume +")
  , ("M-S-a",                   spawn "volume -")
  , ("M-S-d",                   spawn "volume m")
  -- Brightness Keys
  , ("<XF86MonBrightnessUp>",   spawn "brightness +")
  , ("<XF86MonBrightnessDown>", spawn "brightness -")
  , ("M-S-e",                   spawn "brightness +")
  , ("M-S-w",                   spawn "brightness -")
  -- window operations
  , ("M-l",                     nextWS)
  , ("M-h",                     prevWS)
  , ("M-S-l",                   shiftToNext)
  , ("M-S-h",                   shiftToPrev)
  , ("M-,",                     sendMessage Shrink)
  , ("M-.",                     sendMessage Expand)
  -- Others
  , ("M-p",                     spawn "power")
  , ("M-r",                     spawn "launcher")
  , ("M-w",                     spawn "chromium")
  , ("M-<Return>",              spawn myTerminal)
  , ("M-C-r",                   spawn "screencast")
  , ("M-S-r",                   spawn "screencast --select")
  , ("<Print>",                 spawn "screenshot")
  , ("S-<Print>",               spawn "screenshot --select")
  , ("M-q",                     spawn "xmonad-restart")
  , ("M-S-t",                   spawn "touchpad-toggle")
  , ("M-C-l",                   spawn "systemctl suspend")
  ]
