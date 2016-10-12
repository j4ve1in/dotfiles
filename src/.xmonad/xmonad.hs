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
myTerminal = "xmonad-run terminal"
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
myStartupHook = do
  spawnOnce "xmonad-system brightness ="
  spawnOnce "xmonad-system wallpaper"
  spawnOnce "xmonad-daemon {compton,tmux}"
  spawnOnce "xmonad-system mouse"
  spawnOnce "xmonad-system lock-screen"
  spawnOnce "xmonad-system im"
  spawnOnce "xmonad-system xcape"

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
  -- Volume setting media keys
  [ ("<XF86AudioRaiseVolume>",  spawn "xmonad-system volume +")
  , ("<XF86AudioLowerVolume>",  spawn "xmonad-system volume -")
  , ("<XF86AudioMute>",         spawn "xmonad-system volume m")
  , ("M-S-s",                   spawn "xmonad-system volume +")
  , ("M-S-a",                   spawn "xmonad-system volume -")
  , ("M-S-d",                   spawn "xmonad-system volume m")
  -- Brightness Keys
  , ("<XF86MonBrightnessUp>",   spawn "xmonad-system brightness +")
  , ("<XF86MonBrightnessDown>", spawn "xmonad-system brightness -")
  , ("M-S-e",                   spawn "xmonad-system brightness +")
  , ("M-S-w",                   spawn "xmonad-system brightness -")
  -- window operations
  , ("M-l",                     nextWS)
  , ("M-h",                     prevWS)
  , ("M-S-l",                   shiftToNext)
  , ("M-S-h",                   shiftToPrev)
  , ("M-,",                     sendMessage Shrink)
  , ("M-.",                     sendMessage Expand)
  -- mouse
  , ("M-S-m",                   spawn "xmonad-system mouse")
  , ("M-C-h",                   spawn "xmonad-system mouse left")
  , ("M-C-j",                   spawn "xmonad-system mouse down")
  , ("M-C-k",                   spawn "xmonad-system mouse up")
  , ("M-C-l",                   spawn "xmonad-system mouse right")
  , ("M-C-m",                   spawn "xmonad-system mouse click")
  -- Others
  , ("M-r",                     spawn "xmonad-run launcher")
  , ("M-b",                     spawn "xmonad-run browser")
  , ("M-e",                     spawn "xmonad-run editor")
  , ("M-f",                     spawn "xmonad-run filemanager")
  , ("M-<Return>",              spawn myTerminal)
  , ("M-C-r",                   spawn "xmonad-system screencast")
  , ("M-S-r",                   spawn "xmonad-system screencast --select")
  , ("<Print>",                 spawn "xmonad-system screenshot")
  , ("S-<Print>",               spawn "xmonad-system screenshot --select")
  , ("M-p",                     spawn "xmonad-power select")
  , ("M-q",                     spawn "xmonad-power restart")
  ]
