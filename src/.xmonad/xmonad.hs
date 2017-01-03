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
accentColor1  = "blue"
accentColor2  = "#00008b"

myBorderWidth = 1
myModMask = mod4Mask
myTerminal = "xmonad-run Terminal"
myWorkspaces = map show [1..3]
myFocusFollowsMouse = True
myNormalBorderColor = mainColor
myFocusedBorderColor = accentColor1
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
myStartupHook = spawnOnce "xmonad-run startup"

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

myAdditionalKeys =
  -- moving workspace by number
  [ ((myModMask .|. m, k), windows $ f i)
    | (i, k) <- zip myWorkspaces [xK_1 .. xK_3]
  , (f, m) <- [(W.greedyView, 0), (W.shift, shiftMask)]
  ]

myAdditionalKeysP =
  -- system
  [ ("<XF86AudioRaiseVolume>",  spawn "xmonad-run volume +")
  , ("<XF86AudioLowerVolume>",  spawn "xmonad-run volume -")
  , ("<XF86AudioMute>",         spawn "xmonad-run volume m")
  , ("M-S-s",                   spawn "xmonad-run volume +")
  , ("M-S-a",                   spawn "xmonad-run volume -")
  , ("M-S-d",                   spawn "xmonad-run volume m")
  , ("<XF86MonBrightnessUp>",   spawn "xmonad-run brightness +")
  , ("<XF86MonBrightnessDown>", spawn "xmonad-run brightness -")
  , ("M-S-e",                   spawn "xmonad-run brightness +")
  , ("M-S-w",                   spawn "xmonad-run brightness -")
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
  , ("M-r",                     spawn "xmonad-run Launcher")
  , ("M-b",                     spawn "xmonad-run Browser")
  , ("M-e",                     spawn "xmonad-run Editor")
  , ("M-f",                     spawn "xmonad-run FileManager")
  , ("M-m",                     spawn "xmonad-run MusicPlayer")
  , ("M-a",                     spawn "xmonad-run SystemActivity")
  ]
