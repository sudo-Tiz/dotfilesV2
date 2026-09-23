-- ╔══════════════════════════════════════════════════════════════════════╗
-- ║                     HYPRLAND CONFIGURATION                          ║
-- ╚══════════════════════════════════════════════════════════════════════╝

-- ┌──────────────────────────────────────────────────────────────────────┐
-- │                          SOURCES                                     │
-- └──────────────────────────────────────────────────────────────────────┘

require("monitors")
require("noctalia.noctalia-colors")

-- ┌──────────────────────────────────────────────────────────────────────┐
-- │                          MONITORS                                    │
-- └──────────────────────────────────────────────────────────────────────┘

hl.monitor({ output = "eDP-1", mode = "preferred", position = "auto", scale = 1 })

-- ┌──────────────────────────────────────────────────────────────────────┐
-- │                          VARIABLES                                   │
-- └──────────────────────────────────────────────────────────────────────┘

local ipc = "noctalia msg "
local term = "foot"
local filemanager = term .. " yazicd"
local filemanagerbis = "thunar"
local editor = term .. " nvim"

-- ┌──────────────────────────────────────────────────────────────────────┐
-- │                          GENERAL                                     │
-- └──────────────────────────────────────────────────────────────────────┘

hl.config({
	general = {
		border_size = 1,
		gaps_in = 3,
		gaps_out = 3,
		layout = "dwindle",
		extend_border_grab_area = true,
		hover_icon_on_border = true,
	},

	-- ┌──────────────────────────────────────────────────────────────────────┐
	-- │                          DWINDLE                                     │
	-- └──────────────────────────────────────────────────────────────────────┘

	dwindle = {
		preserve_split = true,
		smart_split = false,
		smart_resizing = true,
		force_split = 0,
		special_scale_factor = 1.0,
	},

	-- ┌──────────────────────────────────────────────────────────────────────┐
	-- │                          INPUT                                       │
	-- └──────────────────────────────────────────────────────────────────────┘

	input = {
		kb_layout = "fr",
		kb_options = "caps:shiftlock",
		numlock_by_default = true,
		repeat_rate = 100,
		repeat_delay = 300,
		natural_scroll = false,
		follow_mouse = 1,
		mouse_refocus = true,
		float_switch_override_focus = 1,
		touchpad = {
			disable_while_typing = false,
			natural_scroll = true,
			scroll_factor = 1.0,
			tap_to_click = true,
			tap_and_drag = true,
		},
	},

	-- ┌──────────────────────────────────────────────────────────────────────┐
	-- │                          LAYOUTS                                     │
	-- └──────────────────────────────────────────────────────────────────────┘

	master = {
		allow_small_split = false,
		special_scale_factor = 0.8,
		mfact = 0.55,
		new_on_top = false,
		orientation = "left",
	},

	-- ┌──────────────────────────────────────────────────────────────────────┐
	-- │                          DECORATION                                  │
	-- └──────────────────────────────────────────────────────────────────────┘

	decoration = {
		rounding = 5,
		blur = {
			enabled = true,
			size = 3,
			passes = 1,
			new_optimizations = true,
		},
	},

	-- ┌──────────────────────────────────────────────────────────────────────┐
	-- │                          MISC                                        │
	-- └──────────────────────────────────────────────────────────────────────┘

	misc = {
		disable_hyprland_logo = true,
		disable_splash_rendering = true,
		vrr = 0,
		layers_hog_keyboard_focus = true,
		focus_on_activate = true,
		on_focus_under_fullscreen = 1,
		mouse_move_focuses_monitor = true,
	},

	-- ┌──────────────────────────────────────────────────────────────────────┐
	-- │                          MISC                                        │
	-- └──────────────────────────────────────────────────────────────────────┘

	gestures = {
		workspace_swipe_touch = true,
		workspace_swipe_cancel_ratio = 0.2,
	},
})

-- ┌──────────────────────────────────────────────────────────────────────┐
-- │                          PER DEVICES                                 │
-- └──────────────────────────────────────────────────────────────────────┘

hl.device({
	name = "e-signal/a-one-usb-gaming-mouse",
	sensitivity = -0.50,
})

