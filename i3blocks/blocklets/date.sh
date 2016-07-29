#!/bin/bash
#~/scripts/i3blocks/blocklets/date.sh

if [[ "${BLOCK_BUTTON}" -eq 1 ]]; then
    i3-msg exec gsimplecal
    exit 1
fi

date '+%I:%M %p'
