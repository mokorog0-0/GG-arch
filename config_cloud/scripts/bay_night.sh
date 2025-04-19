#!/bin/bash

DAY_WALLPAPER="$HOME/.config/scripts/wallpapers/clouds.png"
# Путь к "ночным" обоям
NIGHT_WALLPAPER="$HOME/.config/scripts/wallpapers/night_clouds.png"


TRANSITION_TYPE="center"  
TRANSITION_DURATION="1.5"


NIGHT_HOUR="21"

while true; do
  CURRENT_HOUR=$(date +%H)

  if [ "$CURRENT_HOUR" -ge "$NIGHT_HOUR" ]; then
    
    swww img --transition-type "$TRANSITION_TYPE" --transition-duration "$TRANSITION_DURATION" "$NIGHT_WALLPAPER"
    echo "$(date '+%Y-%m-%d %H:%M:%S'): Установлены ночные обои" >> ~/.wallpaper_changer.log
  else
    
    swww img --transition-type "$TRANSITION_TYPE" --transition-duration "$TRANSITION_DURATION" "$DAY_WALLPAPER"
    echo "$(date '+%Y-%m-%d %H:%M:%S'): Установлены дневные обои" >> ~/.wallpaper_changer.log
  fi

  sleep 60
done
