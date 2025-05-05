#!/bin/bash

read -sp 'Unlock keyring: ' password
export $(echo $password | gnome-keyring-daemon --unlock | grep GNOME_KEYRING_CONTROL)
clear

echo ""
echo "▄   ▘▜  ▌    ▗   ▖ ▘  ▌ ▗ ▄▖       ▌"
echo "▙▘▌▌▌▐ ▛▌  ▀▌▜▘  ▌ ▌▛▌▛▌▜▘▚ ▛▌█▌█▌▛▌"
echo "▙▘▙▌▌▐▖▙▌  █▌▐▖  ▙▖▌▙▌▌▌▐▖▄▌▙▌▙▖▙▖▙▌"
echo "                    ▄▌      ▌       "
echo ""
echo ""

/bin/bash
