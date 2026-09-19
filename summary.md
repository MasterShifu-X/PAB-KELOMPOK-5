# 📱 Spesifikasi & Panduan: Home (Dashboard) & Detail Habit

Dokumen ini adalah acuan rancangan dan kebutuhan teknis untuk pembuatan layar **Home (Dashboard)** dan **Detail Habit** menggunakan framework **Flutter** dan bahasa pemrograman **Dart**. 

Dirancang khusus dengan pendekatan ramah pemula: **hanya menggunakan `StatelessWidget`**, data statis (hardcoded), dan struktur logika yang tidak rumit.

---

## 🎯 1. Batasan & Ketentuan Teknis (Rules)

1. **Bahasa Pemrograman**: Dart (Flutter Framework).
2. **Widget Type**: 100% **`StatelessWidget`**.
   * Tidak ada `StatefulWidget`.
   * Tidak ada state management rumit (tidak perlu Provider, Bloc, atau `setState`).
3. **Sifat Data**: Statis (Dummy / Hardcoded).
   * Nilai checkbox, teks streak, dan progress bar diisi manual via data model list.
   * Interaksi klik pada checkbox tidak perlu mengubah tanda centang (cukup visual bawaan statis).
4. **Prinsip Tampilan Pemula**:
   * Layout tersusun rapi menggunakan hierarki widget dasar (`Column`, `Row`, `Card`, `Container`).
   * Menggunakan scroll bawaan (`SingleChildScrollView`) agar tampilan tidak *overflow* di layar kecil.

---

## 🧭 2. Konsep Dasar Dart & Flutter untuk Pemula

Sebelum mulai menyusun antarmuka, ada 3 konsep utama yang perlu dipahami:

* **Widget Tree (Hierarki Pohon)**: Setiap elemen visual di Flutter tersusun berjenjang (parent & child). Layar dibungkus `Scaffold` $\rightarrow$ konten utama disusun vertikal dengan `Column` $\rightarrow$ item baris horizontal diatur dengan `Row`.
* **StatelessWidget**: Tampilan murni yang hanya menerima data dan menampilkannya sekali tanpa mengubah status dirinya sendiri saat runtime.
* **Struktur Data List & Map**: Daftar kebiasaan disimpan dalam variabel koleksi berbentuk daftar pasangan kunci-nilai (`List<Map<String, dynamic>>`), sehingga mudah diiterasi oleh list widget.

---

## 📋 3. Rincian Layar 6: Home (Dashboard)

### A. Tujuan Layar
Menjadi beranda utama tempat pengguna melihat sambutan personal, mendapatkan motivasi instan dari kutipan harian, serta meninjau daftar kebiasaan yang harus dilakukan hari ini.

### B. Komponen & Susunan UI
1. **Top Bar (`AppBar`)**:
   * Menampilkan judul halaman, misalnya *"Dashboard Habit"*.
   * Warna tema konsisten (contoh: Indigo/Biru).
2. **Bagian Sambutan (Greeting Header)**:
   * Teks sapaan nama pengguna (contoh: *"Selamat pagi, Lyz!"*).
   * Subtitle teks penyemangat harian (contoh: *"Yuk lanjutkan langkah kecilmu hari ini"*).
3. **Card Quote Motivasi Harian**:
   * Wadah berupa `Card` dengan aksen latar kontras lembut.
   * Ikon lampu motivasi (`Icons.lightbulb`).
   * Teks judul kecil *"Quote Hari Ini"* dan isi kutipan inspiratif bertuliskan miring (*italic*).
4. **Header Section Kebiasaan**:
   * Teks judul section dengan gaya tebal (*bold*), misalnya *"Kebiasaan Hari Ini"*.
5. **Daftar Kebiasaan (`ListView.builder`)**:
   * Merender kumpulan data habit secara vertikal.
   * Masing-masing item dibungkus dalam `Card` dengan susunan `ListTile`:
     * **Leading (Kiri)**: Ikon visual atau avatar penanda aktivitas.
     * **Title**: Nama habit (contoh: *"Membaca Buku"*).
     * **Subtitle**: Target kebiasaan (contoh: *"Target: 30 Menit"*).
     * **Trailing (Kanan)**: Widget `Checkbox` dengan status `value` bernilai statis (`true` atau `false`).
6. **Alur Interaksi (Navigasi)**:
   * Properti `onTap` pada kartu habit memicu perpindahan layar ke **Detail Habit** dengan membawa (passing) parameter data habit yang diklik.

### C. Kebutuhan Widget
* `Scaffold`
* `AppBar`
* `SingleChildScrollView` & `Padding`
* `Column` & `Row`
* `Text` & `TextStyle`
* `Card` & `ListTile`
* `Icon` & `CircleAvatar`
* `Checkbox`
* `ListView.builder`

---

## 🔍 4. Rincian Layar 7: Detail Habit

### A. Tujuan Layar
Menampilkan informasi mendalam mengenai satu habit spesifik yang dipilih pengguna dari Dashboard, termasuk deskripsi, target spesifik, dan indikator perkembangan berkala.

### B. Komponen & Susunan UI
1. **Top Bar (`AppBar`)**:
   * Judul halaman (contoh: *"Detail Kebiasaan"*).
   * Tombol panah kembali (*back button*) otomatis untuk kembali ke Dashboard.
2. **Header Detail Habit**:
   * Judul nama habit berukuran besar dan tebal.
   * Paragraf deskripsi penjelasan tujuan habit secara detail.
3. **Card Target Aktivitas**:
   * `Card` ringkas yang menampilkan ikon target sasaran (`Icons.track_changes`).
   * Label deskripsi target serta target durasi/frekuensi (contoh: *"Target: Baca buku 30 menit setiap hari"*).
4. **Card Statistik & Indikator Progress**:
   * Teks rekor konsistensi / *streak dummy* dengan aksen warna menarik (contoh: *"🔥 5 Hari Berturut-turut"*).
   * Batang kemajuan visual menggunakan `LinearProgressIndicator`:
     * Nilai statis desimal antara $0.0$ sampai $1.0$ (contoh: $0.7$ mewakili 70%).
   * Teks persentase penyelesaian statis di bawah progress bar (contoh: *"70% Selesai"*).

### C. Kebutuhan Widget
* `Scaffold`
* `AppBar`
* `SingleChildScrollView` & `Padding`
* `Column` & `Row`
* `Text` & `TextStyle`
* `Card`
* `Icon`
* `LinearProgressIndicator`
* `ClipRRect` (untuk membuat sudut indikator membulat)

---

## 🗂️ 5. Rancangan Struktur Data Statis

Data yang dikirimkan antarlayar cukup menggunakan tipe data standar `Map<String, dynamic>` dengan atribut-atribut berikut:

| Kunci (*Key*) | Tipe Data | Keterangan | Contoh Nilai |
| :--- | :--- | :--- | :--- |
| `title` | `String` | Nama kegiatan habit | `"Membaca Buku"` |
| `subtitle` | `String` | Ringkasan target habit | `"Target: 30 Menit"` |
| `description` | `String` | Uraian lengkap habit | `"Membaca minimal 1 bab per hari"` |
| `isDone` | `bool` | Status checklist statis | `true` atau `false` |
| `streak` | `String` | Rekor konsistensi dummy | `"5 Hari Berturut-turut"` |
| `progress` | `double` | Persentase visual progress | `0.7` (ekuivalen 70%) |