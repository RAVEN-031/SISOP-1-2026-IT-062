#!/usr/bin/bash


x1=$(awk 'BEGIN {FS=","} NR == 1 {print $4}' titik-penting.txt)
x2=$(awk 'BEGIN {FS=","} NR == 2 {print $4}' titik-penting.txt)
y1=$(awk 'BEGIN {FS=","} NR == 1 {print $3}' titik-penting.txt)
y2=$(awk 'BEGIN {FS=","} NR == 3 {print $3}' titik-penting.txt)

x=$(awk -v a="$x1" -v b="$x2" 'BEGIN {print(a+b)/2}')
y=$(awk -v a="$y1" -v b="$y2" 'BEGIN {print (a+b)/2}')

printf "Koordinat pusat:\n$y,$x" > posisipusaka.txt
#y is lat, x is long
