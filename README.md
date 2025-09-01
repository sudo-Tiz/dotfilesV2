# dotfilesV2

My personal dotfiles for a Hyprland-based desktop environment on Arch Linux.

## Overview

This repository contains my configuration files for a modern Linux desktop setup centered around Hyprland (Wayland compositor). 

**Note:** If you're looking for dotfiles for Xorg with dwm, check out my previous repository: [github.com/sudo-Tiz/dotfiles](https://github.com/sudo-Tiz/dotfiles)

## Quick Setup 🚀

For easy installation on a fresh Arch Linux system, use my automated setup script:
**[LARBRE](https://github.com/sudo-Tiz/LARBRE)** - A fork of Luke Smith's LARBS adapted to my needs that works for both Xorg and Hyprland environments.

## System Information

- **Distribution:** Arch Linux
- **Compositor:** Hyprland (Wayland)
- **Shell:** Zsh
- **Terminal:** Foot
- **Editor:** Neovim (LazyVim)
- **Browser:** Qutebrowser (primary), Firefox & Brave (alternatives)
- **File Manager:** Yazi (terminal), Thunar (GUI)

## Current Status ⚠️

**These dotfiles are currently in a period of major transition!**

I recently switched from Xorg to Hyprland, which means:
- The configuration is changing regularly as I adapt to the new environment
- Some files still date from the Xorg era and haven't been removed or adapted for Hyprland yet
- Expect frequent updates and changes

If you decide to use these dotfiles, be aware that they might not be in their final state and could contain legacy configurations that are no longer relevant.

## What's Included

- **Hyprland** configuration - Modern Wayland compositor
- **Shell** configuration (Zsh) with custom aliases and functions
- **Terminal** configuration (Foot)
- **Browser** configuration (Qutebrowser) with custom keybindings
- **Media applications**: mpd/ncmpcpp (music), mpv (video player)
- **File management**: Yazi (terminal), Thunar (GUI)
- **Image viewer**: Various image viewers configured
- **Application** configurations and various utilities
- **XDG default programs** properly configured
- **Bookmarks system** using text files for various scripts
- Legacy configurations from my previous Xorg setup (being gradually cleaned up)

### File Organization
- Configs that can be in `~/.config/` are placed there (clean home directory)
- Environmental variables in `~/.zprofile` redirect configs to `~/.config/`
- File bookmarks in `~/.config/shell/bm-files`
- Directory bookmarks in `~/.config/shell/bm-dirs`

## Submodules

This repository includes two important submodules:

- **[LazyVim](https://github.com/sudo-Tiz/LazyVim)** (`.config/nvim`) - My personalized Neovim configuration based on LazyVim
- **[Tsumiki](https://github.com/sudo-Tiz/Tsumiki)** (`.config/tsumiki`) - Custom Hyprland panel/bar solution

## Key Applications & Their Purpose

| Application | Purpose | Configuration |
|-------------|---------|---------------|
| **Hyprland** | Wayland compositor | Main desktop environment |
| **Foot** | Terminal emulator | Fast, lightweight Wayland terminal |
| **Qutebrowser** | Web browser | Vim-like keyboard-driven browsing |
| **Neovim** | Text editor | IDE-like experience with LazyVim |
| **Yazi** | File manager | Modern terminal file manager (replaces lf) |
| **mpd/ncmpcpp** | Music system | Music daemon and terminal client |
| **mpv** | Video player | Minimal, keyboard-driven video player |
| **Ulauncher** | Application launcher | Quick app/file launcher |
| **Wofi** | Menu system | Dmenu replacement for Wayland |
| **Cliphist** | Clipboard manager | Clipboard history management |
| **Hypridle** | Idle daemon | Screen timeout and lock |
| **Hyprlock** | Screen locker | Secure screen locking |
| **Newsboat** | RSS reader | Terminal-based news aggregation |
| **Thunderbird** | Email client | Full-featured email management |

## Essential Keybindings

### Core Applications
| Key Combination | Action |
|-----------------|--------|
| `Super + X` / `Super + Return` | Terminal (Foot) |
| `Super + W` | Browser (Qutebrowser) |
| `Super + Shift + W` | Firefox |
| `Super + Ctrl + W` | Brave |
| `Super + V` | Editor (Neovim) |
| `Super + E` | File Manager (Yazi) |
| `Super + Shift + E` | GUI File Manager (Thunar) |
| `Super + M` | Email (Thunderbird) |
| `Super + N` | RSS Reader (Newsboat) |
| `Super + O` | Signal |
| `Super + D` | Application Launcher (Ulauncher) |
| `Super + A` | App Runner (Wofi) |
| `Super + Shift + A` | App Menu (Wofi) |

### System Controls
| Key Combination | Action |
|-----------------|--------|
| `Super + Q` | Close window |
| `Super + Shift + Q` | Force kill window |
| `Super + F` | Fullscreen |
| `Super + Space` | Toggle floating |
| `Super + S` | Pin window |
| `Super + G` | Freeze window |
| `Super + Backspace` | System actions menu |

### Window Management
| Key Combination | Action |
|-----------------|--------|
| `Super + H/J/K/L` | Move focus (Vim keys) |
| `Super + Shift + H/J/K/L` | Move window (Vim keys) |
| `Super + Ctrl + H/J/K/L` | Resize window (Vim keys) |
| `Super + R` | Resize mode |
| `Super + Tab` | Toggle split |

### Workspaces
| Key Combination | Action |
|-----------------|--------|
| `Super + 1-0` | Switch to workspace |
| `Super + Shift + 1-0` | Move window to workspace |
| `Super + Ctrl + 1-0` | Move window silently |
| `Super + Y` | Toggle special workspace |
| `Super + Shift + Y` | Move to special workspace |

### Utilities
| Key Combination | Action |
|-----------------|--------|
| `Super + C` | Clipboard history |
| `Super + Shift + D` | Password menu |
| `Super + U` | Unicode picker |
| `Super + Z` / `Super + Shift + Z` | Zoom in/out |
| `Print` | Screenshot (fullscreen) |
| `Ctrl + Print` | Screenshot (display) |
| `Super + Print` | Bookmark menu |

### Media & System
| Key Combination | Action |
|-----------------|--------|
| `XF86AudioRaiseVolume/LowerVolume` | Volume control |
| `XF86MonBrightnessUp/Down` | Brightness control |
| `XF86AudioPlay/Pause/Next/Prev` | Media control |
| `Super + XF86AudioRaiseVolume` | Audio mixer |

## Installation

⚠️ **Warning**: These are personal dotfiles that are actively changing. Review the configurations before applying them to your system.

### Manual Installation
```bash
git clone --recursive https://github.com/sudo-Tiz/dotfilesV2.git
cd dotfilesV2
# Review the files before applying
# Then symlink or copy the configurations you want to use
```

### Automated Installation (Recommended)
Use **[LARBRE](https://github.com/sudo-Tiz/LARBRE)** for a complete Arch Linux setup with these dotfiles.

## Features

- **Modern Wayland Setup**: Full Hyprland configuration with all essential tools
- **Vim-centric Workflow**: Vim keybindings across applications (Qutebrowser, Neovim)
- **Efficient Keybindings**: Logical, memorable shortcuts for all common tasks
- **Custom Scripts**: 60+ utility scripts in `.local/bin` for various tasks
- **Modular Configuration**: Clean, organized config files
- **Multi-monitor Support**: Flexible display configuration
- **Power Management**: Idle detection, screen locking, and brightness control

## Scripts & Utilities

The `.local/bin` directory contains numerous custom scripts including:
- **System management**: `sysact`, `monitor_mode_switcher`, `setbg`
- **Media handling**: `screenshot`, `maimpick`, `linkhandler`
- **Development tools**: `compiler`, `texclear`, `getbib`
- **Productivity**: `qndl`, `rssadd`, `shortcuts`
- **Security**: `neopassmenu`, `otp`
- **Bookmark system**: Scripts that use text file bookmarks for quick navigation

## Legacy Suckless Programs (V1)

My previous dotfiles (V1) were designed around suckless programs:
- **[dwm](https://github.com/sudo-Tiz/dwm)** - Dynamic window manager
- **[st](https://github.com/sudo-Tiz/st)** - Simple terminal  
- **[dmenu](https://github.com/sudo-Tiz/dmenu)** - Dynamic menu
- **[dwmblocks](https://github.com/sudo-Tiz/dwmblocks)** - Status bar

These are now replaced by modern Wayland equivalents but the configurations remain available in my [V1 repository](https://github.com/sudo-Tiz/dotfiles).

## Desktop Artwork

Default wallpaper: Thomas Thiemeyer's *The Road to Samarkand* 
- [Facebook](https://www.facebook.com/t.thiemeyer/)
- [Instagram](https://www.instagram.com/tthiemeyer/)
- [Shop](https://www.redbubble.com/de/people/TThiemeyer/shop)

## License

These dotfiles are provided as-is for reference and inspiration. Feel free to use any parts that are helpful to you.
