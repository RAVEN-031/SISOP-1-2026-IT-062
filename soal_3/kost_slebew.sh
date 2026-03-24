#!/usr/bin/bash

banner="
⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⣀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠈⢑⡢⣄⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⢀⠀⣾⣿⣿⣦⡀⠀⠀⠀⢀⣴⣧⣶⠯⠗⠒⠒⢪⡄⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠉⠻⡈⠳⣄⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⢈⣼⣟⣁⣿⣿⣻⣶⣶⣿⣿⣿⡋⠀⠀⠀⠀⣠⣾⡇⠀⠀⠀⡀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢈⠢⡈⠣⡀⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⣀⡴⣿⣷⣶⣿⣟⠘⢿⣿⣿⣿⠛⠀⠀⠀⠀⢠⣾⣿⣿⠀⠀⢀⡞⠁⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⡀⠀⠈⢣⠈⢄⠱⡄⠀⠀⠀⠀⠀⠀⠀
⠀⢐⠶⣶⠭⠵⠶⢿⣿⣭⣿⣤⡀⢰⣿⣿⣿⣭⣭⠽⣶⣴⣿⣿⣿⠃⠀⢀⡞⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢰⡀⠀⠀⢣⠈⢆⠹⡀⠀⠀⠀⠀⠀⠀
⠁⢁⣤⣌⢹⣶⣾⠟⠁⣠⡾⣿⣿⢼⣿⡟⠏⢯⣟⢿⣿⣿⡿⢣⠃⠀⠀⡜⠀⠀⠀⠀⠀⠀⠀⠀⡀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣇⠀⠀⠀⡆⠈⡆⢱⠀⠀⠀⠀⠀⠀
⠀⠙⠻⣿⣦⣏⣻⡤⣾⡿⣳⠟⠓⠋⣿⠀⠀⣨⣿⣷⣮⣉⡴⠃⠀⠀⢰⠇⠀⠀⠀⠀⢀⡗⠀⢰⢧⠀⠀⠀⠀⠀⠀⠀⢀⠀⣿⡇⠀⢰⢱⠀⢸⡀⡇⠀⠀⠀⠀⠀
⠀⠀⠀⠈⢻⡦⠽⣿⡟⣴⣏⣀⡀⣠⣿⣠⣾⣿⣿⣿⣾⡅⠀⠀⠀⠀⡼⠀⠀⠀⠀⠀⣸⡇⠀⢨⣼⠀⠀⠀⠀⡄⠀⠀⢠⠀⣯⣿⠀⢸⢸⠀⠀⡇⢸⠀⠀⠀⠀⠀
⠀⠀⠀⣤⣴⡓⢚⣿⣼⡉⣳⠦⢤⣀⠈⢦⡈⣿⣿⣿⣽⠇⠀⠀⠀⢀⡇⠀⠀⠀⡖⢸⣿⠇⠀⣼⣇⠀⠀⠀⠀⡇⠀⠀⡆⢰⡏⢹⡆⢸⣸⠀⠀⢡⠀⡇⠀⠀⠀⠀
⠀⢰⠾⠛⠉⠉⣿⠾⣟⣉⣀⢶⣄⠙⣦⠈⢳⡜⣏⠳⣿⠀⠀⠀⠀⢸⠁⠀⠀⡼⣠⢛⡟⠀⣰⢇⣿⠀⠀⡀⢸⠁⠀⣰⣷⡞⠀⠀⡇⣼⣿⠀⠀⢸⠀⡇⠀⠀⠀⠀
⠰⠀⣀⣀⣀⡜⢈⠀⢨⣅⡀⠉⠛⢢⡈⠳⡄⠙⡎⣦⡟⠀⠀⣇⠀⡍⠀⢠⡾⡵⣣⣯⠇⣰⡿⢻⡟⠀⢠⢣⡟⠀⣰⣿⣿⡴⠞⠋⣏⣿⣻⠀⠀⠘⠀⡇⠀⠀⠀⠀
⢰⠞⠋⠍⠉⢣⠸⡻⣷⢾⡇⠀⠀⠀⠁⠰⠃⡞⣹⠻⡇⠀⠀⣼⠀⡇⢘⣟⣾⣿⣻⡿⣼⠿⠥⣼⣇⣠⣧⡟⢁⡴⢫⡟⠋⢀⣀⣼⣿⣿⢿⡇⠀⡇⣸⡇⠀⠀⠀⠀
⠂⠀⠀⠀⠀⠈⢆⡵⢻⡿⠁⠀⠀⠀⠀⠀⡜⣰⠛⣿⡇⠀⠀⢸⡀⣷⣿⠟⠉⢁⣾⠞⠁⠀⢀⠎⣰⠿⣿⡷⠋⠀⠁⠀⣰⣿⣿⣿⡏⠻⣿⣿⢻⠋⠀⡇⠀⠀⠀⠀
⠀⠀⠀⢀⡠⠔⣫⣿⣿⠁⠀⠀⠀⠀⠀⡸⢠⠃⣀⠈⡇⡇⡆⢸⣇⢹⣀⣀⣴⣿⣿⠶⣶⣦⣯⡙⠀⠘⠉⠀⠀⠀⠀⠀⢸⣿⣿⠗⡇⢰⢻⡇⣼⠀⠀⡇⠀⠀⠀⠀
⠀⠀⠀⢠⡶⠛⡽⣣⣿⠀⠀⢀⣀⠀⣠⢡⢏⣮⠦⣍⡇⡇⡇⠘⣼⣼⣴⣿⠟⣿⡶⣾⣟⣛⡏⠛⠧⠀⠀⠀⠀⠀⠀⠀⠈⣟⠚⡼⣡⠇⣸⢡⡟⠀⢀⠇⠀⠀⠀⠀
⠀⠠⠔⢩⠞⡽⠋⠀⣻⡖⢾⣋⣷⣬⣏⡽⢿⠸⡄⡞⢣⡇⢏⠉⢯⣷⣟⠻⣆⠹⡜⢮⠍⣼⠃⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠈⠛⠋⠁⠀⣿⡏⡇⠀⢸⠀⠀⠀⠀⠀
⠀⠀⢠⠃⢰⠃⢠⢶⣿⣾⠟⠛⠉⠉⠙⢿⡟⠳⡹⣅⢸⣻⢸⠀⣜⣿⣿⡄⠀⠙⠚⠓⠺⠇⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣰⣿⠀⡇⠀⡏⠀⠀⠀⠀⠀
⠙⢤⡘⠀⢸⠰⣯⢿⠟⡅⠀⢀⣠⣤⣤⣼⣷⡀⠈⠓⢽⣿⡈⡆⠸⣿⠈⠻⣆⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⡴⢻⣏⠀⡇⢀⡇⠀⠀⠀⠀⠀
⢦⡀⠑⢄⡸⡄⠀⠀⢣⣸⣶⣿⠟⠻⡏⠉⢷⣙⣢⡀⠀⢹⢧⢳⠀⣯⡄⠀⠉⠣⣀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢐⠎⢸⠀⡇⢸⡄⢰⠀⠀⠀⠀
⠀⠙⢆⠀⠑⢧⠀⡇⠈⡿⢻⡇⠀⠀⢹⠀⠀⢳⣌⠙⠳⣼⡜⣎⡆⣿⣿⣦⡀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣠⠋⠀⠈⣧⢣⢸⡷⡀⡆⠀⠀⠀
⠀⠀⠈⢣⣲⡀⣷⣽⡀⡇⢼⠃⠀⠀⠘⡀⠀⠈⠙⠓⠀⠈⢧⠘⢿⡀⣿⡏⠙⠢⣀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠶⠂⠀⠀⢀⠜⠁⠀⠀⠀⢻⣼⡸⣇⢱⡘⡄⠀⠀
⢢⡀⠀⠀⢻⡗⢹⠘⣿⡇⠈⠀⠀⠀⠀⠃⠀⠀⠀⠀⠀⠀⠈⡆⠈⢿⣿⡇⠀⠀⠈⠑⠦⣄⡀⠀⠀⠀⠀⠀⠀⠀⠀⢀⡔⢁⣀⠀⠀⠀⠀⠈⣇⡇⢸⠘⢷⠸⡀⠀
⠈⠙⢷⡀⣸⢃⣾⣄⢈⡇⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠸⡄⠈⢿⡇⠀⠀⠀⠀⠀⠀⠉⠑⠒⣤⣤⣀⣀⣀⡰⠋⠒⣠⣬⢭⣤⣾⣿⠀⢹⠈⠘⠃⠘⠄⢱⠀
⠀⠀⠀⣰⡿⣏⠘⢮⣹⠃⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢣⠀⢸⣿⣦⡀⠀⠀⠀⠀⠀⢀⣼⣣⠎⠀⠀⢀⣀⣠⣼⡿⠿⠟⠿⢿⣿⣦⡼⣦⡀⢀⠀⠀⠈⡇
⠲⣶⡋⠉⠀⠘⢷⠢⣻⡄⠀⠘⣄⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠈⣆⡘⢻⡹⡌⠲⣄⠀⠀⠀⢪⠟⠁⢀⣠⣤⣾⣟⡯⠕⠊⢁⣈⣈⠙⢻⣿⣷⡿⠁⣼⠀⢠⡄⠁
⢤⣘⢿⣦⡀⠀⠀⢻⠺⣳⡀⠀⠈⢣⡀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢹⣥⠀⢳⢿⡄⢀⣹⣦⣰⣧⣄⠈⡹⢫⣿⠟⠁⠀⠀⠀⠀⠀⠀⠉⠓⢿⣿⣿⣾⡿⠀⢸⡇⡄
⢦⡈⠙⣿⣾⣦⡀⠀⢣⠙⣿⣄⠀⠀⠑⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠈⣿⣧⠀⢫⣿⣿⣿⣿⣿⣿⣿⣿⡶⠋⠁⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢻⣿⣿⠇⢀⡟⠁⡇
⠳⢿⣷⣌⠣⡉⠺⢦⣸⡀⢸⢻⣦⡀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠋⠻⣷⡀⢻⣿⣿⡿⢹⣿⠿⠧⠒⠒⠂⠉⠁⠀⠀⠀⠀⠀⠀⠀⠀⠀⢸⢿⣟⠀⣼⠁⢰⠁
⠀⠀⠉⢻⡳⣽⣆⠀⠹⣿⣾⠀⢻⢳⡄⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠸⡆⠹⣿⡄⢿⣿⡯⠿⠒⠒⠈⠁⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢠⡟⡎⡍⡼⡇⢀⡎⠀
⠀⠀⠀⠀⡇⢹⢿⣆⠀⡽⣯⢤⢼⣼⢈⢦⠀⠀⠀⠠⠀⠀⠀⠀⠀⠀⠀⠻⠀⢻⣟⢾⡋⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⣴⡿⣼⢰⡿⡽⠀⡜⠀⠀
⠀⠀⠀⢀⡇⢸⠞⢻⣆⡇⡇⠘⣾⠿⡀⠉⠳⣄⠀⠀⢆⠀⠀⠀⠀⠀⠀⠀⠀⠀⣿⡎⢿⣗⠦⣀⡀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣀⡴⠋⡯⢷⡏⠈⡵⠁⡼⠁⠀⠀
⠀⠐⠯⠽⠷⠋⠀⢸⢹⠁⡇⠀⢻⢰⡇⢦⠀⠈⢦⠀⡘⡆⠀⠀⠀⠀⠀⠀⠀⠀⠈⠁⢸⡉⢱⠈⠁⠀⠀⠀⠀⠀⠀⠀⢀⣠⡾⣿⠁⠀⠀⣹⡇⣼⠁⣰⡇⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠸⢸⡼⠁⠀⠘⡆⢹⡌⠀⠀⠀⠱⣵⡀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢣⡇⠀⠀⠀⠀⠀⠀⠀⢀⣠⣾⠁⠀⡏⠀⠀⢇⡿⣷⠇⣰⢫⣇
Mizuki Akiyama!
"

