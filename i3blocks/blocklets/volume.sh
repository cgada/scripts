#!/bin/sh
# Copyright (C) 2014 Julien Bonjean <julien@bonjean.info>

# This program is free software: you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation, either version 3 of the License, or
# (at your option) any later version.

# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.

# You should have received a copy of the GNU General Public License
# along with this program.  If not, see <http://www.gnu.org/licenses/>.

CARD="${1:-0}"
MIXER="${2:-pulse}" # use pulse for pulseaudio, default is alsa
SCONTROL="${3:-Master}"

case $BLOCK_BUTTON in
  1) amixer -D $MIXER  -q sset $SCONTROL toggle ;; # left click, mute/unmute
  3) i3-msg exec pavucontrol;; # right click, open pavucontrol
  4) amixer -D $MIXER -q sset $SCONTROL 3%+ ;;    # scroll up, increase
  5) amixer -D $MIXER  -q sset $SCONTROL 3%- ;;    # scroll down, decrease
esac

volume () {
  amixer -c $CARD -M -D $MIXER get $SCONTROL
}

format () {
  grep -o -E [[:digit:]]+% | head -1
}

mute=`amixer -c $CARD -M -D $MIXER get $SCONTROL | grep off`

if  [ -z $mute ]; then
    volume | format
    volume | format
    echo ""
else
    echo "Mute"
    echo "Mute"
    echo "#d15517"
fi
