#!/bin/bash
# Script to bind workspace keys when using virtual-desktops plugin

# Install/enable virtual-desktops plugin
$ hyprpm add https://github.com/levnikmyskin/hyprland-virtual-desktops.git
$ hyprpm enable virtual-desktops

# Reload HyprPM
hyprpm reload -nn

# Define workspace switch bindings
hyprctl keyword bind SUPER, code:10, vdesk, 1
hyprctl keyword bind SUPER, code:11, vdesk, 2
hyprctl keyword bind SUPER, code:12, vdesk, 3
hyprctl keyword bind SUPER, code:13, vdesk, 4
hyprctl keyword bind SUPER, code:14, vdesk, 5
hyprctl keyword bind SUPER, code:15, vdesk, 6
hyprctl keyword bind SUPER, code:16, vdesk, 7
hyprctl keyword bind SUPER, code:17, vdesk, 8
hyprctl keyword bind SUPER, code:18, vdesk, 9
hyprctl keyword bind SUPER, code:19, vdesk, 10

# Define move active window to workspace bindings
hyprctl keyword bind SUPER SHIFT, code:10, movetodesk, 1
hyprctl keyword bind SUPER SHIFT, code:11, movetodesk, 2
hyprctl keyword bind SUPER SHIFT, code:12, movetodesk, 3
hyprctl keyword bind SUPER SHIFT, code:13, movetodesk, 4
hyprctl keyword bind SUPER SHIFT, code:14, movetodesk, 5
hyprctl keyword bind SUPER SHIFT, code:15, movetodesk, 6
hyprctl keyword bind SUPER SHIFT, code:16, movetodesk, 7
hyprctl keyword bind SUPER SHIFT, code:17, movetodesk, 8
hyprctl keyword bind SUPER SHIFT, code:18, movetodesk, 9
hyprctl keyword bind SUPER SHIFT, code:19, movetodesk, 10

# Define move active window to workspace silently bindings
hyprctl keyword bind SUPER CONTROL, code:10, movetodesksilent, 1
hyprctl keyword bind SUPER CONTROL, code:11, movetodesksilent, 2
hyprctl keyword bind SUPER CONTROL, code:12, movetodesksilent, 3
hyprctl keyword bind SUPER CONTROL, code:13, movetodesksilent, 4
hyprctl keyword bind SUPER CONTROL, code:14, movetodesksilent, 5
hyprctl keyword bind SUPER CONTROL, code:15, movetodesksilent, 6
hyprctl keyword bind SUPER CONTROL, code:16, movetodesksilent, 7
hyprctl keyword bind SUPER CONTROL, code:17, movetodesksilent, 8
hyprctl keyword bind SUPER CONTROL, code:18, movetodesksilent, 9
hyprctl keyword bind SUPER CONTROL, code:19, movetodesksilent, 10
