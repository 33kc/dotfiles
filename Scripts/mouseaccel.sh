#!/bin/bash

DEVICE_NAME="Logitech G102 LIGHTSYNC Gaming Mouse"
DEVICE_ID=$(xinput list --id-only "$DEVICE_NAME")

xinput set-prop "$DEVICE_ID" "libinput Accel Profile Enabled" 0, 0, 1
xinput set-prop "$DEVICE_ID" "libinput Accel Speed" 0.0
