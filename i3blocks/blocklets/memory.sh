#!/bin/bash
#~/scripts/i3blocks/blocklets/memory.sh
# show total and used memory by Derrick Cope

USED="$(free -m | awk '/^Mem:/{print $3}')"
TOTAL="4500"
CACHED="$(free -m | awk '/^Mem:/{print $6}')"
FREE="$(free -m | awk '/^Mem:/{print $4}')"
UNUSED="$CACHED + $FREE / " | bc

case $BLOCK_BUTTON in
  1) echo "$USED";;
esac

if [[  $USED -lt  $TOTAL ]]; then
    echo "$CACHED + $FREE)" | bc
    echo "$CACHED + $FREE" | bc
    echo ""
else
    echo "$CACHED + $FREE" | bc
    echo "$CACHED + $FREE" | bc
    echo "#D15517"
fi
