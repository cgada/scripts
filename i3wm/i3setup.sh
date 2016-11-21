#!/bin/bash

i3-msg "workspace 1: console; append_layout /home/cgada/scripts/i3wm/workspace-1.json;exec --no-startup-id gnome-terminal"
i3-msg "workspace 2: www; append_layout /home/cgada/scripts/i3wm/workspace-2.json;exec --no-startup-id google-chrome"
i3-msg "workspace 3: subl; append_layout /home/cgada/scripts/i3wm/workspace-3.json;exec --no-startup-id subl"
i3-msg "workspace 4: chat; append_layout /home/cgada/scripts/i3wm/workspace-4.json;exec --no-startup-id messengerfordesktop; exec --no-startup-id slack;"
i3-msg "workspace 10: netflix; append_layout /home/cgada/scripts/i3wm/workspace-10.json;"
i3-msg exec 'google-chrome --kiosk --profile-directory=Default --app-id=hohnpbaigjpeifojaiamnndhmdcdjbcb'
i3-msg "workspace 9: spotify; exec --no-startup-id spotify"
