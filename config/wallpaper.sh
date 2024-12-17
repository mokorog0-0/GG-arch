#!/bin/bash

# Папка с изображениями
WALLPAPER_DIR="/home/mokorog/Pictures/wallpapers"

# Параметры анимации
export SWWW_TRANSITION_FPS=144
export SWWW_TRANSITION_STEP=250
export SWWW_TRANSITION_TYPE=random

# Интервал в секундах для смены обоев
INTERVAL=300

if [ -z "$WALLPAPER_DIR" ]; then
  echo "Usage: $0 <dir containing images>"
  exit 1
fi

echo "Путь к папке обоев: $WALLPAPER_DIR"

# Цикл для смены обоев с рандомизацией
while true; do
  find "$WALLPAPER_DIR" -type f -iname "*.jpg" -o -iname "*.png" -o -iname "*.jpeg" -o -iname "*.webp" \
    | shuf -n 1 | while read -r img; do
      echo "Устанавливаю обои: $img"
      swww img "$img" --transition-fps 30 --transition-type random
      sleep $INTERVAL
  done
done
