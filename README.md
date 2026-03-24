# SISOP-1-2026-IT-062

## Daftar Isi

## Laporan

### Soal 1

Program yang dibuat menggunakan while loop untuk memungkinkan pengecekan semua poin soal dengan menjalankan programnya sekali

```bash
while true
do
  echo 'a/b/c/d/e (Ctrl+D to exit)'
  read input || break
```

line terakhir menggunakan OR operator dimana jika `read input` diberikan Ctrl+D akan memberikan exit status 1 yang membuat program menjalankanperintah break yang akan 
menghentikan while loop untuk menyelesaikan program

#### a. Perhitungan total penumpang

```bash
if [ $input == 'a' ]
then
  awk 'BEGIN {FS = ","} NR > 1 {count++} END {print "Jumlah penumpang KANJ adalah "count " orang"}' passenger.csv
```

Jika input `a` diberikan, program akan menjalankan perintah AWK yang menghitung jumlah baris yang terdapat dalam `passenger.csv` kecuali untuk baris pertama yang 
dilakukan dengan menggunakan pattern `NR > 1`

Note: Field separator sebenarnya tidak diperlukan untuk bagian ini

#### b. Perhitungan total gerbong

```bash
elif [ $input == 'b' ]
then
  awk 'BEGIN {FS = ","} NR > 1 {count[$4]++} END {print "Jumlah gerbong KANJ adalah " length(count) " gerbong"}' passenger.csv
```

Jika input `b` diberikan, maka program akan menghitung jumlah gerbong dengan cara menyetor semua value kolom ke 4 yang unik menggunakan array dalam awk

`count[$4]++`

- `count` adalah nama array.
- `$4` membuat key dari array tersebut adalah nilai dari kolom ke 4 dari suatu baris.
- Setiap key yang ditambahkan akan overwrite key yang sudah ada jika keynya sama <!-- holy shi, I do not know how to properly explain in this shitty language -->
- Note: Array dalam awk bersifat asosiatif dimana setiap nilai disimpan menggunakan key dan bukan index
<!-- explaining this here so I don't have to explain on the next one -->

`length(count)`

Perintah ini menghitung jumlah key yang terdapat dalam array `count`

#### c. Identifikasi penumpang tertua

```bash
elif [ $input == 'c' ]
then
  awk 'BEGIN {FS = ","; max = 0} NR > 1 {if ($2 > max) {max = $2; name = $1}} END {print name " adalah penumpang tertua dengan usia " max " tahun"}' passenger.csv
```
<!-- I probably could've used the array to simplify this -->
Jika input `c` diberikan, awk akan mengecek umur tertinggi dan menyimpannya dalam variabel `max` dan menyimpan nama dari umur tersebut dalam variable `name`
<!-- You could already see my will to write this report fading XD -->

#### d. Perhitungan rata-rata umur penumpang

```bash
elif [ $input == 'd' ]
then
  awk 'BEGIN {FS = ","; total = 0; count = 0} NR > 1 {total += $2; count++} END {print "Rata-rata usia penumpang adalah " int(total/count)}' passenger.csv
```

Opsi `d` menghitung total umur semua penumpang dan jumlah baris, lalu membagi total umur dengan jumlah baris

#### e. Perhitungan jumlah penumpang business class

```bash
elif [ $input == 'e' ]
then
  awk 'BEGIN {FS = ","; count = 0} NR > 1 {if ($3 == "Business") count++} END {print "Jumlah penumpang business class adalah " count}' passenger.csv
```

Opsi `e` menggunakan variable `count` untuk menghitung jumlah kolom ke 3 yang memiliki value `Business`
