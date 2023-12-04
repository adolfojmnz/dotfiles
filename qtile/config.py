import os

from libqtile import bar, layout, widget
from libqtile.config import Click, Drag, Group, Key, Match, Screen
from libqtile.lazy import lazy
from libqtile.utils import guess_terminal

mod = "mod4"
user = os.getlogin()
terminal = guess_terminal()

os.system("nitrogen --restore")
os.system("redshitf -O 4500")
os.system(f"python /home/{user}/.config/polybar/launch.py"),

custom_keys = [
    # Session
    Key(["control", "shift"], "p", lazy.spawn("systemctl poweroff")),
    Key(["control", "shift"], "o", lazy.spawn("systemctl reboot")),
    Key(["control", "shift"], "i", lazy.spawn("systemctl hibernate")),
    Key(["control", "shift"], "u", lazy.spawn("systemctl sleep")),

    # Audio Keybindings
    Key([mod], "F1", lazy.spawn("pamixer --toggle-mute")),
    Key([mod], "F2", lazy.spawn("pamixer --decrease 5")),
    Key([mod], "F3", lazy.spawn("pamixer --increase 5")),

    # Audio Keybindings (Laptop Events)
    Key([], "XF86AudioLowerVolume", lazy.spawn("pamixer --decrease 5")),
    Key([], "XF86AudioRaiseVolume", lazy.spawn("pamixer --increase 5")),

    # Video Keybindings
    Key([mod], "F7", lazy.spawn("xbacklight -dec 5")),
    Key([mod], "F8", lazy.spawn("xbacklight -inc 5")),
    Key([mod], "F6", lazy.spawn("xset dpms force off")),

    # Applications Shorcuts
    Key([mod], "f", lazy.spawn("firefox")),
    Key([mod], "b", lazy.spawn("brave")),
    Key([mod], "c", lazy.spawn("code")),
    Key([mod], "s", lazy.spawn("subl")),
    Key([mod], "p", lazy.spawn("postman")),
    Key([mod], "i", lazy.spawn("insomnia")),
    Key([mod], "g", lazy.spawn("gnome-calculator")),
    Key([mod], "n", lazy.spawn("nautilus")),

    # Open terminal in default group
    Key([mod], "Return", lazy.spawn(terminal)),
    # Open terminal in current group
    Key([mod, "control"], "Return", lazy.spawn(terminal,
        f"cd {lazy.group.name!r}")),
]

default_keys = [
    # Qtile Reload And Shutdown
    Key(
        [mod, "control"], "r",
        lazy.reload_config(),
        os.system(f"python /home/{user}/.config/polybar/launch.py"),
    ),
    Key([mod, "control"], "q", lazy.shutdown(), desc="Shutdown Qtile"),
    Key([mod], "r", lazy.spawncmd(), desc="Spawn a command using a prompt widget"),
    Key([mod], "d", lazy.spawn("rofi -show drun -theme gruvbox-dark-soft")),

    # Switch between windows
    Key([mod], "h", lazy.layout.left(), desc="Move focus to left"),
    Key([mod], "l", lazy.layout.right(), desc="Move focus to right"),
    Key([mod], "j", lazy.layout.down(), desc="Move focus down"),
    Key([mod], "k", lazy.layout.up(), desc="Move focus up"),
    Key([mod], "space", lazy.layout.next(), desc="Move window focus to other window"),

    # Move windows between left/right columns or move up/down in current stack.
    # Moving out of range in Columns layout will create new column.
    Key(
        [mod, "shift"], "h", lazy.layout.shuffle_left(), desc="Move window to the left"
    ),
    Key(
        [mod, "shift"],
        "l",
        lazy.layout.shuffle_right(),
        desc="Move window to the right",
    ),
    Key([mod, "shift"], "j", lazy.layout.shuffle_down(), desc="Move window down"),
    Key([mod, "shift"], "k", lazy.layout.shuffle_up(), desc="Move window up"),

    # Grow windows. If current window is on the edge of screen and direction
    # will be to screen edge - window would shrink.
    Key([mod, "control"], "h", lazy.layout.grow_left(), desc="Grow window to the left"),
    Key(
        [mod, "control"], "l", lazy.layout.grow_right(), desc="Grow window to the right"
    ),
    Key([mod, "control"], "j", lazy.layout.grow_down(), desc="Grow window down"),
    Key([mod, "control"], "k", lazy.layout.grow_up(), desc="Grow window up"),
    Key([mod, "control"], "n", lazy.layout.normalize(), desc="Reset all window sizes"),

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
]

