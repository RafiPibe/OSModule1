# <b><i>sisop-praktikum-modul-01-2023-BJ-U04</i></b>

## Group U04
This is our attempt on the 1st Practicum of Operation System 
consisting the members as following:

| Name                        | NRP        |
|-----------------------------|------------|
|Hanifi Abrar Setiawan        | 5025211066 |
|Faraihan Rafi Adityawarman   | 5025211074 |
|Vija Wildan Gita Prabawa     | 5025211261 |

## <b>1st Problem</b>

Bocchi hendak melakukan University Admission Test di Jepang. Bocchi ingin masuk ke universitas yang bagus. Akan tetapi, dia masih bingung sehingga ia memerlukan beberapa strategi untuk melakukan hal tersebut. Untung saja Bocchi menemukan file .csv yang berisi ranking universitas dunia untuk melakukan penataan strategi.

### Starter

We'll add the csv file directory so we can initialize it later for efficiency purposes

```sh
CSV="2023 QS World University Rankings.csv"
TOP5Japan=$(awk -F"," '/Japan/ {print $2}' "$CSV" | head -n 5)
```

#### Explanation

- ``CSV`` is used to simplify the directory of the .csv so that we can call it with the command ``"$CSV"`` .
- ``TOP5Japan`` is used to simplify the command of the top 5 ranks in Japan with the call ``"$TOP5Japan"``.
- ``awk`` is a program that can be used to retrieve certain records/records in a file and perform one/several operations on them.
- ``-F","`` is used to set the field separator to comma (,).
- ``/Japan/`` searches for lines that contain the string "Japan".
- ``{print $2}`` prints the second field (because of <b>$2</b> in this case is the university name) of the lines that contain "Japan".
- ``head -n 5`` is for printing the first 5 lines of the output.

### A

Bocchi ingin masuk ke universitas yang bagus di Jepang. Oleh karena itu, Bocchi perlu melakukan survey terlebih dahulu. Tampilkan 5 Universitas dengan ranking tertinggi di Jepang.

## Answer

```sh
echo "Top 5 University in Japan:"
echo "$TOP5Japan"
echo ""
```

#### Explanation

- ``echo`` prints the requested line of codes in this case, it's ``"Top 5 University in Japan:"``.
- ``"$TOP5Japan"`` calls the previously wroten code on the initialization of codes in this case the top 5 ranks in Japan.
- ``echo ""`` prints a break or an empty line of code.

### B 

Karena Bocchi kurang percaya diri, coba cari Faculty Student Score(fsr score) yang paling rendah diantara 5 Universitas di Jepang.

## Answer (revision)

```sh
echo "Lowest Faculty Student Score (FSR):"
awk '/Japan/' "$CSV" | sort -t, -k9n | cut -d',' -f2 | tail -n 5
echo""
```

#### Explanation

- ``echo`` prints the requested line of codes in this case, it's ``"Lowest Faculty Student Score (FSR):"``.
- ``awk`` is a program that can be used to retrieve certain records/records in a file and perform one/several operations on them.
- ``/Japan/`` searches for lines that contain the string "Japan".
- ``"$CSV"`` calls the previously wroten code on the initialization of codes in this case the .csv file.
- ``sort -t, -k9n`` sorts the filtered lines based on the 9th column (FSR) in numerical value then using ``,`` as the field delimiter in ``-t``.
- ``cut -d',' -f2`` used to extract the 2nd column (university name) from each line using ``,`` as the delimiter.
- ``tail -n 5`` selects the last 5 line (in this case, the university with the lowest FSR score) from the output.
- ``echo ""`` prints a break or an empty line of code.

### C

Karena Bocchi takut salah membaca ketika memasukkan nama universitas, cari 10 Universitas di Jepang dengan Employment Outcome Rank(ger rank) paling tinggi.

## Answer (revision)

```sh
echo "Highest Employment Outcome Rank (GER):"
awk '/Japan/' "$CSV" | sort -t, -k20n | cut -d',' -f2 | tail -n 10
echo""
```

#### Explanation

