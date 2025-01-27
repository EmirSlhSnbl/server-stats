# Server Stats Script
https://roadmap.sh/projects/server-stats
Bu proje, Linux sunucularının performansını izlemek için yazılmış bir bash betiğidir. `server-stats.sh` betiği, sunucudaki temel sistem kaynaklarının kullanım durumunu analiz eder ve raporlar. Bu raporlar, CPU kullanımı, bellek kullanımı, disk kullanımı ve en fazla kaynak tüketen işlemler gibi bilgileri içerir.

## Özellikler

- **Toplam CPU Kullanımı**: Sunucudaki toplam CPU kullanımını gösterir.
- **Toplam Bellek Kullanımı**: Kullanılan ve boş belleği, yüzde olarak toplam bellek kullanımı ile birlikte raporlar.
- **Toplam Disk Kullanımı**: Kullanılan ve boş disk alanını, yüzde olarak raporlar.
- **Top 5 İşlem (CPU Kullanımına Göre)**: CPU kullanımına göre en fazla kaynak tüketen 5 işlemi listeler.
- **Top 5 İşlem (Bellek Kullanımına Göre)**: Bellek kullanımına göre en fazla kaynak tüketen 5 işlemi listeler.
- **İşletim Sistemi Bilgisi**: Sunucunun işletim sistemi versiyonunu gösterir.
- **Sunucu Uptime ve Load Average**: Sunucunun ne kadar süredir çalıştığını ve yük ortalamalarını gösterir.
- **Giriş Yapan Kullanıcılar**: Sunucuya giriş yapan kullanıcıları listeler.
- **Başarısız Giriş Denemeleri**: Başarısız giriş denemelerini gösterir.

## Kurulum ve Kullanım

### Gereksinimler

- Linux tabanlı bir işletim sistemi (Ubuntu önerilir)
- `bash` terminali
- `cron` (otomatik zamanlama için)

### Betiği Çalıştırmak

1. **Betiği İndir**:
   Projeyi GitHub'dan klonlayın:
   ```bash
   git clone https://github.com/EmirSlhSnbl/server-stats.git
   cd server-stats
 2. **Betiği Çalıştır**:
    ```bash
    sudo ./server-stats.sh

### Cron ile Otomatik Çalıştırma
   ```cron
  0 */3 * * * /path/to/your/server-stats.sh >> /path/to/logfile.log 2>&1