-- ┌──────────────────────────────────────────────────────────────────────┐
-- │                          ANIMATIONS                                  │
-- └──────────────────────────────────────────────────────────────────────┘

hl.curve("myBezier", { type = "bezier", points = { { 0.05, 0.9 }, { 0.1, 1.05 } } })

hl.animation({ leaf = "windows", enabled = true, speed = 1, bezier = "myBezier" })
hl.animation({ leaf = "windowsOut", enabled = true, speed = 1, bezier = "default", style = "popin 80%" })
hl.animation({ leaf = "border", enabled = true, speed = 1, bezier = "default" })
hl.animation({ leaf = "borderangle", enabled = true, speed = 1, bezier = "default" })
hl.animation({ leaf = "fade", enabled = true, speed = 1, bezier = "default" })
hl.animation({ leaf = "workspaces", enabled = true, speed = 1, bezier = "default" })

-- ┌──────────────────────────────────────────────────────────────────────┐
-- │                          LAYER                                       │
-- └──────────────────────────────────────────────────────────────────────┘

hl.layer_rule({
	name = "noctalia",
	match = {
		namespace = "^noctalia-(bar-.+|notification|dock|panel|attached-panel|osd|window-switcher)$",
	},
	no_anim = true,
	ignore_alpha = 0.5,
	blur = true,
	blur_popups = true,
})

-- ┌──────────────────────────────────────────────────────────────────────┐
-- │                          WORKSPACES                                  │
-- └──────────────────────────────────────────────────────────────────────┘

hl.workspace_rule({ workspace = "1", persistent = true })
hl.workspace_rule({ workspace = "2", persistent = true })
hl.workspace_rule({ workspace = "3", persistent = true })
hl.workspace_rule({ workspace = "4", persistent = true })
hl.workspace_rule({ workspace = "5", persistent = true })

-- ┌──────────────────────────────────────────────────────────────────────┐
-- │                          WINDOW                                      │
-- └──────────────────────────────────────────────────────────────────────┘

hl.window_rule({ name = "signal-workspace", match = { initial_class = "signal", }, workspace = 9, })
hl.window_rule({ name = "thunderbird-workspace", match = { initial_class = "thunderbird", }, workspace = 8, })

-- ┌──────────────────────────────────────────────────────────────────────┐
-- │                          AUTOSTART                                   │
-- └──────────────────────────────────────────────────────────────────────┘

-- exec (runs on every reload)
hl.exec_cmd("/usr/lib/hyprpolkitagent/hyprpolkitagent")

-- exec-once (runs only at startup)
hl.on("hyprland.start", function()
	hl.exec_cmd("systemctl --user import-environment WAYLAND_DISPLAY XDG_CURRENT_DESKTOP")
	hl.exec_cmd("dbus-update-activation-environment --systemd WAYLAND_DISPLAY XDG_CURRENT_DESKTOP")
	hl.exec_cmd("noctalia")
	hl.exec_cmd("squeekboard")
	hl.exec_cmd("iio-hyprland")
	hl.exec_cmd("wl-paste --type text --watch cliphist store")
	hl.exec_cmd("wl-paste --type image --watch cliphist store")
end)

-- ╔══════════════════════════════════════════════════════════════════════╗
-- ║                         KEYBINDINGS                                  ║
-- ╚══════════════════════════════════════════════════════════════════════╝

