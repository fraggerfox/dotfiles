#!/bin/sh
#
# ~/.xinitrc
#
# Executed by startx (run your window manager from here)

if [ -d /etc/X11/xinit/xinitrc.d ]; then
  for f in /etc/X11/xinit/xinitrc.d/*; do
    [ -x "$f" ] && . "$f"
  done
  unset f
fi

setxkbmap -option terminate:ctrl_alt_bksp

xsetroot -solid \#3f3f3f
xsetroot -cursor_name left_ptr

nohup xbindkeys &

feh --bg-center /path/to/wallpaper.jpg

mpdscribble &
xrdb ~/.Xresources &
#xrdb -merge .Xdefaults

xmodmap ~/.Xmodmap

nohup ~/programs/scripts/battery/battery_monitor.sh &

#export GDK_NATIVE_WINDOWS=true

#syndaemon -d -i 1

xautolock -time 5 &

xcompmgr &

numlockx &

#exec evilwm -term "aterm -ls -tr -trsb -cr white +sb -fg gray -fn fixed -fb fixed -shading 10 -fn -misc-fixed-medium-r-normal-*-14-110-100-100-c-70-iso8859-1"
#exec evilwm -term "xterm -bc"
exec i3
#exec startlxde