main_menu() {
	echo "
	
====================================
    SISTEM MANAJEMEN KOST SLEBEW
====================================

1.      Tambah Penghuni Baru
2.	Hapus Penghuni
3.	Tampilkan Daftar Penghuni
4.	Update Status Penghuni
5.	Cetak Laporan Penghuni
6.	Kelola Pengingat Tagihan
7.	Exit Program"

	read -p ">> " input
}
add_tenant() {
	echo "
====================================
       TAMBAH PENGHUNI BARU
===================================="
	read -p "Nama Penghuni                : " name
	read -p "Nomor Kamar                  : " num
	read -p "Harga Sewa                   : " cost
	read -p "Tanggal Masuk (YYYY-MM-DD)   : " inp_date
	read -p "Status Awal (Aktif/Menunggak): " status

	# Room number sanitation
	flag=$(awk -v room=$num 'BEGIN {FS = ","} $2 == room {flag = 1} END {if (flag == 1) {print "1"} else {print "0"}}' ./data/penghuni.csv)
	
	if [[ $flag == "1" ]]
	then
		echo "Nomor Kamar Terpenuhi"
	
	# Cost Sanitation
	elif [[ $cost -lt 0 ]] # Note that other than equals/not equal to have different operator
	then
		echo "Harga sewa tidak boleh negatif"
	
	# Date Sanitation
	elif [[ ! $inp_date =~ ^[0-9]{4}-(0[1-9]|1[0-2])-(0[1-9]|[12][0-9]|3[01])$ ]]
	then
		echo "Format tanggal salah"
	# Date Validation (too lazy, will just let the date be normalized)
	elif [[ $(date -d "$inp_date" +%s) > $(date +%s) ]]
	then
		echo "Tanggal Invalid"
	# Status Sanitation
	elif [[ $status != "Aktif" && $status != "Menunggak" ]]
	then
		echo "Status Invalid"
	else
		awk -v a="$name" -v b="$num" -v c="$cost" -v d="$status" 'BEGIN {OFS=","} 1; END {print a,b,c,d}' data/penghuni.csv > data/penghuni.csv.temp
		mv data/penghuni.csv.temp data/penghuni.csv
		echo "Penghuni $name berhasil ditambahkan ke kamar $num dengan status $status"
	fi
}