-- 1. Applications
hl.bind("SUPER + D", hl.dsp.exec_cmd(ipc .. " panel-toggle launcher"), { description = "Toggle launcher" })
hl.bind("SUPER + X", hl.dsp.exec_cmd(term), { description = "Open terminal" })
hl.bind("SUPER + Return", hl.dsp.exec_cmd(term), { description = "Open terminal" })
hl.bind("SUPER + W", hl.dsp.exec_cmd("brave"), { description = "Open browser (Brave)" })
hl.bind("SUPER + SHIFT + W", hl.dsp.exec_cmd("tor-browser"), { description = "Open Tor Browser" })
hl.bind("SUPER + CONTROL + W", hl.dsp.exec_cmd(term .. " newsboat"), { description = "Open RSS reader (newsboat)" })
hl.bind("SUPER + E", hl.dsp.exec_cmd(filemanager), { description = "Open file manager (yazi)" })
hl.bind("SUPER + SHIFT + E", hl.dsp.exec_cmd(filemanagerbis), { description = "Open file manager (Thunar)" })
hl.bind("SUPER + M", hl.dsp.exec_cmd("thunderbird"), { description = "Open email client (Thunderbird)" })
hl.bind("SUPER + SHIFT + M", hl.dsp.exec_cmd("elisa"), { description = "Open media player (Elisa)" })
hl.bind("SUPER + T", hl.dsp.exec_cmd(editor .. " ~/notes/todo.md"), { description = "Open todo list" })
hl.bind("SUPER + SHIFT + T", hl.dsp.exec_cmd(editor .. " ~/notes/all.md"), { description = "Open all notes" })
hl.bind("SUPER + SHIFT + D", hl.dsp.exec_cmd("rofi-rbw"), { description = "Open password manager" })
hl.bind("SUPER + U", hl.dsp.exec_cmd(ipc .. "panel-toggle launcher /emo"), { description = "Toggle emoji launcher" })
hl.bind("SUPER + O", hl.dsp.exec_cmd("signal-desktop"), { description = "Open Signal" })

-- 2. Shell / UI Controls
hl.bind("SUPER + N", hl.dsp.exec_cmd("nm-connection-editor"), { description = "Open network connection editor" })
hl.bind("SUPER + CONTROL + N", hl.dsp.exec_cmd(ipc .. "panel-toggle network"), { description = "Toggle launcher" })
hl.bind("SUPER + SHIFT + N", hl.dsp.exec_cmd(term .. " nmtui"), { description = "Open network manager TUI" })
hl.bind("SUPER + B", hl.dsp.exec_cmd(ipc .. "panel-toggle bluetooth"), { description = "Toggle bluetooth panel" })
hl.bind("SUPER + SHIFT + B", hl.dsp.exec_cmd("blueman-manager"), { description = "Open bluetooth manager" })
hl.bind( "SUPER + C", hl.dsp.exec_cmd(ipc .. "panel-toggle yuuto/calculator:panel"), { description = "Toggle calculator" })
hl.bind("SUPER + comma", hl.dsp.exec_cmd(ipc .. "settings-toggle"), { description = "Toggle settings" })
hl.bind( "SUPER + A", hl.dsp.exec_cmd(ipc .. " panel-toggle blackbartblues/keymap:panel"), { description = "Toggle keybind cheatsheet" })
hl.bind("SUPER + V", hl.dsp.exec_cmd(ipc .. " panel-toggle clipboard"), { description = "Toggle clipboard history" })
hl.bind("SUPER + SHIFT + V", hl.dsp.exec_cmd("dmenulink"), { description = "Open link picker" })
hl.bind("SUPER + Backspace", hl.dsp.exec_cmd(ipc .. " panel-toggle session"), { description = "Toggle session menu" })

-- 3. Window Management
hl.bind("SUPER + Q", hl.dsp.window.close(), { description = "Close window" })
hl.bind("SUPER + SHIFT + Q", hl.dsp.exec_cmd("hyprctl kill"), { description = "Force kill window" })
hl.bind("SUPER + F", hl.dsp.window.fullscreen(), { description = "Toggle fullscreen" })
hl.bind("SUPER + SHIFT + F", hl.dsp.exec_cmd(ipc .. " bar-toggle"), { description = "Toggle bar" })
hl.bind("SUPER + Space", hl.dsp.window.float(), { description = "Toggle floating" })
hl.bind("SUPER + SHIFT + Space", hl.dsp.window.pin(), { description = "Pin window" })
hl.bind("SUPER + G", hl.dsp.exec_cmd("hyprfreeze -a"), { description = "Freeze window" })
hl.bind("SUPER + asterisk", hl.dsp.exec_cmd("hyprctl reload"), { description = "Reload Hyprland config" })
hl.bind( "SUPER + SHIFT + asterisk", hl.dsp.exec_cmd("pkill noctalia; sleep 1; noctalia"), { description = "Restart noctalia" })
hl.bind("ALT + Tab", hl.dsp.layout("togglesplit"), { description = "Toggle split layout" })

