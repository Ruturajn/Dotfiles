# Copyright (c) 2010 Aldo Cortesi
# Copyright (c) 2010, 2014 dequis
# Copyright (c) 2012 Randall Ma
# Copyright (c) 2012-2014 Tycho Andersen
# Copyright (c) 2012 Craig Barnes
# Copyright (c) 2013 horsik
# Copyright (c) 2013 Tao Sauvage
#
# Permission is hereby granted, free of charge, to any person obtaining a copy
# of this software and associated documentation files (the "Software"), to deal
# in the Software without restriction, including without limitation the rights
# to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
# copies of the Software, and to permit persons to whom the Software is
# furnished to do so, subject to the following conditions:
#
# The above copyright notice and this permission notice shall be included in
# all copies or substantial portions of the Software.
#
# THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
# IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
# FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
# AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
# LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
# OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
# SOFTWARE.

from typing import List  # noqa: F401

from libqtile import layout, hook, bar
#from libqtile import widget
from qtile_extras import widget
from qtile_extras.bar import Bar
from libqtile.config import Click, Drag, Group, Key, Match, Screen
from libqtile.lazy import lazy
from libqtile.utils import guess_terminal
from qtile_extras.widget.decorations import RectDecoration, BorderDecoration

import os
import subprocess
import psutil
import fontawesome as fa


@hook.subscribe.startup
def autostart():
    home = os.path.expanduser('~/.config/qtile/autostart.sh')
    subprocess.run([home])


mod = "mod4"
#terminal = guess_terminal()
#terminal = "gnome-terminal"
terminal = "alacritty"
browser = "brave"
file_manager = "nemo"

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
        os.path.expanduser("~/.config/dunst/vol_script down")), desc="Increase System Volume"),
    Key([], "XF86AudioRaiseVolume", lazy.spawn(
        os.path.expanduser("~/.config/dunst/vol_script up")), desc="Deccrease System Volume"),
    Key([], "XF86AudioMute", lazy.spawn(
        os.path.expanduser("~/.config/dunst/vol_script toggle")), desc="Mute System Volume"),
    Key([mod], "b", lazy.spawn(browser), desc="Launch Firefox"),
    Key([mod], "f", lazy.spawn(file_manager), desc="Launch File Manager Nemo"),
    Key(["mod1"], "c", lazy.spawn(os.path.expanduser("~/.config/qtile/cpu_temp")), desc="Display CPU Core Temperature"),
    Key(["mod1"], "f", lazy.spawn(os.path.expanduser("~/.config/qtile/fan_speed")), desc="Display CPU Fan Speed"),
    Key([], "XF86MonBrightnessDown", lazy.spawn(os.path.expanduser("~/.config/qtile/bright_control down")), desc="Decrease Screen Brightness"),
    Key([], "XF86MonBrightnessUp", lazy.spawn(os.path.expanduser("~/.config/qtile/bright_control up")), desc="Increase Screen Brightness"),
    Key([], "XF86AudioPlay", lazy.spawn("playerctl play-pause"), desc="Toggle Play-Pasue Music"),
    Key([], "XF86AudioPrev", lazy.spawn("playerctl previous"), desc="Play Previous Music Track"),
    Key([], "XF86AudioNext", lazy.spawn("playerctl next"), desc="Play Next Music Track"),
    Key([], "XF86AudioStop", lazy.spawn("playerctl stop"), desc="Stop the Music"),]

#groups = [Group(i) for i in "123456789"]

groups = [
    Group("1", label=fa.icons["terminal"]),
    Group("2", label=fa.icons["firefox"]),
    Group("3", label=fa.icons["code"]),
    Group("4", label=fa.icons["folder"]),
    Group("5", label=fa.icons["github"]),
    Group("6", label=fa.icons["soundcloud"]),
    Group("7", label=fa.icons["gamepad"]),
    #Group("8", label = fa.icons["firefox"]),
    #Group("9", label = fa.icons["firefox"]),
]

