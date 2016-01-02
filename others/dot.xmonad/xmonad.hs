import qualified Data.Map as M

import XMonad
import qualified XMonad.StackSet as W

import System.IO                       -- for xmobar

import XMonad.Actions.CopyWindow
import XMonad.Actions.CycleWS
import qualified XMonad.Actions.FlexibleResize as Flex -- flexible resize
import XMonad.Actions.FloatKeys
import XMonad.Actions.UpdatePointer
import XMonad.Actions.WindowGo
import XMonad.Hooks.DynamicLog         -- for xmobar
import XMonad.Hooks.EwmhDesktops
import XMonad.Hooks.FadeWindows
import XMonad.Hooks.ManageDocks        -- avoid xmobar area
import XMonad.Hooks.ManageHelpers
import XMonad.Hooks.Place
import XMonad.Layout
import XMonad.Layout.DragPane          -- see only two window
import XMonad.Layout.Gaps
import XMonad.Layout.MultiToggle
import XMonad.Layout.MultiToggle.Instances
import XMonad.Layout.NoBorders         -- In Full mode, border is no use
import XMonad.Layout.PerWorkspace      -- Configure layouts on a per-workspace
import XMonad.Layout.ResizableTile     -- Resizable Horizontal border
import XMonad.Layout.Simplest
import XMonad.Layout.SimplestFloat
import XMonad.Layout.Spacing           -- this makes smart space around windows
import XMonad.Layout.Tabbed
import XMonad.Layout.ThreeColumns      -- for many windows
import XMonad.Layout.ToggleLayouts     -- Full window at any time
import XMonad.Layout.TwoPane
import XMonad.Prompt
import XMonad.Prompt.Window            -- pops up a prompt with window names
import XMonad.Util.EZConfig            -- removeKeys, additionalKeys
import XMonad.Util.Run
import XMonad.Util.Run(spawnPipe)      -- spawnPipe, hPutStrLn

import Graphics.X11.ExtraTypes.XF86

-- local variables
myWorkspaces = ["0", "1", "2", "3"]
modm = mod4Mask

-- Color Setting
colorBlue      = "#3399ff"
colorGreen     = "#a5d6a7"
colorRed       = "#ef9a9a"
colorGray      = "#9e9e9e"
colorWhite     = "#ffffff"
colorGrayAlt   = "#eceff1"
colorNormalbg  = "black"
colorfg        = "#9fa8b1"

-- Border width
borderwidth = 1

-- Border color
mynormalBorderColor  = colorNormalbg
myfocusedBorderColor = colorBlue

-- gapwidth
gapwidth  = 9
gapwidthU = 7
gapwidthD = 8
gapwidthL = 37
gapwidthR = 38

-- Define keys to remove
keysToRemove x = [
        -- Unused gmrun binding
        (modm .|. shiftMask, xK_p),
        -- Unused close window binding
        (modm .|. shiftMask, xK_c),
        (modm .|. shiftMask, xK_Return)
    ]

-- Delete the keys combinations we want to remove.
strippedKeys x = foldr M.delete (keys defaultConfig x) (keysToRemove x)

-- main
main :: IO ()