-- 4. Special Workspace
hl.bind( "SUPER + SHIFT + Tab", hl.dsp.window.move({ workspace = "special" }), { description = "Move window to special workspace" })
hl.bind("SUPER + Tab", hl.dsp.workspace.toggle_special(), { description = "Toggle special workspace" })

-- 5. Move Focus
hl.bind("SUPER + left", hl.dsp.focus({ direction = "l" }), { description = "Focus left" })
hl.bind("SUPER + right", hl.dsp.focus({ direction = "r" }), { description = "Focus right" })
hl.bind("SUPER + up", hl.dsp.focus({ direction = "u" }), { description = "Focus up" })
hl.bind("SUPER + down", hl.dsp.focus({ direction = "d" }), { description = "Focus down" })

hl.bind("SUPER + H", hl.dsp.focus({ direction = "l" }), { description = "Focus left" })
hl.bind("SUPER + L", hl.dsp.focus({ direction = "r" }), { description = "Focus right" })
hl.bind("SUPER + J", hl.dsp.focus({ direction = "u" }), { description = "Focus up" })
hl.bind("SUPER + K", hl.dsp.focus({ direction = "d" }), { description = "Focus down" })

-- 6. Move Window
hl.bind("SUPER + SHIFT + left", hl.dsp.window.move({ direction = "l" }), { description = "Move window left" })
hl.bind("SUPER + SHIFT + right", hl.dsp.window.move({ direction = "r" }), { description = "Move window right" })
hl.bind("SUPER + SHIFT + up", hl.dsp.window.move({ direction = "u" }), { description = "Move window up" })
hl.bind("SUPER + SHIFT + down", hl.dsp.window.move({ direction = "d" }), { description = "Move window down" })

hl.bind("SUPER + SHIFT + H", hl.dsp.window.move({ direction = "l" }), { description = "Move window left" })
hl.bind("SUPER + SHIFT + L", hl.dsp.window.move({ direction = "r" }), { description = "Move window right" })
hl.bind("SUPER + SHIFT + J", hl.dsp.window.move({ direction = "u" }), { description = "Move window up" })
hl.bind("SUPER + SHIFT + K", hl.dsp.window.move({ direction = "d" }), { description = "Move window down" })

-- 7. Resize Window
hl.bind( "SUPER + CONTROL + left", hl.dsp.window.resize({ x = -10, y = 0, relative = true }), { repeating = true, description = "Resize window left" })
hl.bind( "SUPER + CONTROL + right", hl.dsp.window.resize({ x = 10, y = 0, relative = true }), { repeating = true, description = "Resize window right" })
hl.bind( "SUPER + CONTROL + up", hl.dsp.window.resize({ x = 0, y = -10, relative = true }), { repeating = true, description = "Resize window up" })
hl.bind( "SUPER + CONTROL + down", hl.dsp.window.resize({ x = 0, y = 10, relative = true }), { repeating = true, description = "Resize window down" })

hl.bind( "SUPER + CONTROL + H", hl.dsp.window.resize({ x = -10, y = 0, relative = true }), { repeating = true, description = "Resize window left" })
hl.bind( "SUPER + CONTROL + L", hl.dsp.window.resize({ x = 10, y = 0, relative = true }), { repeating = true, description = "Resize window right" })
hl.bind( "SUPER + CONTROL + K", hl.dsp.window.resize({ x = 0, y = -10, relative = true }), { repeating = true, description = "Resize window up" })
hl.bind( "SUPER + CONTROL + J", hl.dsp.window.resize({ x = 0, y = 10, relative = true }), { repeating = true, description = "Resize window down" })

