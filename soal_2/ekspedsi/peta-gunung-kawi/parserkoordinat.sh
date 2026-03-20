#!/usr/bin/awk -f
#I wish I could save this file as .awk but saving it as anything else is going to be flagged as cheating...

BEGIN {
  OFS = ","
}

match ($0, /"id": "([^"]+)"/, val) {
  id[a] = val[1]
  a++
}
match ($0, /"site_name": "([^"]+)"/, val) {
  site[b] = val[1]
  b++
}
match ($0, /"latitude": ([^,]+),/, val) {
  lat[c] = val[1]
  c++
}
match ($0, /"longitude": ([^,]+),/, val) {
  long[d] = val[1]
  d++
}

END {
  for (i in id) {
    print id[i], site[i], lat[i], long[i]
  }
}