- ``echo`` prints the requested line of codes in this case, it's ``"Highest Employment Outcome Rank (GER):"``.
- ``/Japan/`` searches for lines that contain the string "Japan".
- ``"$CSV"`` calls the previously wroten code on the initialization of codes in this case the .csv file.
- ``sort -t, -k20n`` sorts the filtered lines based on the 20th column (University GER Rank) in numerical value and using ``,`` as the field delimiter in ``-t``.
- ``cut -d',' -f2`` used to extract the 2nd column (university name) from each line using ``,`` as the delimiter.
- ``tail -n 10`` selects the last line (in this case, the university with the lowest FSR score) from the output.
- ``echo ""`` prints a break or an empty line of code.

### D

Bocchi ngefans berat dengan universitas <b>paling keren</b> di dunia. Bantu bocchi mencari universitas tersebut dengan kata kunci keren.

## Answer

```sh
echo "The Coolest (keren) University in the world!:"
awk '/Keren/' "$CSV" | cut -d',' -f2
echo""
```

#### Explanation

- ``echo`` prints the requested line of codes in this case, it's ``"The Coolest (keren) University in the world!:"``.
- ``/Keren/`` searches for lines that contain the string "Keren".
- ``"$CSV"`` calls the previously wroten code on the initialization of codes in this case the .csv file.
- ``cut -d',' -f2`` used to extract the 2nd column (university name) from each line using ``,`` as the delimiter.
- ``echo ""`` prints a break or an empty line of code.


## <b>2nd Problem</b>

Kobeni ingin pergi ke negara terbaik di dunia bernama Indonesia. Akan tetapi karena uang Kobeni habis untuk beli headphone ATH-R70x, Kobeni tidak dapat melakukan hal tersebut. 

### A

