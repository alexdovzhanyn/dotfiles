exec feh --bg-scale ~/desktopwallpaper.png &
exec i3
[[ -f ~/.Xresources ]] && xrdb -merge -I$HOME ~/.Xresources
