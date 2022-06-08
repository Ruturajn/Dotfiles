#!/bin/bash
# Author : Ruturajn <nanotiruturaj@gmail.com>

core_1_temp=$(sensors | grep -i "Core " | sed 's/^.*      +//' | sed 's/\..*//' | awk 'FNR == 1 {print}')
core_2_temp=$(sensors | grep -i "Core " | sed 's/^.*      +//' | sed 's/\..*//' | awk 'FNR == 2 {print}')
core_3_temp=$(sensors | grep -i "Core " | sed 's/^.*      +//' | sed 's/\..*//' | awk 'FNR == 3 {print}')
core_4_temp=$(sensors | grep -i "Core " | sed 's/^.*      +//' | sed 's/\..*//' | awk 'FNR == 4 {print}')

dunstify -r "9994" -i "icons8-temperature-50" "Core 1 : ${core_1_temp}°C"$'\n'"Core 2 : ${core_2_temp}°C"$'\n'"Core 3 : ${core_3_temp}°C"$'\n'"Core 4 : ${core_4_temp}°C"
