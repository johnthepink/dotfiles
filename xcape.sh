# should be symlinked to:
#   /etc/profile.d/xcape.sh
killall -u $USER -q xcape
/usr/bin/xcape -e '#66=Escape'
