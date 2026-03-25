# SISOP-1-2026-IT-062

## Daftar Isi

  - [Daftar Isi](#daftar-isi)
  - [Laporan](#laporan)
    - [Soal 1 - ARGO NGAWI JESGEJES](#soal-1---argo-ngawi-jesgejes)
      - [Overview Program](#overview-program)
      - [a. Perhitungan total penumpang](#a-perhitungan-total-penumpang)
      - [b. Perhitungan total gerbong](#b-perhitungan-total-gerbong)
      - [c. Identifikasi penumpang tertua](#c-identifikasi-penumpang-tertua)
      - [d. Perhitungan rata-rata umur penumpang](#d-perhitungan-rata-rata-umur-penumpang)
      - [e. Perhitungan jumlah penumpang business class](#e-perhitungan-jumlah-penumpang-business-class)
      - [Output](#output)
        - [a. Perhitungan total penumpang](#a-perhitungan-total-penumpang)
        - [b. Perhitungan total gerbong](#b-perhitungan-total-gerbong)
        - [c. Identifikasi penumpang tertua](#c-identifikasi-penumpang-tertua)
        - [d. Perhitungan rata-rata umur penumpang](#d-perhitungan-rata-rata-umur-penumpang)
        - [e. Perhitungan jumlah penumpang business class](#e-perhitungan-jumlah-penumpang-business-class)
      - [Kendala](#kendala)
    - [Soal 2 - EKSPEDISI PESUGIHAN GUNUNG KAWI - MAS AMBA](#soal-2---ekspedisi-pesugihan-gunung-kawi---mas-amba)
    	- [Pengerjaan](#pengerjaan)
    	- [Kendala](#kendala-1)
    - [Soal 3 KOS SLEBEW AMBATUKAM](#soal-3-kos-slebew-ambatukam)
      - [Overview Program](#overview-program-1)
      - [1. Fitur Penambah Penghuni](#1-fitur-penambah-penghuni)
      - [2. Fitur Hapus penghuni](#2-fitur-hapus-penghuni)
      - [3. Fitur Penampil Database](#3-fitur-penampil-database)
      - [4. Fitur Update status](#4-fitur-update-status)
      - [5. Fitur Pencetak Laporan](#5-fitur-pencetak-laporan)
      - [6. Fitur Cron Job](#6-fitur-cron-job)
      - [7. Exit Program](#7-exit-program)
      - [Output](#output-1)
        - [1. Main Menu](#1-main-menu)
        - [2. Fitur Penambah Penghuni](#2-fitur-penambah-penghuni)
        - [3. Fitur Hapus Penghuni](#3-fitur-hapus-penghuni)
        - [4. Fitur Penampil Database](#4-fitur-penampil-database)
        - [5. Fitur Update Status](#5-fitur-update-status)
        - [6. Fitur Pencetak Laporan](#6-fitur-pencetak-laporan)
        - [7. Fitur Cron Job](#7-fitur-cron-job)
      - [Kendala](#kendala-2)
  - [Notes](#notes)

## Laporan

### Soal 1 - ARGO NGAWI JESGEJES

#### Overview Program

Program dibuat mengimplementasikan while loop untuk memungkinkan pengecekan semua poin soal dengan menjalankan programnya sekali.

```bash
while true
do
  echo 'a/b/c/d/e (Ctrl+D to exit)'
  read input || break
```

Line terakhir menggunakan OR operator dimana jika `read input` diberikan Ctrl+D akan memberikan exit status 1 yang membuat program menjalankanperintah break yang akan menghentikan while loop untuk menyelesaikan program.

#### a. Perhitungan total penumpang

```bash
if [ $input == 'a' ]
then
  awk 'BEGIN {FS = ","} NR > 1 {count++} END {print "Jumlah penumpang KANJ adalah "count " orang"}' passenger.csv
```

Jika input `a` diberikan, program akan menjalankan perintah AWK yang menghitung jumlah baris yang terdapat dalam `passenger.csv` kecuali untuk baris pertama yang dilakukan dengan menggunakan pattern `NR > 1`.

Note: Field separator sebenarnya tidak diperlukan untuk bagian ini.

#### b. Perhitungan total gerbong

```bash
elif [ $input == 'b' ]
then
  awk 'BEGIN {FS = ","} NR > 1 {count[$4]++} END {print "Jumlah gerbong KANJ adalah " length(count) " gerbong"}' passenger.csv
```

Jika input `b` diberikan, maka program akan menghitung jumlah gerbong dengan cara menyetor semua value kolom ke 4 yang unik menggunakan array dalam awk.

`count[$4]++`

- `count` adalah nama array.
- `$4` membuat key dari array tersebut adalah nilai dari kolom ke 4 dari suatu baris.
- Setiap key yang ditambahkan akan overwrite key yang sudah ada jika keynya sama. <!-- holy shi, I do not know how to properly explain in this shitty language -->
- Note: Array dalam awk bersifat asosiatif dimana setiap nilai disimpan menggunakan key dan bukan index.
<!-- explaining this here so I don't have to explain on the next one -->

`length(count)`

Perintah ini menghitung jumlah key yang terdapat dalam array `count`.

#### c. Identifikasi penumpang tertua

```bash
elif [ $input == 'c' ]
then
  awk 'BEGIN {FS = ","; max = 0} NR > 1 {if ($2 > max) {max = $2; name = $1}} END {print name " adalah penumpang tertua dengan usia " max " tahun"}' passenger.csv
```
<!-- I probably could've used the array to simplify this -->
Jika input `c` diberikan, awk akan mengecek umur tertinggi dan menyimpannya dalam variabel `max` dan menyimpan nama dari umur tersebut dalam variable `name`.
<!-- You could already see my will to write this report fading XD -->
#### d. Perhitungan rata-rata umur penumpang

```bash
elif [ $input == 'd' ]
then
  awk 'BEGIN {FS = ","; total = 0; count = 0} NR > 1 {total += $2; count++} END {print "Rata-rata usia penumpang adalah " int(total/count)}' passenger.csv
```

Opsi `d` menghitung total umur semua penumpang dan jumlah baris, lalu membagi total umur dengan jumlah baris.

#### e. Perhitungan jumlah penumpang business class

```bash
elif [ $input == 'e' ]
then
  awk 'BEGIN {FS = ","; count = 0} NR > 1 {if ($3 == "Business") count++} END {print "Jumlah penumpang business class adalah " count}' passenger.csv
```

Opsi `e` menggunakan variable `count` untuk menghitung jumlah kolom ke 3 yang memiliki value `Business`.

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

#### Kendala

Syntax dan space sensitivity bash.

### Soal 2 - EKSPEDISI PESUGIHAN GUNUNG KAWI - MAS AMBA

#### Pengerjaan

Instruksi pertama untuk soal ini adalah setup virtual environment dan menginstall tools. Tetapi karena saya ~malas~ merasa itu tidak efisien, saya langsung menggunakan `wget -O peta-ekspedisi-amba.pdf link-here` untuk mendownload file dan menyimpannya sebagai file name yang sesuai secara langsung.
<!-- Seriously? what the hell is gdown, and why pip? it's available on apt as a package -->

<img width="944" height="1023" alt="image" src="https://github.com/user-attachments/assets/ebcd7317-01c6-4c3f-82b4-4a741ec56dc2" />

Selanjutnya, saya menggunakan `strings` untuk menunjukkan isi file yang readable dalam file PDF tersebut.

<img width="1875" height="1016" alt="image" src="https://github.com/user-attachments/assets/214d9d5f-b7ad-45bd-9058-3270105a0010" />
<!-- Steganography? As people like to say, "Nyawit nih orang" -->

Didapatkan link repo `https://github.com/pocongcyber77/peta-gunung-kawi.git` yang lalu saya clone dan hapus folder `.git` agar tidak mengacaukan repository saya.

Di dalam repo tersebut terdapat file `gsxtrack.json` yang berisi koordinat yang akan diparse dengan `parserkoordinat.sh`.

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

Untuk ini, saya full menggunakan awk dan regex untuk parsing koordinat, lalu menyimpannya dalam file menggunakan operator output redirection `>` untuk menyimpan ke dalam file `titik-penting.txt`.

<img width="1006" height="211" alt="image" src="https://github.com/user-attachments/assets/8fdbc054-1167-4821-8fd6-701d57257d17" />


Langkah terakhir adalah mengkomputasi titik tengah dari koordinat-koordinat yang didapatkan dengan `nemupusaka.sh` dan menyimpannya dalam `posisipusaka.txt`.

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

Saya menggunakan awk untuk melakukan perhitungan titik tengah lalu sekali lagi menjalankan program tersebut dengan output redirection operator untuk menyimpannya dalam `posisipusaka.txt`.

<img width="393" height="129" alt="image" src="https://github.com/user-attachments/assets/6327ab30-f23f-4028-a7c6-e63ed44e41a0" />

#### Kendala

Struktur folder dan soal memiliki typo "ekspedsi" yang menyebabkan
1.	Kebingungan atas penamaan folder.
2.	Kekesalan karena terdapat typo.
3.	kelupaan untuk menanyakan perihal tersebut karena poin 1 & 2.

Perintah soal menyuruh setup gdown menggunakan **pip**??????? Dan setup **venv**????. Walaupun gdown terdapat dalam package linux.

### Soal 3 KOS SLEBEW AMBATUKAM

#### Overview Program

Program memiliki struktur file sebagai berikut.

```
.
├── data
│   └── penghuni.csv
├── kost_slebew.sh
├── log
│   └── tagihan.log
├── rekap
│   └── laporan_bulanan.txt
└── sampah
    └── history_hapus.csv
```

Saat dijalankan, program ini akan mengecek jika memiliki suatu argumen atau tidak (akan dijelaskan nanti) lalu print banner dan masuk ke while loop yang akan menunjukkan main menu.

<!-- tfw more language issue -->

```bash
printf "%s" "$banner"
while true
do
	main_menu
	if [[ $input == "1" ]]
	then
		add_tenant
	elif [[ $input == "2" ]]
	then
		remove_tenant
	elif [[ $input == "3" ]]
	then
		show_tenant
	elif [[ $input == "4" ]]
	then
		update_tenant
	elif [[ $input == "5" ]]
	then
		report_tenant
	elif [[ $input == "6" ]]
	then
		reminder_shi
	elif [[ $input == "7" ]]
	then
		break
	else
		echo "Input salah"
	fi
		read -p "Tekan Enter untuk melanjutkan"

done
```
<!-- No wonder my code is flagged as AI, I used proper english naming for the variables and function names but not the outputs -->

#### 1. Fitur Penambah Penghuni

Pemanggilan fungsi `add_tenant` akan meminta input-input yang diperlukan untuk penambahan penghuni.

```bash
	echo "
====================================
       TAMBAH PENGHUNI BARU
===================================="
	read -p "Nama Penghuni                : " name
	read -p "Nomor Kamar                  : " num
	read -p "Harga Sewa                   : " cost
	read -p "Tanggal Masuk (YYYY-MM-DD)   : " inp_date
	read -p "Status Awal (Aktif/Menunggak): " status
```

Nomor kamar akan melalui sanitasi dimana awk akan mengecek jika ada nomor kamar yang sama.

```bash
	# Room number sanitation
	flag=$(awk -v room=$num 'BEGIN {FS = ","} $2 == room {flag = 1} END {if (flag == 1) {print "1"} else {print "0"}}' ./data/penghuni.csv)

	if [[ $flag == "1" ]]
	then
		echo "Nomor Kamar Terpenuhi"
```

Lalu harga akan melalui sanitasi dimana harga sewa tidak boleh negatif.

```bash
	# Cost Sanitation
	elif [[ $cost -lt 0 ]] # Note that other than equals/not equal to have different operator
	then
		echo "Harga sewa tidak boleh negatif"
```

Selanjutnya tanggal akan disanitasi menggunakan regex lalu divalidasi dengan menggunakan prorgam date dalam bentuk seconds since epoch untuk memastikan bahwa tanggal input tidak lebih dari tanggal sekarang.

```bash
	# Date Sanitation
	elif [[ ! $inp_date =~ ^[0-9]{4}-(0[1-9]|1[0-2])-(0[1-9]|[12][0-9]|3[01])$ ]]
	then
		echo "Format tanggal salah"
	# Date Validation (too lazy, will just let the date be normalized)
	elif [[ $(date -d "$inp_date" +%s) > $(date +%s) ]]
	then
		echo "Tanggal Invalid"
```

Terakhir, status akan disanitasi dimana input harus antara `Aktif` atau `Menunggak`.

```bash
	# Status Sanitation
	elif [[ $status != "Aktif" && $status != "Menunggak" ]]
	then
		echo "Status Invalid"
```

Jika berhasil melalui sanitasi, maka awk akan parse variable input ke dalam awk sebagai variable, print seluruh line dari `penghuni.csv` dan print data penghuni baru di line terakhir yang akan di output redirect ke `penghuni.csv.temp` yang pada akhirnya akan direname menjadi `penghuni.csv`.
<!-- Holy fuck, I hate Indonesian, I wish I could just write this is english -->

```bash
	else
		awk -v a="$name" -v b="$num" -v c="$cost" -v d="$status" 'BEGIN {OFS=","} 1; END {print a,b,c,d}' data/penghuni.csv > data/penghuni.csv.temp
		mv data/penghuni.csv.temp data/penghuni.csv
		echo "Penghuni $name berhasil ditambahkan ke kamar $num dengan status $status"
	fi
}
```

#### 2. Fitur Hapus penghuni

Pemanggilan fungsi hapus penghuni akan meminta input untuk nama penghuni yang akan dihapus.

```bash
	echo "
====================================
           HAPUS PENGHUNI
===================================="
	read -p "Nama Penghuni  :" name
```

Lalu input akan dicek jika nama tersebut terdapat dalam database. Jika tidak ada, fungsi akan berhenti.

```bash
	# Checks if name exists
	flag=$(awk -v a="name" 'BEGIN {FS=","} $1 == a {print 0;exit} END {print 1}' data/penghuni.csv)
	if [[ $flag == 1 ]]
	then
		echo "Nama tidak ditemukan"
		return 0
	fi
```

Setelah melalui sanitasi, proses selanjutnya adalah menemukan nama penghuni yang ingin dihapus dan menambahkannya ke dalam `history_hapus.csv`.

```bash
	# Moves into trash
	data=$(awk -v a="$name" -v b="$(date +%F)" 'BEGIN {OFS=","; FS=","} $1 == a {print $1, $2, $3, b}' data/penghuni.csv)
	awk -v a="$data" 'BEGIN {OFS=","} 1; END {print a}' sampah/history_hapus.csv > sampah/history_hapus.csv.temp
	mv sampah/history_hapus.csv.temp sampah/history_hapus.csv
```

Lalu database akan diprint dengan line yang sesuai dengan nama input dikecualikan dan dimasukkan ke dalam temporary file yang akhirnya akan di rename menjadi `penghuni.csv`.

```bash
# Deletes data
	awk -v a=$"$name" 'BEGIN {FS=","} $1 != a' data/penghuni.csv > data/penghuni.csv.temp
	mv data/penghuni.csv.temp data/penghuni.csv
	echo "Data Penghuni $name berhasil diarsipkan ke sampah/history_hapus.csv dan dihapus dari database"
```

#### 3. Fitur Penampil Database

Pemanggilan fungsi ini melibatkan penggunaan awk sebagai program untuk menyajikan database dalam format table yang rapi dengan menggunakan padding agar table menjadi rapi.

```bash
	awk -F',' '
	BEGIN {
		printf "=====================================================\n"
		printf "              DAFTAR PENGUNI KOST\n"
		printf "=====================================================\n"
		printf "No | %-10s | %-5s | %-12s | %-10s\n", "Nama", "Kamar", "Harga", "Status"
		printf "-----------------------------------------------------\n"
	}
	NR > 1 {
		count++
		printf "%-2d | %-10s | %-5s | Rp. %-12s | %-10s\n", count, $1, $2, $3, $4
		if ($4 == "Aktif") aktif++
		else menunggak++
	}
	END {
		printf "-----------------------------------------------------\n"
		printf "Total: %d | Aktif: %d | Menunggak: %d\n", count, aktif, menunggak
		printf "=====================================================\n"
	}
	' data/penghuni.csv
```

#### 4. Fitur Update status

Fitur ini akan meminta input untuk nama penghuni dan status barunya.
<!-- Holy fuck, I'm getting tired and bored of this now -->

```bash
	echo "
====================================
           UPDATE STATUS
===================================="
	read -p "Masukkan nama penghuni: " name
	read -p "Masukkan status baru: " status
```

Lalu akan melalui sanitation yang memastikan status valid dan nama penghuni terdapat dalam database.

```bash
if [[ $status != "Aktif" && $status != "Menunggak" ]]
	then
		echo "Status invalid"
		return 0
	elif [[ $(awk -v a="$name" -F',' '$1 == a {print 1; exit}' data/penghuni.csv) != "1" ]]
	then
		echo "Nama penghuni tidak ditemukan"
		return 0
	fi
```

Setelah melewati sanitasi, database akan diupdate dan akan melaporkan bahwa status berhasil diupdate.

```bash
	awk -v a="$name" -v b="$status" 'BEGIN {FS=",";OFS=","} $1 != a; $1 == a {print $1,$2,$3,b}' data/penghuni.csv > data/penghuni.csv.temp	
	mv data/penghuni.csv.temp data/penghuni.csv
	echo "Status $name berhasil diubah menjadi $status"
```

#### 5. Fitur Pencetak Laporan

Fungsi ini menggunakan awk untuk menghitung total pemasukan, tunggakan, dan jumlah kamar yang dihuni beserta nama-nama yang menunggak. Setelah itu, output akan di masukkan ke `laporan_bulanan.txt`. Diakhiri dengan membaca laporan menggunakan `cat`.

```bash
awk 'BEGIN {
FS=",";aktif=0;menunggak=0;count=0
print "===================================="
print "          Laporan Keuangan"
print "===================================="
}

NR > 1 {
if ($4 == "Aktif") {aktif+=$3; count++}
if ($4 == "Menunggak") {menunggak+=$3; count++; arr[$1]++; flag="1"}
}
END {
printf "Total Pemasukan (Aktif)   : Rp. %d\n", aktif
printf "Total Tunggakan           : Rp. %d\n", menunggak
printf "Jumlah Kamar Terisi       : %d\n", count
printf "------------------------------------\nDaftar penghuni menunggak:\n"
if (flag != "1") {print "Tidak ada tunggakan"}
else{
for (i in arr){print i}}
print "===================================="
}' data/penghuni.csv > rekap/laporan_bulanan.txt
cat rekap/laporan_bulanan.txt
```
#### 6. Fitur Cron Job

Untuk fitur ini, saya sudah menyiapkan untuk penggunaan option pada program ini.

Jika program ini dijalankan dengan option `--check-tagihan` maka program akan menambahkan laporan tunggakan ke dalam `tagihan.log` sesuai dengan format yang telah ditentukan.

```bash
if [[ $1 == "--check-tagihan" ]]
then
	dat=$(date +%F)
	tim=$(date +%T)
	awk -v a="$dat" -v b="$tim" '
	BEGIN {FS=","}
	$4 == "Menunggak" {printf "[%s %s] TAGIHAN: %s (%s) - Menunggak Rp. %s\n", a, b, $1, $2, $3}' data/penghuni.csv >> log/tagihan.log
	exit 0
fi
```

Opsi 6 akan memulai while loop untuk menu cron yang akan meminta input.

```bash
		echo "
====================================
              MENU CRON
====================================
1. Lihat Cron Job aktif
2. Daftar Cron Job pengingat
3. Hapus  Cron Job pengingat
4. Kembali
===================================="	
		read -p ">> " input
```

Pilihan 1 akan menunjukkan pengingat yang aktif dan memastikan error message saat tidak ada cron job yang aktif tidak muncul.

```bash
		if [[ $input == "1" ]]
		then
			out=$(crontab -l 2>/dev/null)
			if [[ $? == 1 ]]
			then
				echo "Tidak ada pengingat aktif"
			else
				echo "--Daftar Cron Job--"
				echo "$out"
			fi
```

Pilihan 2 akan meminta input untuk jam dan menit untuk pengingat yang baru yang akan dipanggil setiap hari.

```bash
		elif [[ $input == "2" ]]
		then
			read -p "Masukkan Jam (0-23): " hour
			read -p "Masukkan Menit (0-59): " mins
			hour=$(($hour % 24))
			mins=$(($mins % 60))
			#I'm normalizing this cuz I AM NOT DEALING WITH ANOTHER INPUT SANITATION
			echo "$mins $hour * * * $(pwd)/kost_slebew.sh --check-tagihan" > ./cron_temp
			crontab ./cron_temp
			rm ./cron_temp
			echo "Cron Job pengingat berhasil ditambahkan"
```

Pilihan 3 akan menghapus Cron Job yang sudah ada dan memastikan error message tidak muncul saat tidak ada pengingat yang aktif.

```bash
		elif [[ $input == "3" ]]
		then 
			crontab -r 2>/dev/null && echo "Cron Job pengingat terhapus" || echo "Tidak ada Cron Job yang terdaftar"
```

Pilihan 4 akan mengembalikan ke menu awal.

```bash
		elif [[ $input == "4" ]]
		then
			return 0
```

#### 7. Exit Program

Opsi 7 akan menghentikan while loop dan menyelesaikan program.

#### Output

##### 1. Main Menu

<img width="647" height="973" alt="image" src="https://github.com/user-attachments/assets/012eb752-f34b-44b8-85d0-026086a61b8b" />

##### 2. Fitur Penambah Penghuni

<img width="683" height="201" alt="image" src="https://github.com/user-attachments/assets/8098ce74-5e6d-45b0-8d4b-d1d8a5f5aa1f" />

##### 3. Fitur Hapus Penghuni

<img width="897" height="126" alt="image" src="https://github.com/user-attachments/assets/5319fd98-e983-442c-8341-5550f2d63306" />

##### 4. Fitur Penampil Database

<img width="567" height="222" alt="image" src="https://github.com/user-attachments/assets/7ec18700-0c09-4453-be04-5d9bb6d6709e" />

##### 5. Fitur Update Status

<img width="415" height="142" alt="image" src="https://github.com/user-attachments/assets/1a2488de-f26e-4c71-a881-68faf7aaa142" />

##### 6. Fitur Pencetak Laporan

<img width="404" height="212" alt="image" src="https://github.com/user-attachments/assets/ab1b950b-e441-4c48-af30-8425890bccec" />

##### 7. Fitur Cron Job

<img width="943" height="219" alt="image" src="https://github.com/user-attachments/assets/55ced3b1-6d7c-4e67-b8ee-fef9764b384a" />

<img width="407" height="247" alt="image" src="https://github.com/user-attachments/assets/161c1175-364e-483e-a4b6-e1596aaba073" />

<img width="391" height="202" alt="image" src="https://github.com/user-attachments/assets/b4b5778c-1211-489a-8107-1832b11ee2e7" />

#### Kendala

- Soal panjang

<img width="437" height="96" alt="image" src="https://github.com/user-attachments/assets/dcf026f6-a6ef-4949-8b90-79122f1ea1ee" />


## Notes

Very thankful for this markdown table of contents generator script

<a href="https://github.com/Lirt/markdown-toc-bash/tree/main" target="_blank">markdown-toc-bash</a>
