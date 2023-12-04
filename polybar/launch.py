#!/bin/python
import os


def kill_polybar():
    # Terminate already running bar instances
    os.system("killall -q polybar")

    # If all your bars have ipc enabled, you can also use
    os.system("polybar-msg cmd quit")

def launch_polybar():
    # Kill any Polybar instance
    kill_polybar()

    polybar = "polybar -c ~/.config/polybar/config.ini full 2>&1"
    tee = "tee -a /tmp/polybar.log & disown"

    # Run the commands to launch Polybar
    os.system(f"{polybar} | {tee}")


if __name__ == "__main__":
    launch_polybar()
    print("Polybar launcheda! ...tabun")

