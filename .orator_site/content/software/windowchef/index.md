---
layout: default
title: Windowchef
---

Windowchef
----------

Windowchef is a (conceptually) simple X11 window manager. It doesn't handle keyboard inputs,
instead relying on external programs for simplicity and power.

Windowchef was designed to provide basic functionality for a minimal, yet comfortable workflow,
while being easily extensible through shell scripts or other external programs.

### Source

[On GitHub](https://github.com/tudurom/windowchef)

### Features

* Focus windows in a given direction
* EWMH support
* Monocle mode
* Gaps
* Virtual grid
* Window snapping
* `cwm`-like groups
  * Also supports workspaces if needed
* Mouse resizing/moving/focusing
* Respects window resize hints
* Loads shell script on startup. Can be any executable file.
* 100% compatible with window management utilities (e.g. [wmutils](https://github.com/wmutils/)). Windowchef will update its internal state if programs attempt to manage windows. It also applies the correct window decorations when a program focuses a window. This makes it possible to use it as a "backend" with wm utilities.

Many of the features listed above are optional and can be disabled.

### Screenshot

[![Screenshot](https://pub.tudorr.xyz/windowchef.png)](https://pub.tudorr.xyz/windowchef.png)

Here we have a GNU Emacs window in monocle mode. At the top there is a `lemonbar` panel
and on the right is a `lemonbar` notification.

### Installation

Dependencies:

* `xcb`
* `xcb-randr`
* `xcb-util-wm`
* `xbc-keysyms`
* `xproto`

Then `make` it <sup><sup>harder make it better <sup>do it faster<sup>makes us stronger</sup></sup></sup></sup>

```
$ make
# make install
```


### Contributing

You can send issues or pull requests/patches by email or by GitHub.

To enable debug messages, compile Windowchef like this:

```
$ make debug
```

### Download

[GitHub releases](https://github.com/tudurom/windowchef/releases)