-- 8. Switch Workspaces [0-9]
hl.bind("SUPER + code:10", hl.dsp.focus({ workspace = "1" }), { description = "Switch to workspace 1" })
hl.bind("SUPER + code:11", hl.dsp.focus({ workspace = "2" }), { description = "Switch to workspace 2" })
hl.bind("SUPER + code:12", hl.dsp.focus({ workspace = "3" }), { description = "Switch to workspace 3" })
hl.bind("SUPER + code:13", hl.dsp.focus({ workspace = "4" }), { description = "Switch to workspace 4" })
hl.bind("SUPER + code:14", hl.dsp.focus({ workspace = "5" }), { description = "Switch to workspace 5" })
hl.bind("SUPER + code:15", hl.dsp.focus({ workspace = "6" }), { description = "Switch to workspace 6" })
hl.bind("SUPER + code:16", hl.dsp.focus({ workspace = "7" }), { description = "Switch to workspace 7" })
hl.bind("SUPER + code:17", hl.dsp.focus({ workspace = "8" }), { description = "Switch to workspace 8" })
hl.bind("SUPER + code:18", hl.dsp.focus({ workspace = "9" }), { description = "Switch to workspace 9" })
hl.bind("SUPER + code:19", hl.dsp.focus({ workspace = "10" }), { description = "Switch to workspace 10" })

-- 9. Move Window To Workspace [0-9]
hl.bind( "SUPER + SHIFT + code:10", hl.dsp.window.move({ workspace = "1" }), { description = "Move window to workspace 1" })
hl.bind( "SUPER + SHIFT + code:11", hl.dsp.window.move({ workspace = "2" }), { description = "Move window to workspace 2" })
hl.bind( "SUPER + SHIFT + code:12", hl.dsp.window.move({ workspace = "3" }), { description = "Move window to workspace 3" })
hl.bind( "SUPER + SHIFT + code:13", hl.dsp.window.move({ workspace = "4" }), { description = "Move window to workspace 4" })
hl.bind( "SUPER + SHIFT + code:14", hl.dsp.window.move({ workspace = "5" }), { description = "Move window to workspace 5" })
hl.bind( "SUPER + SHIFT + code:15", hl.dsp.window.move({ workspace = "6" }), { description = "Move window to workspace 6" })
hl.bind( "SUPER + SHIFT + code:16", hl.dsp.window.move({ workspace = "7" }), { description = "Move window to workspace 7" })
hl.bind( "SUPER + SHIFT + code:17", hl.dsp.window.move({ workspace = "8" }), { description = "Move window to workspace 8" })
hl.bind( "SUPER + SHIFT + code:18", hl.dsp.window.move({ workspace = "9" }), { description = "Move window to workspace 9" })
hl.bind( "SUPER + SHIFT + code:19", hl.dsp.window.move({ workspace = "10" }), { description = "Move window to workspace 10" })

-- 10. Move Window To Workspace Silently [0-9]
hl.bind( "SUPER + CONTROL + code:10", hl.dsp.window.move({ workspace = "1", follow = false }), { description = "Move window to workspace 1 silently" })
hl.bind( "SUPER + CONTROL + code:11", hl.dsp.window.move({ workspace = "2", follow = false }), { description = "Move window to workspace 2 silently" })
hl.bind( "SUPER + CONTROL + code:12", hl.dsp.window.move({ workspace = "3", follow = false }), { description = "Move window to workspace 3 silently" })
hl.bind( "SUPER + CONTROL + code:13", hl.dsp.window.move({ workspace = "4", follow = false }), { description = "Move window to workspace 4 silently" })
hl.bind( "SUPER + CONTROL + code:14", hl.dsp.window.move({ workspace = "5", follow = false }), { description = "Move window to workspace 5 silently" })
hl.bind( "SUPER + CONTROL + code:15", hl.dsp.window.move({ workspace = "6", follow = false }), { description = "Move window to workspace 6 silently" })
hl.bind( "SUPER + CONTROL + code:16", hl.dsp.window.move({ workspace = "7", follow = false }), { description = "Move window to workspace 7 silently" })
hl.bind( "SUPER + CONTROL + code:17", hl.dsp.window.move({ workspace = "8", follow = false }), { description = "Move window to workspace 8 silently" })
hl.bind( "SUPER + CONTROL + code:18", hl.dsp.window.move({ workspace = "9", follow = false }), { description = "Move window to workspace 9 silently" })
hl.bind( "SUPER + CONTROL + code:19", hl.dsp.window.move({ workspace = "10", follow = false }), { description = "Move window to workspace 10 silently" })

