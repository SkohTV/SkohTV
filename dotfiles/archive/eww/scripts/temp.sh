#!/bin/bash

highest_temp=$(sensors | awk '/Core [0-9]+/ {
  gsub("[+°C]", "");
  if ($3 > max) {
    max = $3
  }
} 
END {
  print max
}')
echo "$highest_temp"
