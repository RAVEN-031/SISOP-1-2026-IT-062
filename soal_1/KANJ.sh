#!/bin/bash

while true
do
  echo 'a/b/c/d/e (Ctrl+D to exit)'
  read input || break
if [ $input == 'a' ]
then
  awk 'BEGIN {FS = ","} NR > 1 {count++} END {print "Jumlah penumpang KANJ adalah "count " orang"}' passenger.csv
elif [ $input == 'b' ]
then
  awk 'BEGIN {FS = ","} NR > 1 {count[$4]++} END {print "Jumlah gerbong KANJ adalah " length(count) " gerbong"}' passenger.csv
elif [ $input == 'c' ]
then
  awk 'BEGIN {FS = ","; max = 0} NR > 1 {if ($2 > max) {max = $2; name = $1}} END {print name " adalah penumpang tertua dengan usia " max " tahun"}' passenger.csv
elif [ $input == 'd' ]
then
  awk 'BEGIN {FS = ","; total = 0; count = 0} NR > 1 {total += $2; count++} END {print "Rata-rata usia penumpang adalah " int(total/count)}' passenger.csv
elif [ $input == 'e' ]
then
  awk 'BEGIN {FS = ","; count = 0} NR > 1 {if ($3 == "Business") count++} END {print "Jumlah penumpang business class adalah " count}' passenger.csv
else
  echo 'Input tidak dikenali'
fi
done