for i in groups:
    keys.extend(
        [
            # mod1 + letter of group = switch to group
            Key(
                [mod],
                i.name,
                lazy.group[i.name].toscreen(),
                desc="Switch to group {}".format(i.name),
            ),
            # mod1 + shift + letter of group = switch to & move focused window to group
            Key(
                [mod, "shift"],
                i.name,
                lazy.window.togroup(i.name, switch_group=True),
                desc="Switch to & move focused window to group {}".format(
                    i.name),
            ),
            # Or, use below if you prefer not to switch to that group.
            # # mod1 + shift + letter of group = move focused window to group
            # Key([mod, "shift"], i.name, lazy.window.togroup(i.name),
            #     desc="move focused window to group {}".format(i.name)),
        ]
    )

layouts = [
    # layout.Columns(border_focus_stack=["#d75f5f", "#8f3d3d"], border_width=4),
    layout.Columns(border_focus_stack=[
                   "#533a7b", "#533a7b"], border_width=3, margin=8, border_focus="#533a7b"),
    layout.Max(),
    # Try more layouts by unleashing below layouts.
    # layout.Stack(num_stacks=2),
    # layout.Bsp(),
    # layout.Matrix(),
    layout.MonadTall(),
    layout.Floating(),
    # layout.MonadWide(),
    # layout.RatioTile(),
    layout.Tile(),
    # layout.TreeTab(),
    # layout.VerticalTile(),
    # layout.Zoomy(),
]

widget_defaults = dict(
    font="JetBrains Mono",
    fontsize=16,
    padding=5,
)
extension_defaults = widget_defaults.copy()

colors_1 = ["#600060", "#992A88", "#758CCA", "#C1F4B6", ""]

colors_2 = ["#C2B2B4", "#6B4E71", "#3A4454", "#53687E", "#F5DDDD"]

colors_3 = ["#98c1d9", "#6969b3", "#533a7b", "#4b244a", "#25171a"]

colors_4 = ["#d4afb9", "#d1cfe2", "#9cadce", "#7ec4cf", "#52b2cf"]

colors_5 = ["#067bc2", "#84bcda", "#ecc30b", "#f37748", "#d56062"]

colors_6 = ["#efd9ce", "#dec0f1", "#b79ced", "#957fef", "#7161ef"]

colors_7 = ["#ffa630", "#d7e8ba", "#4da1a9", "#2e5077", "#611c35"]

colors = ["#d1ccdc", "#424c55", "#f5edf0", "#886f68", "#3d2c2e", "#533a7b"]


decor_groupbox = {
    "decorations": [
        RectDecoration(colour=colors[0], radius=7,
                       filled=True, padding_y=2, padding_x=3)
    ],
    "padding": 18
}


decor_ram = {
    "decorations": [
        RectDecoration(colour=colors[1], radius=4,
                       filled=True, padding_y=2, padding_x=3)
    ],
    "padding": 13
}

decor_CPU = {
    "decorations": [
        RectDecoration(colour=colors_1[2], radius=4,
                       filled=True, padding_y=2, padding_x=3)
    ],
    "padding": 13
}

decor_wallpaper = {
    "decorations": [
        RectDecoration(colour=colors[1], radius=4,
                       filled=True, padding_y=2, padding_x=3)
    ],
    "padding": 13
}

decor_battery = {
    "decorations": [
        RectDecoration(colour=colors_7[2], radius=4,
                       filled=True, padding_y=2, padding_x=3)
    ],
    "padding": 13
}

decor_Day = {
    "decorations": [
        RectDecoration(colour=colors[3], radius=4,
                       filled=True, padding_y=2, padding_x=3)
    ],
    "padding": 13
}

decor_Date = {
    "decorations": [
        RectDecoration(colour=colors[4], radius=4,
                       filled=True, padding_y=2, padding_x=3)
    ],
    "padding": 13
}

decor_Wifi = {
    "decorations": [
        RectDecoration(colour=colors[5], radius=4,
                       filled=True, padding_y=2, padding_x=3)
    ],
    "padding": 13
}

