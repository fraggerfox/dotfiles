# reset 
xrandr --auto

# turn off laptop screen
xrandr --output LVDS --off

# 24" 16x12 on
xrandr --output VGA --mode 1600x1200


# reset 
xrandr --auto

# turn off external screen
xrandr --output VGA --off

# laptop screen on
xrandr --output LVDS --mode 1280x800

ndr --auto

# laptop screen on
xrandr --output LVDS1 --mode 1280x800 --noprimary --pos 1600x0

# 24" 16x12 on
xrandr --output VGA1 --mode 1600x1200 --primary --pos 0x0

# echo current status
xrandr --current