keys = custom_keys + default_keys

groups = [
    Group("1", matches=[
        Match(wm_class=["Postman", "Insomnia", "Code", "Subl"])]
    ),
    Group("2", matches=[Match(wm_class=["firefox", "Brave-browser"])]),
    Group("3"),
    Group("4"),
    Group("5", matches=[Match(wm_class=["mpv"])]),
    Group("6", matches=[Match(wm_class=["org.gnome.Nautilus"])]),
    Group("7", matches=[Match(wm_class=["obs"])]),
    Group("8"),
    Group("9"),
    Group("0", matches=[Match(wm_class=["Alacritty"])]),
]

for i in groups:
    keys.extend(
        [
            # mod + group: switch to group
            Key(
                [mod],
                i.name,
                lazy.group[i.name].toscreen(),
                desc="Switch to group {}".format(i.name),
            ),
            # mod + shift + group: move focused window to group &
            #                      switch to that group
            Key(
                [mod, "shift"],
                i.name,
                lazy.window.togroup(i.name, switch_group=True),
                desc="Switch to & move focused window to group {}".format(i.name),
            ),
            # mod1 + alt + letter of group = move focused window to group
            Key(
                [mod, "shift"],
                i.name,
                lazy.window.togroup(i.name),
                desc="move focused window to group {}".format(i.name),
            ),
        ]
    )

layouts = [
    layout.Columns(border_focus_stack=["#d75f5f", "#8f3d3d"], border_width=4),
    layout.Max(),
    # Try more layouts by unleashing below layouts.
    # layout.Stack(num_stacks=2),
    # layout.Bsp(),
    # layout.Matrix(),
    # layout.MonadTall(),
    # layout.MonadWide(),
    # layout.RatioTile(),
    # layout.Tile(),
    # layout.TreeTab(),
    # layout.VerticalTile(),
    # layout.Zoomy(),
]

widget_defaults = dict(
    font="sans",
    fontsize=12,
    padding=3,
)
extension_defaults = widget_defaults.copy()

screens = [Screen()]

# Drag floating layouts.
mouse = [
    Drag(
        [mod],
        "Button1",
        lazy.window.set_position_floating(),
        start=lazy.window.get_position(),
    ),
    Drag(
        [mod], "Button3", lazy.window.set_size_floating(), start=lazy.window.get_size()
    ),
    Click([mod], "Button2", lazy.window.bring_to_front()),
]

dgroups_key_binder = None
dgroups_app_rules = []  # type: list
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
        Match(wm_class="gnome-calculator"),
    ]
)
auto_fullscreen = True
focus_on_window_activation = "smart"
reconfigure_screens = True

# If things like steam games want to auto-minimize themselves when losing
# focus, should we respect this or not?
auto_minimize = True

# When using the Wayland backend, this can be used to configure input devices.
wl_input_rules = None

# XXX: Gasp! We're lying here. In fact, nobody really uses or cares about this
# string besides java UI toolkits; you can see several discussions on the
# mailing lists, GitHub issues, and other WM documentation that suggest setting
# this string if your java app doesn't work correctly. We may as well just lie
# and say that we're a working one by default.
#
# We choose LG3D to maximize irony: it is a 3D non-reparenting WM written in
# java that happens to be on java's whitelist.
wmname = "LG3D"
