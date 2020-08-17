#!/bin/bash

PEN_ID=$(xinput --list | grep -n "Pen stylus" | cut -d'=' -f2 | cut -d'	' -f1)
PAD_ID=$(xinput --list | grep -n "Pad pad" | cut -d'=' -f2 | cut -d'	' -f1)

# pen settings
xsetwacom --set $PEN_ID Mode "Absolute"
xsetwacom --set $PEN_ID Rotate "none"

# button mappings
# For the H950P, the first 4 keys are 1,2,3,8 and the last 4 are 9,10,11,12
# For the pen, "Button 1" = pen tip, "Button 2" = 
#
# for keyboard mappings, start with "key", and then separate keys by spaces
#   e.g. button 1 "key Super_L "
# for mouse mappings, don't start with anything.  Choices are:
#   1 (left), 2 (middle), and 3 (right).  e.g. button 1 1
# Can also put an empty string, "", to unset.
#
# see https://pastebin.com/aXGDkJTU for special key names.  Others are normal.
#   e.g. for undo, "key Control_L Z"
xsetwacom --set $PAD_ID Button 1  "key Alt_L F3"
xsetwacom --set $PAD_ID Button 2  "key Print"
xsetwacom --set $PAD_ID Button 3  "key Control_L Shift_L P"
xsetwacom --set $PAD_ID Button 8  "key Control_L Shift_L A"

xsetwacom --set $PAD_ID Button 9  "key Control_L C"
xsetwacom --set $PAD_ID Button 10 "key Control_L V"
xsetwacom --set $PAD_ID Button 11 "key Control_L Y"
xsetwacom --set $PAD_ID Button 12 "key Control_L Z"

xsetwacom --set $PEN_ID button 1 "1"
xsetwacom --set $PEN_ID button 2 "3"
xsetwacom --set $PEN_ID button 3 "2"


# pen accel settings (analogous to mouse sensitivity)
DECEL_PROP_VAL=2
DECEL_PROP_ID=$(xinput --list-props $PEN_ID | grep -n "Constant Deceleration" | cut -d'(' -f2 | cut -d')' -f1)

xinput set-prop $PEN_ID $DECEL_PROP_ID $DECEL_PROP_VAL


# coordinate transformation settings
# tablet working area dimensions are 8.7in by 5.4in.  So:
#   - for square area, ccw rotation, CTM is 1 0 0 0 (8.7/5.4) 0 0 0 1
#       - (8.7/5.4) = 1.611111111
#   - for square area, no rotation, CTM is 1 0 0 0 (5.4/8.7) 0 0 0 1
#       - (5.4/8.7) = 0.620689655
CTM_DEFAULT="1 0 0 0 1 0 0 0 1"
CTM_ROTNONE="1 0 0 0 1.611111111 0 0 0 1"
CTM_ROTCCW="1 0 0 0 0.620689655 0 0 0 1"

xinput set-prop $PEN_ID "Coordinate Transformation Matrix" --type=float $CTM_DEFAULT