Untuk melakukan coping, Kobeni mencoba menghibur diri sendiri dengan mendownload gambar tentang Indonesia. Coba buat script untuk mendownload gambar sebanyak X kali dengan X sebagai jam sekarang (ex: pukul 16:09 maka X nya adalah 16 dst.

### B

Karena Kobeni uangnya habis untuk reparasi mobil, ia harus berhemat tempat penyimpanan di komputernya. Kobeni harus melakukan zip setiap 1 hari dengan nama zip “devil_NOMOR ZIP” dengan NOMOR.ZIP adalah urutan folder saat dibuat (devil_1, devil_2, dst).

### Starter

We gonna make a new .sh file called kobeni_liburan.sh for this Problem

## Answer

```sh

#!/bin/bash

# Constants
IMAGE_URL="https://blog.tripcetera.com/id/wp-content/uploads/2019/04/borobudur.jpg"
SLEEP_TIME="10h"

# Variables
day_now=$(date +"%d")
startfolder=1
finalfolder=1

# Main loop
while true
do
  # Get current hour
  hour=$(date +"%H")
  if [ "$hour" = "00" ]
  then 
    hour=1
  fi
  
  # Create new folder if needed
  folder_name="kumpulan_$finalfolder"
  if [ ! -d "$folder_name" ]
  then
    mkdir "$folder_name"
    num=1
    while [ $num -le $hour ]
    do
      wget -O "$folder_name/perjalanan_$num.jpg" "$IMAGE_URL"
      num=$((num+1))
    done
  fi
  
  # Zip folders if a new day has started
  current_day=$(date +"%d")
  if [ "$current_day" -ne "$day_now" ]
  then
    for ((num=startfolder; num<=finalfolder; num=num+1))
    do
      zip -r "devil_$num.zip" "kumpulan_$num"
    done
    startfolder=$((finalfolder+1))
    day_now=$current_day
  fi
  
  finalfolder=$((finalfolder+1))
  
  # Wait for the specified time
  sleep "$SLEEP_TIME"
done


```

#### Explanation

- Set the URL and sleep time (in hours) as constants by using `IMAGE_URL` and `SLEEP_TIME`.
- Initialize variables for the `day_now`, the `startfolder` number, and the `finalfolder` number.
- Enters an infinite loop.
- Get the current `hour` and set it as the variable hour. If the hour is 00, set it as 1 instead.
- 
- Creates a new directory with the name `kumpulan_$finalfolder`.
- Initializes num variable to 1.
- Downloads images from the source `IMAGE_URL` using the `wget` command and saves them to the `kumpulan_$finalfolder` directory with the name `perjalanan_$num.jpg`, where num is the image number.
- `current_day=$(date +"%d")` Get the current day using the date command and save it to the variable current_day
- If the `currentday` is not the same as the `day_now`, the script creates a zip file with the name `devil_$num.zip` for each folder from `startfolder` to `finalfolder` using the `zip` command and the `-r` option. The zip file contains all files and subdirectories in the folder.
- Sets `startfolder` to `finalfolder` plus 1 and sets `day_now` to `currentday`.
- Increments lastfolder by 1.
- Waits for 10 hours using the `sleep` command.

## <b>3rd Problem</b>

Peter Griffin hendak membuat suatu sistem register pada script louis.sh dari setiap user yang berhasil didaftarkan di dalam file /users/users.txt. Peter Griffin juga membuat sistem login yang dibuat di script retep.sh

Untuk memastikan password pada register dan login aman, maka ketika proses input passwordnya harus memiliki ketentuan berikut
- Minimal 8 karakter
- Memiliki minimal 1 huruf kapital dan 1 huruf kecil
- Alphanumeric
- Tidak boleh sama dengan username 
- Tidak boleh menggunakan kata chicken atau ernie

Setiap percobaan login dan register akan tercatat pada log.txt dengan format : YY/MM/DD hh:mm:ss MESSAGE. Message pada log akan berbeda tergantung aksi yang dilakukan user.
- Ketika mencoba register dengan username yang sudah terdaftar, maka message pada log adalah REGISTER: ERROR User already exists
- Ketika percobaan register berhasil, maka message pada log adalah REGISTER: INFO User USERNAME registered successfully
- Ketika user mencoba login namun passwordnya salah, maka message pada log adalah LOGIN: ERROR Failed login attempt on user USERNAME
- Ketika user berhasil login, maka message pada log adalah LOGIN: INFO User USERNAME logged in

### Starter

We gonna make 2 .sh file, it is louis.sh to input a new account and retep.sh for the login part

## Answer (revision)

### louis.sh 

```sh
#!/bin/bash

mkdir -p /users

touch /users/users.txt

read -p "Enter username: " username

if grep -q "^$username:" /users/users.txt; then
  echo "$(date +"%Y/%m/%d %H:%M:%S") REGISTER: ERROR User already exists" >> log.txt
  echo "Error: User already exists"
  exit 1
fi

# Input password with conditions
while true; do
  read -s -p "Enter password (minimum 8 characters, at least 1 uppercase, 1 lowercase, alphanumeric, not chicken or ernie): " password
  if [[ ${#password} -ge 8 ]] && [[ "$password" =~ [A-Z] ]] && [[ "$password" =~ [a-z] ]] && [[ "$password" =~ ^[[:alnum:]]+$ ]] && [[ "$password" != "$username" ]] && [[ "$password" != "chicken" ]] && [[ "$password" != "ernie" ]]; then
    break
  fi
  echo "Error: Password must be at least 8 characters, contain at least 1 uppercase letter, 1 lowercase letter, alphanumeric characters only, and not chicken or ernie."
done

echo "$username:$(echo "$password" | sha256sum | cut -d ' ' -f 1)" >> /users/users.txt

echo "$(date +"%Y/%m/%d %H:%M:%S") REGISTER: INFO User $username registered successfully" >> log.txt
echo "User $username registered successfully"
```
#### Explanation

- `` mkdir -p /users `` Create directory for users.txt.
- `` touch /users/users.txt `` Create users.txt if it does not exist.
- `` read -p "Enter username: " username `` Input username.
- `` if grep -q "^$username:" /users/users.txt; then `` Check if username already exists in users.txt.
- `` echo "$(date +"%Y/%m/%d %H:%M:%S") REGISTER: ERROR User already exists" >> log.txt echo "Error: User already exists" `` If username already exists, log error message and exit
- `` echo "$username:$(echo "$password" | sha256sum | cut -d ' ' -f 1)" >> /users/users.txt `` Add username and hashed password to users.txt.
- `` echo "$(date +"%Y/%m/%d %H:%M:%S") REGISTER: INFO User $username registered successfully" >> log.txt echo "User $username registered successfully" `` Log successful registration

### retep.sh

```sh
#!/bin/bash

read -p "Enter username: " username

# Check if username exists in users.txt
if ! grep -q "^$username:" /users/users.txt; then
  # If username does not exist, log error message and exit
  echo "$(date +"%Y/%m/%d %H:%M:%S") LOGIN: ERROR Failed login attempt on user $username" >> log.txt
  echo "Error: Invalid username or password"
  exit 1
fi

# Input password
read -s -p "Enter password: " password
echo

hashed_password=$(grep "^$username:" /users/users.txt | cut -d ':' -f 2)
if [[ $(echo "$password" | sha256sum | cut -d ' ' -f 1) == "$hashed_password" ]]; then
  echo "$(date +"%Y/%m/%d %H:%M:%S") LOGIN: INFO User $username logged in" >> log.txt
  echo "Welcome, $username!"
else
  echo "$(date +"%Y/%m/%d %H:%M:%S") LOGIN: ERROR Failed login attempt on user $username" >> log.txt
  echo "Error: Invalid username or password"
  exit 1
fi
```
#### Explanation

This Explanation will only Explain the new code that aren't available on the louis.sh, only available in retep.sh.

- `` hashed_password=$(grep "^$username:" /users/users.txt | cut -d ':' -f 2) if [[ $(echo "$password" | sha256sum | cut -d ' ' -f 1) == "$hashed_password" ]]; then `` this line on the file are used to check if the inputed username and password are already existed in the users.txt.
- `` echo "$(date +"%Y/%m/%d %H:%M:%S") LOGIN: INFO User $username logged in" >> log.txt echo "Welcome, $username!" `` this code is used print the word " welcome, (username)" if the username and the password that are inputed is correct.
- `` echo "$(date +"%Y/%m/%d %H:%M:%S") LOGIN: ERROR Failed login attempt on user $username" >> log.txt echo "Error: Invalid username or password" `` If password or the username is incorrect, log error message and exit.
 

## <b>4th Problem</b>

Johan Liebert adalah orang yang sangat kalkulatif. Oleh karena itu ia
mengharuskan dirinya untuk mencatat log system komputernya. File syslog
tersebut harus memiliki ketentuan :
- Backup file log system dengan format jam:menit tanggal:bulan:tahun
(dalam format .txt).
- Isi file harus dienkripsi dengan string manipulation yang disesuaikan
dengan jam dilakukannya backup seperti berikut:
- Menggunakan sistem cipher dengan contoh seperti berikut. Huruf
b adalah alfabet kedua, sedangkan saat ini waktu menunjukkan
pukul 12, sehingga huruf b diganti dengan huruf alfabet yang
memiliki urutan ke 12+2 = 14
- Hasilnya huruf b menjadi huruf n karena huruf n adalah huruf ke
empat belas, dan seterusnya.
- Setelah huruf z akan kembali ke huruf a
- Buat juga script untuk dekripsinya.
- Backup file syslog setiap 2 jam untuk dikumpulkan

### Starter
We will make log_encrypt.sh and log_decrypt.sh for the problem

### log_encrypt.sh

```sh
#!/bin/bash

current_hour=$(date "+%H")
current_date=$(date "+%H:%M %d:%m:%Y")

backup_dir="/home/wildan/backup/encrypt"
backup_filename="${backup_dir}/${current_date}.txt"

mkdir -p "${backup_dir}"

lowercase_alphabet="abcdefghijklmnopqrstuvwxyz"
uppercase_alphabet="ABCDEFGHIJKLMNOPQRSTUVWXYZ"

lowercase_shifted="${lowercase_alphabet:${current_hour}}${lowercase_alphabet:0:${current_hour}}"
uppercase_shifted="${uppercase_alphabet:${current_hour}}${uppercase_alphabet:0:${current_hour}}"

full_alphabet="${lowercase_alphabet}${uppercase_alphabet}"
shifted_alphabet="${lowercase_shifted}${uppercase_shifted}"

tr "${full_alphabet}" "${shifted_alphabet}" < /var/log/syslog > "${backup_filename}"
```

### Explanation

- Set a variable called ``current_hour`` to the current hour of the day, in 24-hour format, using the date command with the ``+%H`` option.
- Set a variable called ``current_date``to the current date and time, in the format `"HH:MM DD:MM:YYYY"`, using the date command with the ``+%H:%M %d:%m:%Y`` option.
- Set a variable called ``backup_dir`` to the directory where backups will be stored.
- Set a variable called ``backup_filename`` to the full path of the backup file, using the ``backup_dir`` and ``current_date variables``.
- Create the backup directory if it doesn't already exist, using the ``mkdir -p`` option to create intermediate directories if necessary.
- Set variables ``lowercase_alphabet`` and ``uppercase_alphabet`` to contain the 26 letters of the English alphabet in lowercase and uppercase.
- Set variables ``lowercase_shifted`` and ``uppercase_shifted`` to contain the lowercase and uppercase alphabets, respectively, shifted by the number of hours specified in current_hour. The ``${var:offset:length}`` syntax is used to take a substring of the original alphabet, with the offset parameter indicating the number of characters to skip from the beginning of the string and the length parameter indicating the number of characters to include.
- Join the lowercase and uppercase shifted alphabets to create a new variable called ``shifted_alphabet``. 
- Create the lowercase and uppercase original alphabets to form a new variable called ``full_alphabet``.
- Use the ``tr`` command to perform a character-by-character translation of the contents of ``/var/log/syslog``, using the original ``full_alphabet`` as the input set and the ``shifted_alphabet`` as the output set. The resulting translated text is written to the ``backup_filename`` file.

### log_decrypt.sh

```sh
#!/bin/bash

decrypt_file() {
  encrypted_filepath="$1"
  decrypted_filepath="$2"
  current_hour=$(date "+%H")
  lowercase_alphabet=$(echo -e 'abcdefghijklmnopqrstuvwxyzabcdefghijklmnopqrstuvwxyz')
  uppercase_alphabet=$(echo -e 'ABCDEFGHIJKLMNOPQRSTUVWXYZABCDEFGHIJKLMNOPQRSTUVWXYZ')
  cat "${encrypted_filepath}" | tr "${lowercase_alphabet:${current_hour}:26}${uppercase_alphabet:${current_hour}:26}" "${lowercase_alphabet:0:26}${uppercase_alphabet:0:26}" > "${decrypted_filepath}"
}

encrypted_dir="/home/wildan/backup/encrypt"
decrypted_dir="/home/wildan/backup/decrypt"

latest_encrypted_file=$(ls -t "${encrypted_dir}" | head -n 1)
encrypted_filepath="${encrypted_dir}/${latest_encrypted_file}"
decrypted_filepath="${decrypted_dir}/${latest_encrypted_file}"

if [ -f "${encrypted_filepath}" ]; then
  mkdir -p "${decrypted_dir}"
  decrypt_file "${encrypted_filepath}" "${decrypted_filepath}"
fi
```

### Explanation

- Define a function called ``decrypt_file`` that takes two arguments: the path to an encrypted file and the path where the decrypted file should be saved.
- Within the function, set variables ``encrypted_filepath`` and ``decrypted_filepath`` to the function's first and second arguments, respectively.
- Set a variable called ``current_hour`` to the current hour of the day, in 24-hour format, using the date command with the ``+%H`` option.
- Set variables ``lowercase_alphabet`` and ``uppercase_alphabet`` to contain the 26 letters of the English alphabet in lowercase and uppercase, respectively. The ``echo -e`` command is used with two concatenated copies of the alphabet to create a string that wraps around to the beginning of the alphabet after the letter "z" or "Z".
- Use the `cat` command to read the contents of the ``encrypted_filepath`` file, and then use the ``tr`` command to perform a character-by-character translation of the contents. The input set for the translation is a substring of the ``lowercase_alphabet`` and ``uppercase_alphabet`` variables that starts at the index specified by ``current_hour`` and has a length of 26. The output set is a substring of the ``lowercase_alphabet`` and ``uppercase_alphabet`` variables that starts at index 0 and has a length of 26. The resulting translated text is written to the ``decrypted_filepath`` file.
- Set variables ``encrypted_dir`` and ``decrypted_dir`` to the directories where encrypted and decrypted files should be stored, respectively.
- Set a variable called ``latest_encrypted_file`` to the filename of the most recently modified file in the ``encrypted_dir`` directory, using the ls -t command to sort the files by modification time in descending order and the ``head -n 1`` command to select the first (i.e., most recent) filename.
- Set variables ``encrypted_filepath`` and ``decrypted_filepath`` to the full paths of the latest encrypted and decrypted files, respectively.
- Check if the latest encrypted file exists using the ``[ -f "${encrypted_filepath}" ]`` test. If it does exist, create the ``decrypted_dir`` directory if it doesn't already exist using the ``mkdir -p`` command, and then call the ``decrypt_file`` function with the appropriate arguments.
