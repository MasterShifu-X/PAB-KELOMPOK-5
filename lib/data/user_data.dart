// ============================================================
// Data Pengguna (User Repository) Statis di Memori
// Menyimpan akun terdaftar dan memverifikasi login secara KETAT (STRICT)
// ============================================================
class UserData {
  // Nama pengguna aktif yang saat ini login
  static String activeUserName = 'Lyz';

  // Database Akun Terdaftar (DB Statis di Memori)
  static final List<Map<String, String>> _users = [
    {
      'name': 'Lyz',
      'email': 'lyz@example.com',
      'password': 'password123',
    },
    {
      'name': 'Farhan',
      'email': 'farhan@example.com',
      'password': 'password123',
    },
  ];

  /// Menambahkan akun pengguna baru ke DB saat registrasi
  static bool registerUser({
    required String name,
    required String email,
    required String password,
  }) {
    final cleanEmail = email.trim().toLowerCase();
    final cleanName = name.trim().isEmpty ? 'Pengguna' : name.trim();

    final index = _users.indexWhere((u) => u['email'] == cleanEmail);
    if (index != -1) {
      // Update akun jika email sudah pernah terdaftar
      _users[index] = {
        'name': cleanName,
        'email': cleanEmail,
        'password': password,
      };
    } else {
      // Simpan akun baru ke database
      _users.add({
        'name': cleanName,
        'email': cleanEmail,
        'password': password,
      });
    }

    activeUserName = cleanName;
    return true;
  }

  /// Memverifikasi email & password secara KETAT saat Login
  /// Hanya mengembalikan data user jika EMAIL DAN PASSWORD COCOK dengan DB.
  static Map<String, String>? loginUser({
    required String email,
    required String password,
  }) {
    final cleanEmail = email.trim().toLowerCase();
    final cleanPassword = password;

    if (cleanEmail.isEmpty || cleanPassword.isEmpty) {
      return null;
    }

    // STRICT MATCH: Cek apakah email dan password ada & cocok di DB
    for (var u in _users) {
      if (u['email'] == cleanEmail && u['password'] == cleanPassword) {
        activeUserName = u['name'] ?? 'Pengguna';
        return u; // Login Sukses
      }
    }

    // Jika tidak ditemukan di DB atau password salah, kembalikan NULL (Login Gagal)
    return null;
  }
}