main = do
    wsbar <- spawnPipe myWsBar
    xmonad $ ewmh defaultConfig {
       borderWidth        = borderwidth,
       terminal           = "urxvtc",
       focusFollowsMouse  = True,
       normalBorderColor  = mynormalBorderColor,
       focusedBorderColor = myfocusedBorderColor,
       startupHook        = myStartupHook,
       manageHook         = myManageHookFloat <+>
                              manageDocks,
       -- any time Full mode, avoid xmobar area
       layoutHook         = -- lessBorders OnlyFloat $
                              toggleLayouts (avoidStruts $ noBorders Full) $
                              -- onWorkspace "3" simplestFloat $
                              avoidStruts $ myLayout,
       -- xmobar setting
       logHook            = myLogHook wsbar,
       handleEventHook    = fadeWindowsEventHook <+>
                              fullscreenEventHook,
       workspaces         = myWorkspaces,
       modMask            = modm,
       mouseBindings      = newMouse
    }

        -- Keymap: window operations
        `additionalKeys`
        [
            -- Shrink / Expand the focused window
            ((modm                , xK_comma  ), sendMessage Shrink),
            ((modm                , xK_period ), sendMessage Expand),
            ((modm                , xK_z      ), sendMessage MirrorShrink),
            ((modm                , xK_a      ), sendMessage MirrorExpand),
            -- Close the focused window
            ((modm                , xK_c      ), kill1),
            -- Toggle layout (Fullscreen mode)
            ((modm                , xK_f      ), sendMessage ToggleLayout),
            -- Move the focused window
            ((modm .|. controlMask, xK_Right  ), withFocused (keysMoveWindow (2,0))),
            ((modm .|. controlMask, xK_Left   ), withFocused (keysMoveWindow (-2,0))),
            ((modm .|. controlMask, xK_Up     ), withFocused (keysMoveWindow (0,-2))),
            ((modm .|. controlMask, xK_Down   ), withFocused (keysMoveWindow (0,2))),
            -- Resize the focused window
            ((modm                , xK_s      ), withFocused (keysResizeWindow (-6,-6) (0.5,0.5))),
            ((modm                , xK_i      ), withFocused (keysResizeWindow (6,6) (0.5,0.5))),
            -- Increase / Decrese the number of master pane
            ((modm .|. shiftMask  , xK_semicolon), sendMessage $ IncMasterN 1),
            ((modm                , xK_minus  ), sendMessage $ IncMasterN (-1)),
            -- Go to the next / previous workspace
            ((modm                , xK_Right  ), nextWS ),
            ((modm                , xK_Left   ), prevWS ),
            ((modm                , xK_l      ), nextWS ),
            ((modm                , xK_h      ), prevWS ),
            -- Shift the focused window to the next / previous workspace
            ((modm .|. shiftMask  , xK_Right  ), shiftToNext),
            ((modm .|. shiftMask  , xK_Left   ), shiftToPrev),
            ((modm .|. shiftMask  , xK_l      ), shiftToNext),
            ((modm .|. shiftMask  , xK_h      ), shiftToPrev),
            -- CopyWindow
            ((modm                , xK_v      ), windows copyToAll),
            ((modm .|. shiftMask  , xK_v      ), killAllOtherCopies),
            -- Move the focus down / up
            ((modm                , xK_Down   ), windows W.focusDown),
            ((modm                , xK_Up     ), windows W.focusUp),
            ((modm                , xK_j      ), windows W.focusDown),
            ((modm                , xK_k      ), windows W.focusUp),
            -- Swap the focused window down / up
            ((modm .|. shiftMask  , xK_j      ), windows W.swapDown),
            ((modm .|. shiftMask  , xK_k      ), windows W.swapUp),
            -- Shift the focused window to the master window
            ((modm .|. shiftMask  , xK_m      ), windows W.shiftMaster),
            -- Search a window and focus into the window
            ((modm                , xK_g      ), windowPromptGoto myXPConfig),
            -- Search a window and bring to the current workspace
            ((modm                , xK_b      ), windowPromptBring myXPConfig),
            -- Move the focus to next screen (multi screen)
            ((modm                , xK_w      ), nextScreen)
        ]

        -- Keymap: moving workspace by number
        `additionalKeys`
        [ ((modm .|. m, k), windows $ f i)
          | (i, k) <- zip myWorkspaces [xK_0 .. xK_3]
          , (f, m) <- [(W.greedyView, 0), (W.shift, shiftMask)]
        ]

        -- Keymap: custom commands
        `additionalKeys`
        [
            -- Lock screen
            ((mod1Mask .|. controlMask, xK_l      ), spawn "xscreensaver-command -lock"),
            -- Launch terminal
            ((modm                    , xK_Return ), spawn "urxvtc"),
            -- Launch terminal with a float window
            ((modm .|. shiftMask      , xK_Return ), spawn "$HOME/bin/urxvt_float.sh"),
            -- Launch web browser
            ((modm                    , xK_w      ), spawn "luakit"),
            -- Launch dmenu for launching applicatiton
            ((modm                    , xK_p      ), spawn "exe=`dmenu_run -nb black -fn 'Migu 1M:size=13.5'` && exec $exe"),
            -- Lauch websearch application (See https://github.com/ssh0/web_search)
            ((mod1Mask .|. controlMask, xK_f      ), spawn "websearch"),
            -- Play / Pause media keys
            ((0                       , 0x1008ff18), spawn "sh $HOME/bin/cplay.sh"),
            ((0                       , 0x1008ff14), spawn "sh $HOME/bin/cplay.sh"),
            ((shiftMask               , 0x1008ff18), spawn "streamradio pause"),
            ((shiftMask               , 0x1008ff14), spawn "streamradio pause"),
            -- Volume setting media keys
            ((0                       , 0x1008ff13), spawn "bash $HOME/bin/sound_volume_change_wrapper.sh +"),
            ((0                       , 0x1008ff11), spawn "bash $HOME/bin/sound_volume_change_wrapper.sh -"),
            ((0                       , 0x1008ff12), spawn "bash $HOME/bin/sound_volume_change_wrapper.sh m"),
            -- Brightness Keys
            ((0                       , 0x1008FF02), spawn "xbacklight + 1 -time 100 -steps 1"),
            ((0                       , 0x1008FF03), spawn "xbacklight - 1 -time 100 -steps 1"),
            -- Take a screenshot (whole window)
            ((0                       , 0xff61    ), spawn "$HOME/bin/screenshot.sh"),
            -- Take a screenshot (selected area)
            ((shiftMask               , 0xff61    ), spawn "$HOME/bin/screenshot_select.sh"),
            -- Launch ipython qtconsole
            ((0                       , 0x1008ff1d), spawn "ipython qtconsole --matplotlib=inline"),
            -- Toggle touchpad
            ((controlMask             , xK_Escape ), spawn "$HOME/bin/touchpad_toggle.sh"),
            -- Toggle trackpoint (Lenovo PC)
            ((mod1Mask                , xK_Escape ), spawn "$HOME/bin/trackpoint_toggle.sh")
        ]

-- myLayout: Handle Window behaveior
myLayout = spacing gapwidth $
           gaps [(U, gapwidthU),(D, gapwidthD),(L, gapwidthL),(R, gapwidthR)] $
                 (ResizableTall 1 (1/40) (1/2) [])
             ||| (TwoPane (1/40) (1/2))
             ||| (ThreeColMid 1 (1/20) (16/35))
             ||| Simplest

-- myStartupHook: Start up applications
myStartupHook = do
    spawn "$HOME/.dropbox-dist/dropboxd"
    spawn "urxvtd -q -f -o"
    spawn "xbacklight -set 1%"

-- myManageHookFloat: new window will created in Float mode
myManageHookFloat = composeAll [
        className =? "feh"              --> doCenterFloat,
        className =? "Shutter"          --> doCenterFloat,
        className =? "Screenkey"        --> (doRectFloat $ W.RationalRect 0.7 0.9 0.3 0.1),
        title     =? "urxvt_float"      --> doCenterFloat,
        isFullscreen                    --> doFullFloat
    ]

-- myLogHook: loghock settings
myLogHook h = dynamicLogWithPP $ wsPP { ppOutput = hPutStrLn h }

-- myWsBar: xmobar setting
myWsBar = "xmobar $HOME/.xmonad/xmobarrc"
wsPP = xmobarPP {
    ppOrder           = \(ws:l:t:_)  -> [ws,t],
    ppCurrent         = xmobarColor colorWhite colorBlue . wrap " " "* ",
    ppUrgent          = xmobarColor colorfg    colorNormalbg . wrap " " " ",
    ppVisible         = xmobarColor colorfg    colorNormalbg . wrap " " " ",
    ppHidden          = xmobarColor colorfg    colorNormalbg . wrap " " " ",
    ppHiddenNoWindows = xmobarColor colorfg    colorNormalbg . wrap " " "- ",
    ppTitle           = xmobarColor colorWhite colorNormalbg,
    ppOutput          = putStrLn,
    ppWsSep           = "",
    ppSep             = " : "
}

-- myXPConfig: XPConfig
myXPConfig = defaultXPConfig {
    font              = "xft:Migu 1M:size=13.5:antialias=true",
    fgColor           = colorfg,
    bgColor           = colorNormalbg,
    borderColor       = colorNormalbg,
    height            = 18,
    promptBorderWidth = 1,
    autoComplete      = Just 100000,
    bgHLight          = colorWhite,
    fgHLight          = colorNormalbg,
    position          = Top
}

-- newMouse: Right click is used for resizing window
myMouse x = [ ((modm, button3), (\w -> focus w >> Flex.mouseResizeWindow w)) ]
newMouse x = M.union (mouseBindings defaultConfig x) (M.fromList (myMouse x))
