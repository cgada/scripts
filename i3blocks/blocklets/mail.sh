#!/bin/bash

USER=SDFSDF
PASS=SDFSDF

if [[ "${BLOCK_BUTTON}" -eq 1 ]]; then
    xdg-open "https://inbox.google.com/u/0/"
    exit 1
fi

COUNT=`curl -su $USER:$PASS https://mail.google.com/mail/feed/atom || echo "<fullcount>unknown number of</fullcount>"`
COUNT=`echo "$COUNT" | grep -oPm1 "(?<=<fullcount>)[^<]+" `
echo $COUNT
echo $COUNT
if [ "$COUNT" == "0" ]; then
    echo ""
else
    echo "#7F00FF"
fi

