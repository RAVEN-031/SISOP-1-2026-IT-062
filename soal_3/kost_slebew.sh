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

invalid() {
	echo "Input Salah!"
}
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
		echo "Penghuni" $name "berhasil ditambahkan ke kamar" $num "dengan status " $status
	fi
}

remove_tenant() {
	echo "
====================================
           HAPUS PENGHUNI
===================================="
	read -p "Nama Penghuni  :" name

}



printf "%s" "$banner"
while true
do
	main_menu
	add_tenant
done	