screens = [
    Screen(
        top=bar.Bar(
            [
                widget.CurrentLayoutIcon(),
                widget.GroupBox(highlight_method="line", highlight_color="#d1cfe2", foreground="#000000",
                                rounded=True, **decor_groupbox, hide_unused=False, active="#000000"),
                widget.Prompt(**decor_ram),
                widget.Spacer(length=670),
                widget.CheckUpdates(background="#00000000", foreground="#FF0000",
                                    colour_have_updates="#000000", colour_no_updates="#000000", **decor_ram),
                widget.Systray(background="#00000000", icon_size=20),
                # widget.Net(interface="wlp2s0", background="#00000000",
                #            format=fa.icons["wifi"]+" {up}"+fa.icons["arrow-up"]+" {down} "+fa.icons["arrow-down"], **decor_Wifi),
                widget.Net(interface="wlp2s0", background="#00000000",
                           format=fa.icons["wifi"]+" {up}", **decor_Wifi),
                widget.Memory(background="#00000000", foreground="#FFFFFF",
                              measure_mem='G', format=fa.icons["server"] + "{MemUsed: .2f} GB", **decor_ram),
                # Can also use fa.icons["microchip"], fa.icons["chart-bar"]
                # widget.CPU(format=fa.icons["microchip"]+" {freq_current}GHz {load_percent}%",**decor_wallpaper),
                widget.CPU(format=fa.icons["microchip"]+" {load_percent}%",**decor_CPU),
                widget.Battery(background="#00000000", foreground="#000000",
                               charge_char=fa.icons["bolt"], discharge_char="",
                               update_interval=1,
                               format=fa.icons["battery-three-quarters"] + "{char} {percent:2.0%}", notify_below=20, notification_timeout=15,**decor_battery),
                widget.Clock(format=fa.icons["calendar"] + " %d %b %Y %a",
                             background="#00000000", foreground="#FFFFFF", **decor_Day),
                widget.Clock(format=fa.icons["clock"] + " %I:%M %p",
                             background="#00000000", foreground="#FFFFFF", **decor_Date),
            ],
            27,
            border_width=[0, 0, 0, 0],  # Draw top and bottom borders
            # border_color=["ff00ff", "000000", "ff00ff", "000000"],  # Borders are magenta
            background="#00000000",
            #margin = [5,5,5,5],
            # opacity=1,
        ),
    ),
]


# Drag floating layouts.
mouse = [
    Drag(["control"], "Button1", lazy.window.set_position_floating(),
         start=lazy.window.get_position()),
    Drag(["control"], "Button3", lazy.window.set_size_floating(),
         start=lazy.window.get_size()),
    Click(["control"], "Button2", lazy.window.bring_to_front()),
]

dgroups_key_binder = None
dgroups_app_rules = []  # type: List
follow_mouse_focus = True
bring_front_click = False
cursor_warp = False
floating_layout = layout.Floating(
    float_rules=[
        # Run the utility of `xprop` to see the wm class and name of an X client.
        *layout.Floating.default_float_rules,
        Match(wm_class="confirmreset"),  # gitk
        Match(wm_class="makebranch"),  # gitk
        Match(wm_class="maketag"),  # gitk
        Match(wm_class="ssh-askpass"),  # ssh-askpass
        Match(title="branchdialog"),  # gitk
        Match(title="pinentry"),  # GPG key password entry
    ]
)
auto_fullscreen = True
focus_on_window_activation = "smart"
reconfigure_screens = True

# If things like steam games want to auto-minimize themselves when losing
# focus, should we respect this or not?
auto_minimize = True

# XXX: Gasp! We're lying here. In fact, nobody really uses or cares about this
# string besides java UI toolkits; you can see several discussions on the
# mailing lists, GitHub issues, and other WM documentation that suggest setting
# this string if your java app doesn't work correctly. We may as well just lie
# and say that we're a working one by default.
#
# We choose LG3D to maximize irony: it is a 3D non-reparenting WM written in
# java that happens to be on java's whitelist.
wmname = "LG3D"
