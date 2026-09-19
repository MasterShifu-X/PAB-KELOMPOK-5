## 🎯 Aplikasi Self-Improvement / Motivasi

**1. Splash Screen**
- Logo + tagline motivasi singkat

**2-3. Onboarding (2 halaman)**
- Slide 1: "Bangun kebiasaan baik setiap hari"
- Slide 2: "Pantau progress dirimu"

**4. Login**
- Sama seperti pola di atas

**5. Register**
- Sama seperti pola di atas

**6. Home (Dashboard)**
- Greeting ("Selamat pagi, Lyz!")
- Quote motivasi hari ini (Card statis)
- List habit/kebiasaan hari ini (checklist visual, tapi checkbox-nya statis nggak perlu nyimpen status)
- Widget: `ListView.builder`, `Card`, `Checkbox` (value hardcode true/false per item)

**7. Detail Habit**
- Nama habit, deskripsi, target (misal "Baca buku 30 menit")
- Statistik dummy (misal streak "5 hari berturut-turut")
- Widget: `Column`, `Text`, `LinearProgressIndicator` (value statis)

**8. Halaman Statistik/Progress**
- Grafik progress mingguan (bisa pakai bar chart sederhana dari `Container` dengan tinggi berbeda-beda, nggak perlu package chart kalau mau simpel)
- Widget: `Row` of `Container` dengan height berbeda untuk simulasi bar chart

**9. Kumpulan Quote/Artikel Motivasi**
- List artikel/quote (List<Map> statis)
- Tap → Detail Quote (halaman baru dengan quote lebih besar + gambar background)
- Widget: `ListView.builder`, `Card`

**10. Profil**
- Foto, nama, total habit yang diikuti (angka statis)
- Menu: "Pengaturan", "Tentang Aplikasi", "Logout"