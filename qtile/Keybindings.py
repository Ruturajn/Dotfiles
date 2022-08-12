from typing import List  # noqa: F401

from libqtile import layout, hook, bar
#from libqtile import widget
from qtile_extras import widget
from qtile_extras.bar import Bar
from libqtile.config import Click, Drag, Group, Key, Match, Screen
from libqtile.lazy import lazy
from libqtile.command import lazy
from qtile_extras.widget.decorations import RectDecoration, BorderDecoration

import os
import subprocess
import psutil
import fontawesome as fa

mod = "mod4"
terminal = "alacritty"
browser = "brave-browser"
file_manager = "nautilus"

from qtile_extras.popup.toolkit import (
    PopupRelativeLayout,
    PopupImage,
    PopupText
)

def show_power_menu(qtile):

    controls = [
        PopupImage(
            filename="~/.config/qtile/icons/log-out-new.png",
            pos_x=0.15,
            pos_y=0.1,
            width=0.1,
            height=0.5,
            highlight="#00000000",
            mouse_callbacks={
                "Button1": lazy.shutdown()
            }
        ),
        PopupImage(
            filename="~/.config/qtile/icons/switch.png",
            pos_x=0.45,
            pos_y=0.1,
            width=0.1,
            height=0.5,
            highlight="#00000000",
            mouse_callbacks={
                "Button1": lazy.spawn("poweroff")
            }
        ),
        PopupImage(
            filename="~/.config/qtile/icons/sync-new-2.png",
            pos_x=0.75,
            pos_y=0.1,
            width=0.1,
            height=0.5,
            highlight="#00000000",
            mouse_callbacks={
                "Button1": lazy.spawn("reboot")
            }
        ),
        PopupText(
            text="Log Out",
            font="JetBrains Mono",
            fontsize=15,
            pos_x=0.085,
            pos_y=0.7,
            width=0.2,
            height=0.2,
            h_align="center"
        ),
        PopupText(
            text="Shutdown",
            font="JetBrains Mono",
            fontsize=15,
            pos_x=0.4,
            pos_y=0.7,
            width=0.2,
            height=0.2,
            h_align="center"
        ),
        PopupText(
            text="Reboot",
            font="JetBrains Mono",
            fontsize=15,
            pos_x=0.7,
            pos_y=0.7,
            width=0.2,
            height=0.2,
            h_align="center"
        )
    ]

    layout = PopupRelativeLayout(
        qtile,
        width=1000,
        height=200,
        controls=controls,
        background="#00000060",
        initial_focus=None,
    )

    layout.show(centered=True)