-- 11. Workspace Navigation
hl.bind( "SUPER + I", hl.dsp.workspace.swap_monitors({ monitor1 = "current", monitor2 = "+1" }), { description = "Swap workspace with next monitor" })
hl.bind("SUPER + mouse_down", hl.dsp.focus({ workspace = "+1" }), { description = "Focus next workspace" })
hl.bind("SUPER + mouse_up", hl.dsp.focus({ workspace = "-1" }), { description = "Focus previous workspace" })

-- 12. Mouse Bindings
hl.bind("SUPER + mouse:272", hl.dsp.window.drag(), { mouse = true, description = "Drag window" })
hl.bind("SUPER + mouse:273", hl.dsp.window.resize(), { mouse = true, description = "Resize window" })

-- 13. Zoom
hl.bind( "SUPER + Z", hl.dsp.exec_cmd(
		[[hyprctl keyword cursor:zoom_factor "$(hyprctl getoption cursor:zoom_factor | awk 'NR==1 {factor = $2; if (factor < 1) {factor = 1}; print factor * 1.25}')"]]
	), { description = "Zoom in" }
)
hl.bind( "SUPER + SHIFT + Z", hl.dsp.exec_cmd(
		[[hyprctl keyword cursor:zoom_factor "$(hyprctl getoption cursor:zoom_factor | awk 'NR==1 {factor = $2; if (factor < 1) {factor = 1}; print factor / 1.25}')"]]
	), { description = "Zoom out" }
)
hl.bind( "SUPER + SHIFT + mouse_down", hl.dsp.exec_cmd(
		[[hyprctl keyword cursor:zoom_factor "$(hyprctl getoption cursor:zoom_factor | awk 'NR==1 {factor = $2; if (factor < 1) {factor = 1}; print factor * 1.25}')"]]
	), { description = "Zoom in" }
)
hl.bind( "SUPER + SHIFT + mouse_up", hl.dsp.exec_cmd(
		[[hyprctl keyword cursor:zoom_factor "$(hyprctl getoption cursor:zoom_factor | awk 'NR==1 {factor = $2; if (factor < 1) {factor = 1}; print factor / 1.25}')"]]
	), { description = "Zoom out" }
)

-- 14. Screenshots
hl.bind( "SUPER + P", hl.dsp.exec_cmd(ipc .. " plugin alexander/screen-toolkit:service all toggle"), { description = "Toggle screen toolkit" })
hl.bind("SUPER + SHIFT + S", hl.dsp.exec_cmd("screenshot region"), { description = "Screenshot region" })
hl.bind("Print", hl.dsp.exec_cmd("screenshot fullscreen"), { description = "Screenshot fullscreen" })
hl.bind("CONTROL + Print", hl.dsp.exec_cmd("screenshot display"), { description = "Screenshot display" })
hl.bind("SHIFT + CONTROL + Print", hl.dsp.exec_cmd("screenshot region"), { description = "Screenshot region" })

-- 15. Media / Fn Keys
hl.bind( "XF86AudioRaiseVolume", hl.dsp.exec_cmd(ipc .. " volume-up"), { locked = true, repeating = true, description = "Volume up" })
hl.bind( "XF86AudioLowerVolume", hl.dsp.exec_cmd(ipc .. " volume-down"), { locked = true, repeating = true, description = "Volume down" })
hl.bind("XF86AudioMute", hl.dsp.exec_cmd(ipc .. " volume-mute"), { locked = true, description = "Mute volume" })
hl.bind("XF86AudioMicMute", hl.dsp.exec_cmd(ipc .. " mic-mute"), { locked = true, description = "Mute microphone" })
hl.bind( "XF86MonBrightnessUp", hl.dsp.exec_cmd(ipc .. " brightness-up"), { locked = true, repeating = true, description = "Brightness up" })
hl.bind( "XF86MonBrightnessDown", hl.dsp.exec_cmd(ipc .. " brightness-down"), { locked = true, repeating = true, description = "Brightness down" })

