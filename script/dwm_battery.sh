#!/bin/sh

# A dwm_bar function to read the battery level and status
# Joe Standring <git@joestandring.com>
# GNU GPLv3

dwm_battery () {
    # Change * to whatever your battery is identified as. Typically BAT0 or BAT1
    CHARGE=$(cat /sys/class/power_supply/*/capacity*)
    STATUS=$(cat /sys/class/power_supply/*/status)

    printf "%s" "$SEP1"
    if [ "$IDENTIFIER" = "unicode" ]; then
        if [ "$STATUS" = "Discharging" -a "$CHARGE" = "Full" ];then
                printf ""
        else
          if [ "$STATUS" = "Charging" ]; then
              printf " %s%%" "$CHARGE"
          elif [ "$STATUS" = "" ]; then
              printf " " 
          else
              printf " %s%%" "$CHARGE"
          fi
        fi
    else
        printf "BAT %s%% %s" "$CHARGE" "$STATUS"
    fi
    printf "%s\n" "$SEP2"
}

dwm_battery