remove_tenant() {
	echo "
====================================
           HAPUS PENGHUNI
===================================="
	read -p "Nama Penghuni  :" name
	# Checks if name exists
	flag=$(awk -v a="name" 'BEGIN {FS=","} $1 == a {print 0;exit} END {print 1}' data/penghuni.csv)
	if [[ $flag == 1 ]]
	then
		echo "Nama tidak ditemukan"
		return 0
	fi
	# Moves into trash
	data=$(awk -v a="$name" -v b="$(date +%F)" 'BEGIN {OFS=","; FS=","} $1 == a {print $1, $2, $3, b}' data/penghuni.csv)
	awk -v a="$data" 'BEGIN {OFS=","} 1; END {print a}' sampah/history_hapus.csv > sampah/history_hapus.csv.temp
	mv sampah/history_hapus.csv.temp sampah/history_hapus.csv
	# Deletes data
	awk -v a=$"$name" 'BEGIN {FS=","} $1 != a' data/penghuni.csv > data/penghuni.csv.temp
	mv data/penghuni.csv.temp data/penghuni.csv
	echo "Data Penghuni $name berhasil diarsipkan ke sampah/history_hapus.csv dan dihapus dari database"
}

show_tenant() {
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

}

update_tenant() {
	echo "
====================================
           UPDATE STATUS
===================================="
	read -p "Masukkan nama penghuni: " name
	read -p "Masukkan status baru: " status
	if [[ $status != "Aktif" && $status != "Menunggak" ]]
	then
		echo "Status invalid"
		return 0
	elif [[ $(awk -v a="$name" -F',' '$1 == a {print 1; exit}' data/penghuni.csv) != "1" ]]
	then
		echo "Nama penghuni tidak ditemukan"
		return 0
	fi
	awk -v a="$name" -v b="$status" 'BEGIN {FS=",";OFS=","} $1 != a; $1 == a {print $1,$2,$3,b}' data/penghuni.csv > data/penghuni.csv.temp	
	mv data/penghuni.csv.temp data/penghuni.csv
	echo "Status $name berhasil diubah menjadi $status"
}

report_tenant() {
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
}

reminder_shi() {
	while true
	do
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
		elif [[ $input == "3" ]]
		then 
			crontab -r 2>/dev/null && echo "Cron Job pengingat terhapus" || echo "Tidak ada Cron Job yang terdaftar"
		elif [[ $input == "4" ]]
		then
			return 0
		else
			echo "Input salah"
		fi
				
	done	
}

if [[ $1 == "--check-tagihan" ]]
then
	dat=$(date +%F)
	tim=$(date +%T)
	awk -v a="$dat" -v b="$tim" '
	BEGIN {FS=","}
	$4 == "Menunggak" {printf "[%s %s] TAGIHAN: %s (Kamar %s) - Menunggak Rp. %s\n", a, b, $1, $2, $3}' data/penghuni.csv >> log/tagihan.log
	exit 0
fi
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
