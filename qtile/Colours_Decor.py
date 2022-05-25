from typing import List  # noqa: F401

from libqtile import layout, hook, bar
from qtile_extras import widget
from qtile_extras.bar import Bar
from libqtile.config import Click, Drag, Group, Key, Match, Screen
from libqtile.lazy import lazy
from qtile_extras.widget.decorations import RectDecoration, BorderDecoration

colors_1 = ["#600060", "#992A88", "#758CCA", "#C1F4B6", ""]

colors_2 = ["#C2B2B4", "#6B4E71", "#3A4454", "#53687E", "#F5DDDD"]

colors_3 = ["#98c1d9", "#6969b3", "#533a7b", "#4b244a", "#25171a"]

colors_4 = ["#d4afb9", "#d1cfe2", "#9cadce", "#7ec4cf", "#52b2cf"]

colors_5 = ["#067bc2", "#84bcda", "#ecc30b", "#f37748", "#d56062"]

colors_6 = ["#efd9ce", "#dec0f1", "#b79ced", "#957fef", "#7161ef"]

colors_7 = ["#ffa630", "#d7e8ba", "#4da1a9", "#2e5077", "#611c35"]

colors = ["#d1ccdc", "#424c55", "#f5edf0", "#886f68", "#3d2c2e", "#533a7b"]

colors_dracula = ["#6272a4", "#8be9fd", "#50fa7b",
                  "#ffb86c", "#ff79c6", "#bd93f9", "#ff5555", "#f1fa8c"]

colors_catpuccin = ["#F2CDCD", "#DDB6F2", "#F5C2E7", "#E8A2AF", "#F28FAD", "#F8BD96",
                    "#FAE3B0", "#ABE9B3", "#B5E8E0", "#96CDFB", "#89DCEB"]

foreground_colour = "#000000"
#foreground_colour = "#FFFFFF"

#foreground_colour_icon = "#000000"
foreground_colour_icon = "#FFFFFF"

decor_layout = {
    "decorations": [
        RectDecoration(colour=colors_catpuccin[9], radius=4,
                       filled=True, padding_y=2, padding_x=3)
    ],
    "padding": 18
}

decor_groupbox = {
    "decorations": [
        RectDecoration(colour=colors_catpuccin[0], radius=4,
                       filled=True, padding_y=2, padding_x=3)
    ],
    "padding": 18
}

decor_Wifi = {
    "decorations": [
        RectDecoration(colour=colors_catpuccin[1], radius=4,
                       filled=True, padding_y=2, padding_x=3)
    ],
    "padding": 13
}

decor_ram = {
    "decorations": [
        RectDecoration(colour=colors_catpuccin[2], radius=4,
                       filled=True, padding_y=2, padding_x=3)
    ],
    "padding": 13
}

decor_CPU = {
    "decorations": [
        RectDecoration(colour=colors_catpuccin[3], radius=4,
                       filled=True, padding_y=2, padding_x=3)
    ],
    "padding": 13
}

decor_battery = {
    "decorations": [
        RectDecoration(colour=colors_catpuccin[4], radius=4,
                       filled=True, padding_y=2, padding_x=3)
    ],
    "padding": 13
}

decor_Day = {
    "decorations": [
        RectDecoration(colour=colors_catpuccin[5], radius=4,
                       filled=True, padding_y=2, padding_x=3)
    ],
    "padding": 13
}

decor_Date = {
    "decorations": [
        RectDecoration(colour=colors_catpuccin[6], radius=4,
                       filled=True, padding_y=2, padding_x=3)
    ],
    "padding": 13
}

decor_RPM = {
    "decorations": [
        RectDecoration(colour=colors_catpuccin[7], radius=4,
                       filled=True, padding_y=2, padding_x=3)
    ],
    "padding": 13
}

decor_Temp = {
    "decorations": [
        RectDecoration(colour=colors_catpuccin[8], radius=4,
                       filled=True, padding_y=2, padding_x=3)
    ],
    "padding": 13
}

########################################################################################

# decor_app_menu = {
#     "decorations": [
#         RectDecoration(colour=colors_dracula[0], radius=4,
#                        filled=True, padding_y=2, padding_x=3)
#     ],
#     "padding": 18
# }

# decor_groupbox = {
#     "decorations": [
#         RectDecoration(colour=colors[0], radius=4,
#                        filled=True, padding_y=2, padding_x=3)
#     ],
#     "padding": 18
# }

# decor_Wifi = {
#     "decorations": [
#         RectDecoration(colour=colors[5], radius=4,
#                        filled=True, padding_y=2, padding_x=3)
#     ],
#     "padding": 13
# }

# decor_ram = {
#     "decorations": [
#         RectDecoration(colour=colors[1], radius=4,
#                        filled=True, padding_y=2, padding_x=3)
#     ],
#     "padding": 13
# }

# decor_CPU = {
#     "decorations": [
#         RectDecoration(colour=colors_1[2], radius=4,
#                        filled=True, padding_y=2, padding_x=3)
#     ],
#     "padding": 13
# }

# decor_battery = {
#     "decorations": [
#         RectDecoration(colour=colors_7[2], radius=4,
#                        filled=True, padding_y=2, padding_x=3)
#     ],
#     "padding": 13
# }

# decor_Day = {
#     "decorations": [
#         RectDecoration(colour=colors[3], radius=4,
#                        filled=True, padding_y=2, padding_x=3)
#     ],
#     "padding": 13
# }

# decor_Date = {
#     "decorations": [
#         RectDecoration(colour=colors[4], radius=4,
#                        filled=True, padding_y=2, padding_x=3)
#     ],
#     "padding": 13
# }

# decor_RPM = {
#     "decorations": [
#         RectDecoration(colour=colors_5[4], radius=4,
#                        filled=True, padding_y=2, padding_x=3)
#     ],
#     "padding": 13
# }

# decor_Temp = {
#     "decorations": [
#         RectDecoration(colour=colors_1[1], radius=4,
#                        filled=True, padding_y=2, padding_x=3)
#     ],
#     "padding": 13
# }
