#!/bin/bash

free | awk '/^Mem:/ {
    printf "%.2f\n", ($3 / 1000000)
}'
