#!/usr/bin/bash


x1=112.450000
x2=112.468100
y1=-7.937960
y2=-7.920000

x=$(awk "BEGIN {print($x1+$x2)/2}")
y=$(awk "BEGIN {print ($y1+$y2)/2}")

echo Koordinat pusat:
echo $y,$x
#y is lat, x is long