hl.bind("SUPER + XF86AudioRaiseVolume", hl.dsp.exec_cmd(term .. " pulsemixer"), { description = "Open volume mixer" })
hl.bind("SUPER + XF86AudioLowerVolume", hl.dsp.exec_cmd(term .. " pulsemixer"), { description = "Open volume mixer" })

hl.bind("XF86AudioPlay", hl.dsp.exec_cmd("playerctl play-pause"), { description = "Play/pause media" })
hl.bind("XF86AudioPause", hl.dsp.exec_cmd("playerctl pause"), { description = "Pause media" })
hl.bind("XF86AudioNext", hl.dsp.exec_cmd("playerctl next"), { description = "Next track" })
hl.bind("XF86AudioPrev", hl.dsp.exec_cmd("playerctl previous"), { description = "Previous track" })
hl.bind("XF86Tools", hl.dsp.exec_cmd("systemctl suspend-then-hibernate"), { description = "Suspend then hibernate" })
hl.bind("code:156", hl.dsp.exec_cmd("~/.local/bin/monitor_mode_switcher t"), { description = "Toggle monitor mode" })

-- 16. Gestures
hl.gesture({ fingers = 2, direction = "pinch", action = "cursorZoom", zoom_level = 1.2, mode = "live" })
hl.gesture({ fingers = 3, direction = "horizontal", scale = 1.5, action = "workspace" })
hl.gesture({ fingers = 3, direction = "up", scale = 1.5, action = "fullscreen" })
hl.gesture({ fingers = 4, direction = "swipe", scale = 1.5, action = "move" })

-- 17. Resize Submap
hl.bind("SUPER + R", hl.dsp.submap("resize"), { description = "Enter resize mode" })

hl.define_submap("resize", function() hl.bind( "L", hl.dsp.window.resize({ x = 10, y = 0, relative = true }), { repeating = true, description = "Resize window right" })
	hl.bind( "H", hl.dsp.window.resize({ x = -10, y = 0, relative = true }), { repeating = true, description = "Resize window left" })
	hl.bind( "J", hl.dsp.window.resize({ x = 0, y = -10, relative = true }), { repeating = true, description = "Resize window up" })
	hl.bind( "K", hl.dsp.window.resize({ x = 0, y = 10, relative = true }), { repeating = true, description = "Resize window down" })
	hl.bind( "left", hl.dsp.window.resize({ x = -10, y = 0, relative = true }), { repeating = true, description = "Resize window left" })
	hl.bind( "right", hl.dsp.window.resize({ x = 10, y = 0, relative = true }), { repeating = true, description = "Resize window right" })
	hl.bind( "up", hl.dsp.window.resize({ x = 0, y = -10, relative = true }), { repeating = true, description = "Resize window up" })
	hl.bind( "down", hl.dsp.window.resize({ x = 0, y = 10, relative = true }), { repeating = true, description = "Resize window down" })
	hl.bind("catchall", hl.dsp.submap("reset"), { description = "Exit resize mode" })
end)

-- ╔══════════════════════════════════════════════════════════════════════╗
-- ║                     UNBOUND KEYS (available)                         ║
-- ╚══════════════════════════════════════════════════════════════════════╝

-- ┌──────────────────────────────────────────────────────────────────────┐
-- │                     LETTERS — SUPER                                  │
-- └──────────────────────────────────────────────────────────────────────┘

-- hl.bind("SUPER + S", ...)
-- ┌──────────────────────────────────────────────────────────────────────┐
-- │                     LETTERS — SUPER SHIFT                            │
-- └──────────────────────────────────────────────────────────────────────┘

-- hl.bind("SUPER + SHIFT + A", ...)
-- hl.bind("SUPER + SHIFT + B", ...)
-- hl.bind("SUPER + SHIFT + C", ...)
-- hl.bind("SUPER + SHIFT + G", ...)
-- hl.bind("SUPER + SHIFT + I", ...)
-- hl.bind("SUPER + SHIFT + O", ...)
-- hl.bind("SUPER + SHIFT + P", ...)
-- hl.bind("SUPER + SHIFT + R", ...)
-- hl.bind("SUPER + SHIFT + U", ...)
-- hl.bind("SUPER + SHIFT + X", ...)

