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
from libqtile.config import Click, Drag, DropDown, Group, Key, Match, ScratchPad, Screen
from libqtile.lazy import lazy
from libqtile.utils import guess_terminal
from qtile_extras.widget.decorations import RectDecoration, BorderDecoration

# Importing keys and colours
from Keybindings import *
from Colours_Decor import *

from qtile_extras.popup.toolkit import (
PopupRelativeLayout,
PopupImage,
PopupText
)

import os
import subprocess
import psutil
import fontawesome as fa


@hook.subscribe.startup
def autostart():
    home = os.path.expanduser('~/.config/qtile/autostart.sh')
    subprocess.run([home])

@hook.subscribe.startup_once
def start_dex():
    subprocess.run(["/usr/bin/dex", "-a"])

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
    layout.Bsp(margin=8, border_focus="#533a7b", fair=False, border_on_single=True),
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

groups.append(ScratchPad('scratchpad', [
    DropDown('calendar', 'yad --calendar', x=0.015, width=0.2, height=0.2, opacity=1)
    ]
))

screens = [
    Screen(
        top=bar.Bar(
            [
                widget.TextBox("", background="#00000000", foreground=foreground_colour_icon, fontsize=28, mouse_callbacks={"Button1" : lazy.spawn("rofi -show drun")}),
                widget.CurrentLayoutIcon(),
                widget.CurrentLayout(**decor_layout, foreground=foreground_colour),
                widget.Clock(format=fa.icons["calendar"] + " %d-%m-%y %a",
                    background="#00000000", foreground=foreground_colour, **decor_Day, mouse_callbacks={"Button1" : lazy.group['scratchpad'].dropdown_toggle('calendar')}),
                widget.Clock(format=" %I:%M:%S %p",
                             background="#00000000", foreground=foreground_colour, **decor_Date),
                # widget.Net(interface="wlp2s0", background="#00000000", foreground=foreground_colour,
                #            format=fa.icons["wifi"]+" {up}", **decor_Wifi),
                widget.Net(interface="enp0s3", background="#00000000", foreground=foreground_colour,
                           format=fa.icons["wifi"]+" {up}", **decor_Wifi),
                widget.Spacer(length=bar.STRETCH),
                widget.GroupBox(highlight_method="line", highlight_color="#00000000", foreground=foreground_colour,
                                rounded=True, **decor_groupbox, hide_unused=False, active="#000000", margin_x=6,
                                borderwidth=4),
                widget.Spacer(length=bar.STRETCH),
                widget.Prompt(**decor_ram),
                widget.CheckUpdates(background="#00000000", foreground="#FF0000",
                                    colour_have_updates="#000000", colour_no_updates="#000000", **decor_ram),
                widget.Systray(background="#00000000", icon_size=20),
                widget.Memory(background="#00000000", foreground=foreground_colour,
                              measure_mem='G', format=fa.icons["server"] + "{MemUsed: .2f} GB", **decor_ram),
                # Can also use fa.icons["microchip"], fa.icons["chart-bar"]
                # widget.CPU(format=fa.icons["microchip"]+" {freq_current}GHz {load_percent}%",**decor_wallpaper),
                widget.CPU(format=fa.icons["microchip"]+" {load_percent}%", foreground=foreground_colour, **decor_CPU),
                widget.GenPollText(update_interval=1, func=lambda: "{}%".format(subprocess.check_output(os.path.expanduser("~/.config/qtile/Scripts/bat_poll")).decode("utf-8")),
                                   background="#00000000", foreground=foreground_colour, **decor_battery),
                widget.GenPollText(update_interval=600, func=lambda: " {} RPM".format(subprocess.check_output(os.path.expanduser("~/.config/qtile/Scripts/fan_speed_text")).decode("utf-8")),
                                   background="#00000000", foreground=foreground_colour, **decor_RPM),
                widget.GenPollText(update_interval=600, func=lambda: " {}°C".format(subprocess.check_output(os.path.expanduser("~/.config/qtile/Scripts/cpu_temp_text")).decode("utf-8")),
                                   background="#00000000", foreground=foreground_colour, **decor_Temp),
                widget.TextBox("", background="#00000000",foreground=foreground_colour_icon, fontsize=20, mouse_callbacks={"Button1" : lazy.function(show_power_menu)}),
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
    Drag(["mod1"], "Button1", lazy.window.set_position_floating(),
         start=lazy.window.get_position()),
    Drag(["mod1"], "Button3", lazy.window.set_size_floating(),
         start=lazy.window.get_size()),
    Click(["mod1"], "Button2", lazy.window.bring_to_front()),
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
        Match(title="pinentry"), # GPG key password entry
        Match(wm_class="gnome-disks"), # Gnome Disk Utility
        Match(wm_class="yad"),
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
