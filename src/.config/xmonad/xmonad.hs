import System.IO (hPutStrLn)
import XMonad
import XMonad.Actions.CycleWS (shiftToPrev, shiftToNext, prevWS, nextWS)
import XMonad.Config.Desktop (desktopConfig, desktopLayoutModifiers)
import XMonad.Hooks.DynamicLog
  ( dynamicLogWithPP
  , xmobarPP
  , ppOutput
  , ppOrder
  , ppCurrent
  , ppUrgent
  , ppVisible
  , ppHidden
  , ppHiddenNoWindows
  , ppOutput
  , ppWsSep
  , xmobarColor
  , wrap
  )
import XMonad.Layout.Gaps (gaps)
import XMonad.Layout.NoBorders (noBorders)
import XMonad.Layout.ResizableTile (ResizableTall(..))
import XMonad.Layout.Spacing (spacing)
import XMonad.Layout.ToggleLayouts (ToggleLayout(..), toggleLayouts)
import XMonad.Util.EZConfig (removeKeysP, additionalKeysP)
import XMonad.Util.Run (spawnPipe)
import XMonad.Util.SpawnOnce (spawnOnce)
import XMonad.Util.Types (Direction2D(..))

main = do
  wsbar <- spawnPipe myWsBar
  xmonad $ desktopConfig
    { borderWidth        = myBorderWidth
    , terminal           = myTerminal
    , focusFollowsMouse  = myFocusFollowsMouse
    , normalBorderColor  = myNormalBorderColor
    , focusedBorderColor = myFocusedBorderColor
    , startupHook        = myStartupHook
    , manageHook         = myManageHook
    , layoutHook         = myLayoutHook
    , logHook            = myLogHook wsbar
    , handleEventHook    = myHandleEventHook
    , workspaces         = myWorkspaces
    , modMask            = myModMask
    }
    `removeKeysP` myRemoveKeysP
    `additionalKeysP` myAdditionalKeysP

-- base
myBorderWidth = 1
myModMask = mod4Mask
myTerminal = "launcher terminal"
myWorkspaces = map show [1..3]
myFocusFollowsMouse = True
myNormalBorderColor = mainColor
myFocusedBorderColor = accentColor1
myHandleEventHook = handleEventHook desktopConfig
myManageHook = manageHook desktopConfig

-- color
mainColor = "black"
subColor1 = "white"
subColor2  = "gray"
accentColor1  = "blue"
accentColor2  = "#00008b"

-- layout
myLayoutHook = toggleLayouts (noBorders Full)
  $ desktopLayoutModifiers
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
  spawnOnce "launcher brightness"
  spawnOnce "launcher wallpaper"
  spawnOnce "launcher compositor"
  spawnOnce "launcher multiplexer"
  spawnOnce "launcher screen-locker"
  spawnOnce "launcher mouse"
  spawnOnce "launcher input-method-framework"
  spawnOnce "launcher keyboard"
  spawnOnce "launcher music-server"
  startupHook desktopConfig

-- loghook
myLogHook h = do
  dynamicLogWithPP $ myWsPP {ppOutput = hPutStrLn h}
  logHook desktopConfig

-- xmobar
myWsBar = "xmobar"
myWsPP = xmobarPP
  { ppOrder           = \(ws:l:t:_) -> [ws]
  , ppCurrent         = xmobarColor subColor1 accentColor2 . wrap " " " "
  , ppUrgent          = xmobarColor subColor2 mainColor    . wrap " " " "
  , ppVisible         = xmobarColor subColor2 mainColor    . wrap " " " "
  , ppHidden          = xmobarColor subColor2 mainColor    . wrap " " " "
  , ppHiddenNoWindows = xmobarColor subColor2 mainColor    . wrap " " " "
  , ppOutput          = putStrLn
  , ppWsSep           = ""
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
  , ("M-S-f",                   sendMessage ToggleLayout)
  , ("M-S-h",                   shiftToPrev)
  , ("M-S-l",                   shiftToNext)
  , ("M-h",                     prevWS)
  , ("M-l",                     nextWS)
  -- system operations
  , ("<Print>",                 spawn "launcher screenshot")
  , ("<XF86AudioLowerVolume>",  spawn "launcher volume -")
  , ("<XF86AudioMute>",         spawn "launcher volume m")
  , ("<XF86AudioRaiseVolume>",  spawn "launcher volume +")
  , ("<XF86MonBrightnessDown>", spawn "launcher brightness -")
  , ("<XF86MonBrightnessUp>",   spawn "launcher brightness +")
  , ("M-C-s",                   spawn "launcher screencast")
  , ("M-S-m",                   spawn "launcher mouse")
  , ("M-S-s",                   spawn "launcher screencast --select")
  , ("M-q",                     spawn "launcher restart")
  , ("S-<Print>",               spawn "launcher screenshot --select")
  -- launch applications
  , ("M-<Return>",              spawn myTerminal)
  , ("M-C-c",                   spawn "launcher calendar")
  , ("M-C-m",                   spawn "launcher map")
  , ("M-C-n",                   spawn "launcher network-manager")
  , ("M-C-p",                   spawn "launcher password-manager")
  , ("M-S-a",                   spawn "launcher system-activity")
  , ("M-S-e",                   spawn "launcher email")
  , ("M-S-v",                   spawn "launcher volume-manager")
  , ("M-a",                     spawn "launcher aggregator")
  , ("M-b",                     spawn "launcher browser")
  , ("M-c",                     spawn "launcher chat-tool")
  , ("M-e",                     spawn "launcher editor")
  , ("M-f",                     spawn "launcher file-manager")
  , ("M-m",                     spawn "launcher music-player")
  , ("M-n",                     spawn "launcher network-switcher")
  , ("M-p",                     spawn "launcher power-manager")
  , ("M-r",                     spawn "launcher")
  , ("M-v",                     spawn "launcher video")
  ]
