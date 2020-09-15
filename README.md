# tmux-sysfs-battery

- The simple battery indicator plugin for tmux status bar.
- Based on sysfs, linux only. but no requires other packages.

## Install

### via tpm (tmux plugin manager)
Add the `piutranq/tmux-sysfs-battery` as tpm plugin.

```tmux
# $HOME/.tmux.conf

set-option -g @plugin 'piutranq/tmux-sysfs-battery'
# and other plugins
# ...
run-shell '$HOME/.tmux/plugins/tpm/tpm'
```

### via git
Clone the repository in the directory that you prefer,
and run the `load.tmux` in root of the repository.

```sh
# in interactive shell
git clone https://github.com/piutranq/tmux-sysfs-battery \
    $HOME/.tmux/scripts/tmux-sysfs-battery
```

```tmux
# $HOME/.tmux.conf
run-shell '$HOME/.tmux/scripts/tmux-sysfs-battery/load.tmux'
```

## How to use
Just add `#{linux-sysfs-battery}` in favorite places of following
tmux status bar format options.

- `status-left`, `status-right`
- `status-format[0]` ~ `status-format[4]`: (after version 2.9)

## Available tmux options
All of the options start with the prefix `@sysbat`.

### Battery name
- `@sysbat-battery-name`

The battery name to display info.

Defaultly, the plugin finds the first battery in the power supply
device named as `BAT.*`. (eg. `BAT0`)

### Capacity threshold
- `@sysbat-capacity-threshold0` (default: `15`)
- `@sysbat-capacity-threshold1` (default: `30`)
- `@sysbat-capacity-threshold2` (default: `70`)

The plugin classifies the battery capacity as 4 levels when
the battery is discharging. these options are the percentages
of battery capacity thresholds for 4 battery levels.

Defaultly, the battery capacity is classified as
- `70%~` (high)
- `30~69%` (medium)
- `15~29%` (low) 
- `~14%` (very low)

### Simple threshold
- `@sysbat-simple-threshold` (default: `90`)
The plugin has 2 formats: normal, simple.

If the tmux window width is smaller then the prefix, battery indicator
displays the simple format like responsive design.

The default is 90 ascii characters.

### Normal format
- `@sysbat-normal-fmt0`: The battery is full
- `@sysbat-normal-fmt1`: The battery is charging (AC power connected)
- `@sysbat-normal-fmt2`: The battery is not charging
- `@sysbat-normal-fmt3`: Discharging and the battery capacity is high
- `@sysbat-normal-fmt4`: Discharging and the capacity is medium
- `@sysbat-normal-fmt5`: Discharging and the capacity is low
- `@sysbat-normal-fmt6`: Discharging and the capacity is very low
- `@sysbat-normal-fmt7`: Unknown status

The indicator format when tmux window width is same as or larger than
`@sysbat-simple-threshold`.

### Simple format
- `@sysbat-normal-fmt0`: The battery is full
- `@sysbat-normal-fmt1`: The battery is charging (AC power connected)
- `@sysbat-normal-fmt2`: The battery is not charging
- `@sysbat-normal-fmt3`: Discharging and the battery capacity is high
- `@sysbat-normal-fmt4`: Discharging and the capacity is medium
- `@sysbat-normal-fmt5`: Discharging and the capacity is low
- `@sysbat-normal-fmt6`: Discharging and the capacity is very low
- `@sysbat-normal-fmt7`: Unknown status

The indicator format when tmux window width is smaller than
`@sysbat-simple-threshold`.
