-- default desktop configuration for Fedora

import System.Posix.Env (getEnv)
import Data.Maybe (maybe)

import XMonad
import XMonad.Config.Desktop
import XMonad.Config.Gnome
import XMonad.Config.Kde
import XMonad.Config.Xfce

import System.IO                       -- for xmobar

import XMonad.Actions.WindowGo
import XMonad.Actions.FloatKeys
import XMonad.Actions.CycleWS
import XMonad.Actions.UpdatePointer
-- Resize floating windows from any corner
import qualified XMonad.Actions.FlexibleResize as Flex
import XMonad.Hooks.DynamicLog         -- for xmobar
import XMonad.Hooks.EwmhDesktops
import XMonad.Hooks.FadeWindows
import XMonad.Hooks.ManageDocks        -- avoid xmobar area
import XMonad.Hooks.Place
import XMonad.Layout
-- import XMonad.Layout.DecorationMadness
import XMonad.Layout.DragPane          -- see only two window
import XMonad.Layout.Gaps
import XMonad.Layout.Grid
import XMonad.Layout.IM
-- this makes window bigger
import qualified XMonad.Layout.Magnifier as Mag
import XMonad.Layout.MultiToggle
import XMonad.Layout.MultiToggle.Instances
-- import XMonad.Layout.Named
import XMonad.Layout.NoBorders         -- In Full mode, border is no use
import XMonad.Layout.PerWorkspace      -- Configure layouts on a per-workspace
import XMonad.Layout.ResizableTile     -- Resizable Horizontal border
import XMonad.Layout.SimplestFloat
import XMonad.Layout.Spacing           -- this makes smart space around windows
import XMonad.Layout.Tabbed
import XMonad.Layout.ThreeColumns      -- for many windows
import XMonad.Layout.ToggleLayouts     -- Full window at any time
import XMonad.Layout.TwoPane
import XMonad.Util.EZConfig            -- removeKeys, additionalKeys
import XMonad.Util.Run(spawnPipe)      -- spawnPipe, hPutStrLn
import XMonad.Util.Run

import Graphics.X11.ExtraTypes.XF86

-- local variables
myWorkspaces = ["1", "2", "3", "4", "5"]
modm = mod4Mask

-- Color Setting
colorBlue      = "#90caf9"
colorGreen     = "#a5d6a7"
colorRed       = "#ef9a9a"
colorGray      = "#9e9e9e"
colorWhite     = "#ffffff"
colorGrayAlt   = "#eceff1"
colorNormalbg  = "#212121"
colorfg        = "#9fa8b1"

main :: IO ()

main = do
    session <- getEnv "DESKTOP_SESSION"
    wsbar <- spawnPipe myWsBar
    -- xmonad  $ maybe desktopConfig desktop session
    let config = maybe desktopConfig desktop session
    xmonad $ config {
        terminal = "urxvt256c-ml",
        modMask = mod4Mask, -- mod4Mask = super key
        normalBorderColor  = "#dddddd",
        focusedBorderColor = "#3399ff",
        -- any time Full mode, avoid xmobar area
        layoutHook = toggleLayouts (noBorders Full) $ avoidStruts $ myLayout,
        -- xmobar setting
        logHook = myLogHook wsbar
    }

-- Handle Window behaveior
myLayout = (spacing 18 $ ResizableTall 1 (3/100) (3/5) [])
    |||  (spacing 2 $ (dragPane Horizontal (1/10) (1/2)))
    |||  (dragPane Vertical   (1/10) (1/2))

myLogHook h = dynamicLogWithPP $ wsPP { ppOutput = hPutStrLn h }

myWsBar = "xmobar ~/.xmonad/xmobarrc"

wsPP = xmobarPP {
    ppOrder               = \(ws:l:t:_)   -> [ws,t],
    ppCurrent             = xmobarColor   colorGreen       colorNormalbg,
    ppUrgent              = xmobarColor   colorWhite       colorNormalbg,
    ppVisible             = xmobarColor   colorWhite       colorNormalbg,
    ppHidden              = xmobarColor   colorWhite       colorNormalbg,
    ppHiddenNoWindows     = xmobarColor   colorGray        colorNormalbg,
    ppTitle               = xmobarColor   colorWhite       colorNormalbg,
    ppWsSep               = "",
    ppSep                 = "  ::: "
}

desktop "gnome" = gnomeConfig
desktop "kde" = kde4Config
desktop "xfce" = xfceConfig
desktop "xmonad-mate" = gnomeConfig
desktop _ = desktopConfig
