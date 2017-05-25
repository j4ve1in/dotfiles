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
myTerminal = "xmonad-run terminal"
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
  spawnOnce "xmonad-run brightness"
  spawnOnce "xmonad-run wallpaper"
  spawnOnce "xmonad-run compositor"
  spawnOnce "xmonad-run multiplexer"
  spawnOnce "xmonad-run screen-locker"
  spawnOnce "xmonad-run mouse"
  spawnOnce "xmonad-run input-method-framework"
  spawnOnce "xmonad-run keyboard"
  spawnOnce "xmonad-run music-server"
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
  , ("<Print>",                 spawn "xmonad-run screenshot")
  , ("<XF86AudioLowerVolume>",  spawn "xmonad-run volume -")
  , ("<XF86AudioMute>",         spawn "xmonad-run volume m")
  , ("<XF86AudioRaiseVolume>",  spawn "xmonad-run volume +")
  , ("<XF86MonBrightnessDown>", spawn "xmonad-run brightness -")
  , ("<XF86MonBrightnessUp>",   spawn "xmonad-run brightness +")
  , ("M-C-d",                   spawn "xmonad-run switch-display")
  , ("M-C-s",                   spawn "xmonad-run screencast")
  , ("M-S-m",                   spawn "xmonad-run mouse")
  , ("M-S-s",                   spawn "xmonad-run screencast --select")
  , ("M-q",                     spawn "xmonad-run restart")
  , ("S-<Print>",               spawn "xmonad-run screenshot --select")
  -- launch applications
  , ("M-<Return>",              spawn myTerminal)
  , ("M-C-c",                   spawn "xmonad-run calendar")
  , ("M-C-l",                   spawn "xmonad-run launcher")
  , ("M-C-m",                   spawn "xmonad-run map")
  , ("M-C-n",                   spawn "xmonad-run network-manager")
  , ("M-C-p",                   spawn "xmonad-run password-manager")
  , ("M-S-e",                   spawn "xmonad-run email")
  , ("M-S-v",                   spawn "xmonad-run volume-manager")
  , ("M-a",                     spawn "xmonad-run system-activity")
  , ("M-b",                     spawn "xmonad-run browser")
  , ("M-c",                     spawn "xmonad-run chat-tool")
  , ("M-e",                     spawn "xmonad-run editor")
  , ("M-f",                     spawn "xmonad-run file-manager")
  , ("M-m",                     spawn "xmonad-run music-player")
  , ("M-n",                     spawn "xmonad-run network-switcher")
  , ("M-p",                     spawn "xmonad-run power-manager")
  , ("M-r",                     spawn "xmonad-run rss-reader")
  , ("M-v",                     spawn "xmonad-run video")
  ]
