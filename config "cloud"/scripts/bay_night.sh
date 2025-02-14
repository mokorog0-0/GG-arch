#!/bin/bash

# --- Настройки ---
# Путь к "дневным" обоям
DAY_WALLPAPER="$HOME/Pictures/wallpapers/clouds.png"
# Путь к "ночным" обоям
NIGHT_WALLPAPER="$HOME/Pictures/wallpapers/night_clouds.png"

# --- Время переключения на "дневные" обои (06:00 - 6 утра) ---
DAY_HOUR="06"
# --- Время переключения на "ночные" обои (21:00 - 9 вечера) ---
NIGHT_HOUR="21"

# --- Настройки эффекта перехода ---
TRANSITION_TYPE="fade"  # Тип перехода: wipein, fade, fly, zoom, etc. (wipein похож на "кругляш")
TRANSITION_DURATION="1.5" # Длительность перехода в секундах

while true; do
  CURRENT_HOUR=$(date +%H)

  if [ "$CURRENT_HOUR" -ge "$DAY_HOUR" ] && [ "$CURRENT_HOUR" -lt "$NIGHT_HOUR" ]; then
    # Время между 06:00 и 21:00, устанавливаем "дневные" обои с эффектом
    swww img --transition-type "$TRANSITION_TYPE" --transition-duration "$TRANSITION_DURATION" "$DAY_WALLPAPER"
    echo "$(date '+%Y-%m-%d %H:%M:%S'): Установлены дневные обои" >> ~/.wallpaper_changer.log
  else
    # Время < 06:00 или >= 21:00, устанавливаем "ночные" обои с эффектом
    swww img --transition-type "$TRANSITION_TYPE" --transition-duration "$TRANSITION_DURATION" "$NIGHT_WALLPAPER"
    echo "$(date '+%Y-%m-%d %H:%M:%S'): Установлены ночные обои" >> ~/.wallpaper_changer.log
  fi

  sleep 60 # Проверка каждую минуту
done