keys = [
    # A list of available commands that can be bound to keys can be found
    # at https://docs.qtile.org/en/latest/manual/config/lazy.html
    # Switch between windows
    Key([mod], "h", lazy.layout.left(), desc="Move focus to left"),
    Key([mod], "l", lazy.layout.right(), desc="Move focus to right"),
    Key([mod], "j", lazy.layout.down(), desc="Move focus down"),
    Key([mod], "k", lazy.layout.up(), desc="Move focus up"),
    Key([mod], "space", lazy.layout.next(),
        desc="Move window focus to other window"),
    # Move windows between left/right columns or move up/down in current stack.
    # Moving out of range in Columns layout will create new column.
    Key([mod, "shift"], "h", lazy.layout.shuffle_left(),
        desc="Move window to the left"),
    Key([mod, "shift"], "l", lazy.layout.shuffle_right(),
        desc="Move window to the right"),
    Key([mod, "shift"], "j", lazy.layout.shuffle_down(), desc="Move window down"),
    Key([mod, "shift"], "k", lazy.layout.shuffle_up(), desc="Move window up"),
    # Grow windows. If current window is on the edge of screen and direction
    # will be to screen edge - window would shrink.
    Key([mod, "control"], "h", lazy.layout.grow_left(),
        desc="Grow window to the left"),
    Key([mod, "control"], "l", lazy.layout.grow_right(),
        desc="Grow window to the right"),
    Key([mod, "control"], "j", lazy.layout.grow_down(), desc="Grow window down"),
    Key([mod, "control"], "k", lazy.layout.grow_up(), desc="Grow window up"),
    Key([mod], "n", lazy.layout.normalize(), desc="Reset all window sizes"),
    Key(["control", "shift"], "l", lazy.spawn(
        "rofi -show drun"), desc="Launch Rofi"),
    Key([mod, "control"], "s", lazy.spawn(
        "flameshot gui"), desc="Lauch Flameshot GUI"),
    # Toggle between split and unsplit sides of stack.
    # Split = all windows displayed
    # Unsplit = 1 window displayed, like Max layout, but still with
    # multiple stack panes
    Key(
        [mod, "shift"],
        "Return",
        lazy.layout.toggle_split(),
        desc="Toggle between split and unsplit sides of stack",
    ),
    Key([mod], "Return", lazy.spawn(terminal), desc="Launch terminal"),
    # Toggle between different layouts as defined below
    Key([mod], "Tab", lazy.next_layout(), desc="Toggle between layouts"),
    Key([mod], "w", lazy.window.kill(), desc="Kill focused window"),
    Key([mod, "control"], "r", lazy.reload_config(), desc="Reload the config"),
    Key([mod, "control"], "q", lazy.shutdown(), desc="Shutdown Qtile"),
    Key([mod], "r", lazy.spawncmd(), desc="Spawn a command using a prompt widget"),
    Key([], "XF86AudioLowerVolume", lazy.spawn(
        os.path.expanduser("~/.config/qtile/Scripts/vol_script down")), desc="Increase System Volume"),
    Key([], "XF86AudioRaiseVolume", lazy.spawn(
        os.path.expanduser("~/.config/qtile/Scripts/vol_script up")), desc="Deccrease System Volume"),
    Key([], "XF86AudioMute", lazy.spawn(
        os.path.expanduser("~/.config/qtile/Scripts/vol_script toggle")), desc="Mute System Volume"),
    Key([mod], "b", lazy.spawn(browser), desc="Launch Brave"),
    Key([mod], "f", lazy.spawn(file_manager), desc="Launch File Manager Nemo"),
    Key(["mod1"], "t", lazy.spawn(os.path.expanduser(
        "~/.config/qtile/Scripts/cpu_temp")), desc="Display CPU Core Temperature"),
    Key(["mod1"], "f", lazy.spawn(os.path.expanduser(
        "~/.config/qtile/Scripts/fan_speed")), desc="Display CPU Fan Speed"),
    Key([], "XF86MonBrightnessDown", lazy.spawn(os.path.expanduser(
        "~/.config/qtile/Scripts/bright_control down")), desc="Decrease Screen Brightness"),
    Key([], "XF86MonBrightnessUp", lazy.spawn(os.path.expanduser(
        "~/.config/qtile/Scripts/bright_control up")), desc="Increase Screen Brightness"),
    Key([], "XF86AudioPlay", lazy.spawn("playerctl play-pause"),
        desc="Toggle Play-Pasue Music"),
    Key([], "XF86AudioPrev", lazy.spawn("playerctl previous"),
        desc="Play Previous Music Track"),
    Key([], "XF86AudioNext", lazy.spawn(
        "playerctl next"), desc="Play Next Music Track"),
    Key([], "XF86AudioStop", lazy.spawn("playerctl stop"), desc="Stop the Music"),
    Key([mod, "shift"], "q", lazy.function(show_power_menu), desc="Launch Powermenu"),
    Key(["mod1"], "w", lazy.spawn(os.path.expanduser("~/.config/qtile/Scripts/wifi_menu")), desc="Launch Wi-fi menu script"),
    Key(["mod1"], "p", lazy.spawn(os.path.expanduser("~/.config/qtile/Scripts/wal-set")), desc="Change colorscheme with pywal")]
