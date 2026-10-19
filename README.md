# Anti-h-lya — Guardian scheduling fix

The original boot-only oneshot service checked the time once and exited. It was not a repeating scheduler. Its zero-padded time arithmetic also risked octal interpretation.

This branch adds a weekday `systemd` timer template and a **dry-run only** diagnostic service. No active calendar entries are supplied until the school administrator chooses the times. The script only logs the event and does not power off the device.

For example, validate a proposed schedule with `systemd-analyze calendar 'Mon *-*-* 16:00:00'`. An authorized administrator can inspect `systemctl list-timers` and `journalctl -t guardian` during a controlled test. `Persistent=false` prevents missed events from being replayed after startup.

The old numbered files are preserved for reference, not for installation. The diagnostic design intentionally omits actual shutdown, which should require an independently approved power-management policy with warning and cancellation support.
