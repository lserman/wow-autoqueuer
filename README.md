## WoW AutoQueuer

This is a very simple AutoHotkey script that clicks the PLAY button in the Battle.net launcher at a specific time. The primary (and only?)  use case is to get into
a server queue while you are at work or whatever, so that you can actually play when you get home instead of waiting in a 4500 person queue on Stormrage.

For simplicity, the script makes the following assumptions:

1. You have [AutoHotkey](https://autohotkey.com/) installed.
2. You leave the Battle.net launcher open and have World of Warcraft selected. This script will not attempt to open the launcher or select WoW for you.
3. Your computer is left on from the time you hit Submit until the time that you scheduled.

This script does not handle recurring schedules.

### How it Works

When you hit Submit, the script calculates how many seconds it must wait until the scheduled time. It then sets a timer that will execute the queue routing:

1. Activate (not launch) the Battle.net launcher window
2. Click the PLAY button

The PLAY button is clicked based on a set of hardcoded coordinates:

- X: 300 pixels from the left side of the Battle.net launcher
- Y: 70 pixels from the bottom of the Battle.net launcher

### Reloading

This script does not call `ExitApp` so it will remain in the taskbar. This is by design so that you can simply right click the icon and "Reload this script" to
queue again the following day.
