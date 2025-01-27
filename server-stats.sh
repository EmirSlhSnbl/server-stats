#!/bin/bash

# Betiğin root olarak çalışıp çalışmadığını kontrol et
if [[ $EUID -ne 0 ]]; then
    echo "Bu betiği çalıştırmak için root yetkilerine sahip olmalısınız."
    exit 1
fi

# CPU kullanımını hesapla
echo -e "\n### Toplam CPU Kullanımı ###"
top -bn1 | grep "Cpu(s)" | \
sed "s/.*, *\([0-9.]*\)%* id.*/\1/" | \
awk '{print "Kullanım: " 100 - $1 "%"}'

# Toplam bellek kullanımını göster (Free vs Used ve yüzdesi)
echo -e "\n### Toplam Bellek Kullanımı ###"
free -h | awk 'NR==2{print "Kullanılan Bellek: " $3 " / " $2 " (" $3/$2*100 "%)" "\nBoş Bellek: " $4}'

# Toplam disk kullanımını göster (Free vs Used ve yüzdesi)
echo -e "\n### Toplam Disk Kullanımı ###"
df -h | awk '$NF=="/"{print "Kullanılan Disk: " $3 " / " $2 " (" $5 ")"}'

# CPU kullanımı açısından ilk 5 işlemi göster
echo -e "\n### CPU Kullanımına Göre İlk 5 İşlem ###"
ps aux --sort=-%cpu | awk 'NR<=6{print $1, $3, $11}' 

# Bellek kullanımı açısından ilk 5 işlemi göster
echo -e "\n### Bellek Kullanımına Göre İlk 5 İşlem ###"
ps aux --sort=-%mem | awk 'NR<=6{print $1, $4, $11}'

# Opsiyonel: OS versiyon bilgisi
echo -e "\n### İşletim Sistemi Versiyonu ###"
cat /etc/os-release | grep 'PRETTY_NAME'

# Opsiyonel: Uptime (süresi)
echo -e "\n### Sunucu Uptime ###"
uptime

# Opsiyonel: Load average
echo -e "\n### Load Average ###"
uptime | awk -F'load average:' '{ print $2 }'

# Opsiyonel: Giriş yapan kullanıcılar
echo -e "\n### Giriş Yapan Kullanıcılar ###"
who

# Opsiyonel: Başarısız giriş denemeleri
echo -e "\n### Başarısız Giriş Denemeleri ###"
grep "Failed password" /var/log/auth.log | wc -l
