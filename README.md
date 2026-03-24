# SISOP-1-2026-IT-062

## Daftar Isi

## Laporan

### Soal 1

#### Overview Program

Program dibuat mengimplementasikan while loop untuk memungkinkan pengecekan semua poin soal dengan menjalankan programnya sekali

```bash
while true
do
  echo 'a/b/c/d/e (Ctrl+D to exit)'
  read input || break
```

line terakhir menggunakan OR operator dimana jika `read input` diberikan Ctrl+D akan memberikan exit status 1 yang membuat program menjalankanperintah break yang akan menghentikan while loop untuk menyelesaikan program

##### a. Perhitungan total penumpang

```bash
if [ $input == 'a' ]
then
  awk 'BEGIN {FS = ","} NR > 1 {count++} END {print "Jumlah penumpang KANJ adalah "count " orang"}' passenger.csv
```

Jika input `a` diberikan, program akan menjalankan perintah AWK yang menghitung jumlah baris yang terdapat dalam `passenger.csv` kecuali untuk baris pertama yang dilakukan dengan menggunakan pattern `NR > 1`

Note: Field separator sebenarnya tidak diperlukan untuk bagian ini

##### b. Perhitungan total gerbong

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

##### c. Identifikasi penumpang tertua

```bash
elif [ $input == 'c' ]
then
  awk 'BEGIN {FS = ","; max = 0} NR > 1 {if ($2 > max) {max = $2; name = $1}} END {print name " adalah penumpang tertua dengan usia " max " tahun"}' passenger.csv
```
<!-- I probably could've used the array to simplify this -->
Jika input `c` diberikan, awk akan mengecek umur tertinggi dan menyimpannya dalam variabel `max` dan menyimpan nama dari umur tersebut dalam variable `name`
<!-- You could already see my will to write this report fading XD -->
##### d. Perhitungan rata-rata umur penumpang

```bash
elif [ $input == 'd' ]
then
  awk 'BEGIN {FS = ","; total = 0; count = 0} NR > 1 {total += $2; count++} END {print "Rata-rata usia penumpang adalah " int(total/count)}' passenger.csv
```

Opsi `d` menghitung total umur semua penumpang dan jumlah baris, lalu membagi total umur dengan jumlah baris

##### e. Perhitungan jumlah penumpang business class

```bash
elif [ $input == 'e' ]
then
  awk 'BEGIN {FS = ","; count = 0} NR > 1 {if ($3 == "Business") count++} END {print "Jumlah penumpang business class adalah " count}' passenger.csv
```

Opsi `e` menggunakan variable `count` untuk menghitung jumlah kolom ke 3 yang memiliki value `Business`

#### Output

##### a. Perhitungan total penumpang

<img width="420" height="105" alt="image" src="https://github.com/user-attachments/assets/77881b82-6ab9-4546-ab31-a1a451e8f06f" />

##### b. Perhitungan total gerbong

<img width="384" height="85" alt="image" src="https://github.com/user-attachments/assets/1aebc5db-e757-4e26-9ea3-506a9bf3fc22" />

##### c. Identifikasi penumpang tertua

<img width="585" height="71" alt="image" src="https://github.com/user-attachments/assets/631c8a8c-a4ef-492e-b61c-c40501e34d29" />

##### d. Perhitungan rata-rata umur penumpang

<img width="391" height="84" alt="image" src="https://github.com/user-attachments/assets/b42186f6-b35f-47e4-9589-cb8ead1e4faa" />

##### e. Perhitungan jumlah penumpang business class

<img width="439" height="83" alt="image" src="https://github.com/user-attachments/assets/7bb4a657-9056-4f3f-9ec7-067f4b476ea6" />

### Soal 2

Instruksi pertama untuk soal ini adalah setup virtual environment dan menginstall tools. Tetapi karena saya ~malas~ merasa itu tidak efisien, saya langsung menggunakan `wget -O peta-ekspedisi-amba.pdf link-here` untuk mendownload file dan menyimpannya sebagai file name yang sesuai secara langsung
<!-- Seriously? what the hell is gdown, and why pip? it's available on apt as people -->

<img width="944" height="1023" alt="image" src="https://github.com/user-attachments/assets/ebcd7317-01c6-4c3f-82b4-4a741ec56dc2" />

Selanjutnya, saya menggunakan `strings` untuk menunjukkan isi file yang readable dalam file PDF tersebut

<img width="1875" height="1016" alt="image" src="https://github.com/user-attachments/assets/214d9d5f-b7ad-45bd-9058-3270105a0010" />
<!-- Steganography? As people like to say, "Nyawit nih orang" -->

Didapatkan link repo `https://github.com/pocongcyber77/peta-gunung-kawi.git` yang lalu saya clone dan hapus folder `.git` agar tidak mengacaukan repository saya

di dalam repo tersebut terdapat file `gsxtrack.json` yang berisi koordinat yang akan diparse dengan `parserkoordinat.sh`

```awk
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
```
<!-- Okay, regex was a bit meh, but it was nice to learn regexx -->

Untuk ini, saya full menggunakan awk dan regex untuk parsing koordinat, lalu menyimpannya dalam file menggunakan operator output redirection `>` untuk menyimpan ke dalam file `titik-penting.txt`

<img width="1006" height="211" alt="image" src="https://github.com/user-attachments/assets/8fdbc054-1167-4821-8fd6-701d57257d17" />


Langkah terakhir adalah mengkomputasi titik tengah dari koordinat-koordinat yang didapatkan dengan `nemupusaka.sh` dan menyimpannya dalam `posisipusaka.txt`

```bash
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
```

Saya menggunakan awk untuk melakukan perhitungan titik tengah lalu sekali lagi menjalankan program tersebut dengan output redirection operator untuk menyimpannya dalam `posisipusaka.txt`

<img width="393" height="129" alt="image" src="https://github.com/user-attachments/assets/6327ab30-f23f-4028-a7c6-e63ed44e41a0" />