-- ┌──────────────────────────────────────────────────────────────────────┐
-- │                     LETTERS — SUPER CONTROL                          │
-- └──────────────────────────────────────────────────────────────────────┘

-- hl.bind("SUPER + CONTROL + B", ...)
-- hl.bind("SUPER + CONTROL + C", ...)
-- hl.bind("SUPER + CONTROL + D", ...)
-- hl.bind("SUPER + CONTROL + E", ...)
-- hl.bind("SUPER + CONTROL + F", ...)
-- hl.bind("SUPER + CONTROL + G", ...)
-- hl.bind("SUPER + CONTROL + I", ...)
-- hl.bind("SUPER + CONTROL + M", ...)
-- hl.bind("SUPER + CONTROL + O", ...)
-- hl.bind("SUPER + CONTROL + P", ...)
-- hl.bind("SUPER + CONTROL + Q", ...)
-- hl.bind("SUPER + CONTROL + R", ...)
-- hl.bind("SUPER + CONTROL + S", ...)
-- hl.bind("SUPER + CONTROL + T", ...)
-- hl.bind("SUPER + CONTROL + U", ...)
-- hl.bind("SUPER + CONTROL + V", ...)
-- hl.bind("SUPER + CONTROL + X", ...)
-- hl.bind("SUPER + CONTROL + Y", ...)
-- hl.bind("SUPER + CONTROL + Z", ...)

-- ┌──────────────────────────────────────────────────────────────────────┐
-- │                     XF86 KEYS — UNBOUND                              │
-- └──────────────────────────────────────────────────────────────────────┘

-- hl.bind("XF86AudioStop", ...)
-- hl.bind("XF86AudioMedia", ...)
-- hl.bind("XF86AudioRecord", ...)
-- hl.bind("XF86AudioRewind", ...)
-- hl.bind("XF86AudioForward", ...)
-- hl.bind("XF86AudioRepeat", ...)
-- hl.bind("XF86AudioRandomPlay", ...)
-- hl.bind("XF86KbdBrightnessUp", ...)
-- hl.bind("XF86KbdBrightnessDown", ...)
-- hl.bind("XF86KbdLightOnOff", ...)
-- hl.bind("XF86TouchpadToggle", ...)
-- hl.bind("XF86TouchpadOn", ...)
-- hl.bind("XF86TouchpadOff", ...)
-- hl.bind("XF86Display", ...)
-- hl.bind("XF86ScreenSaver", ...)
-- hl.bind("XF86PowerOff", ...)
-- hl.bind("XF86Sleep", ...)
-- hl.bind("XF86WakeUp", ...)
-- hl.bind("XF86Suspend", ...)
-- hl.bind("XF86Hibernate", ...)
-- hl.bind("XF86WebCam", ...)
-- hl.bind("XF86Camera", ...)
-- hl.bind("XF86Launch0", ...)
-- hl.bind("XF86Launch1", ...)
-- hl.bind("XF86Launch2", ...)
-- hl.bind("XF86Launch3", ...)
-- hl.bind("XF86Launch4", ...)
-- hl.bind("XF86Launch5", ...)
-- hl.bind("XF86Launch6", ...)
-- hl.bind("XF86Launch7", ...)
-- hl.bind("XF86Launch8", ...)
-- hl.bind("XF86Launch9", ...)
-- hl.bind("XF86Tools", ...)
-- hl.bind("XF86Explorer", ...)
-- hl.bind("XF86Search", ...)
-- hl.bind("XF86HomePage", ...)
-- hl.bind("XF86Mail", ...)
-- hl.bind("XF86Messenger", ...)
-- hl.bind("XF86Calculator", ...)
-- hl.bind("XF86Calendar", ...)
-- hl.bind("XF86Documents", ...)
-- hl.bind("XF86Favorites", ...)
-- hl.bind("XF86MyComputer", ...)
-- hl.bind("XF86Shop", ...)
-- hl.bind("XF86Bluetooth", ...)
-- hl.bind("XF86WLAN", ...)
-- hl.bind("XF86RFKill", ...)
-- hl.bind("XF86Eject", ...)
-- hl.bind("Menu", ...)

-- For Noctalia Color templates
require("noctalia").apply_theme()
