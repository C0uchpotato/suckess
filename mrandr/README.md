# mrandr

mrandr is a monitor profile manager, a simpler [autorandr](https://github.com/phillipberndt/autorandr) written in POSIX compliant shell.

Note that mrandr does not create a systemd service, so monitor profiles are not switched automatically. 
Rather, the user can bind `mrandr auto` to a key (see below).
This is a design choice; one can plug his docking station just for charging the laptop, without turning on the monitors...

## Installation

Clone this repository, then install.

```
git clone https://gitlab.com/mhdy/mrandr.git
cd mrandr
make install
```

This will copy files `mrandr` and  `mrandr-xrandr-parser.sed` in `~/.local/bin`.

## Uninstall

Easy, just open a terminal, cd to mrandr, and type:

```
make uninstall
```

## Usage

First, configure your setup using xrandr, arandr or equivalent.

Then, to save the current display configuration, type:

```
mrandr save PROFILE
```

`PROFILE` should be an alphanumeric string. `-` and `_` are also allowed.

To load a saved profile, use:

```
mrandr load PROFILE
```

mrandr can also automatically load the first profile matching with the
connected monitors. To do so, use:

```
mrandr auto
```

If you want to show the configuration (e.g. for debugging purpose), then use:

```
mrandr show PROFILE
```

To list available profiles, type:

```
mrandr list
```

To remove a profile, type:

```
mrandr remove PROFILE
```

## Hooks

Two hook scripts can be placed in the root of the configuration directory or in the profile configuration directory.

- `preswitch` is executed before a mode switch takes place.
- `postswitch` is executed after a profile switch has taken place. 
  This can be used to notify window managers or other applications about the switch.

A hook script placed in a profile's directory takes precedence over a hook
script placed in the root of the configuration directory. The latter is not
executed.

For a `preswitch` script, two environment variables are exposed:
- `MRANDR_CURRENT_PROFILE` holds the name of the current profile (before the
  switch).
- `MRANDR_NEXT_PROFILE` holds the name of the next profile (the one to be
  switched to).

For a `postswitch` script, two environment variables are exposed:
- `MRANDR_PREVIOUS_PROFILE` holds the name of the previous profile.
- `MRANDR_CURRENT_PROFILE` holds the name of the current applied profile.

## Misc

It's safer for users to map the command `mrandr auto` to a keybinding, because sometimes one cannot have access to a terminal.
For example, dwm users can map a keybinding to `mrandr auto` like shown below.
To get the display key code, use can use the `xev` utility.
In the case shown below, it's `XF86XK_Display`, but one can use any keybinding.

```c
static const char *monitorauto[] = { "mrandr", "auto", NULL };
static Key keys[] = {
  // ...
  { 0, XF86XK_Display, spawn, { .v = monitorauto } },
};
```

This will switch automatically to the first profile matching the connected monitors when the display key is pressed.

If you prefer to manually choose the profile, you can hook [this dmenu script](https://gitlab.com/mhdy/mde/-/blob/master/dmenu/scripts/dmenu-monitorutil) to a keybinding, as follows:

```c
static const char *monitorutil[] = { "dmenu-monitorutil", NULL };
static Key keys[] = {
  // ...
  { ControlMask, XF86XK_Display, spawn, { .v = monitorutil } },
};
```

## License

MIT.
