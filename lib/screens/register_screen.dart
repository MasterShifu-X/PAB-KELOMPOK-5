import 'package:flutter/material.dart';

import '../data/user_data.dart';
import 'login_screen.dart';

// ============================================================
// Layar 5: Register — StatelessWidget (100% Stateless)
// Controller & ValueNotifier dideklarasikan sebagai atribut kelas
// agar state tidak ter-reset saat widget di-rebuild.
// ============================================================
class RegisterScreen extends StatelessWidget {
  RegisterScreen({super.key});

  // Controller & Notifier di luar method build()
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController = TextEditingController();

  final ValueNotifier<bool> obscurePasswordNotifier = ValueNotifier<bool>(true);
  final ValueNotifier<bool> obscureConfirmNotifier = ValueNotifier<bool>(true);
  final ValueNotifier<bool> agreeTermsNotifier = ValueNotifier<bool>(true);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F7FF), // Background indigo sangat muda
      appBar: AppBar(
        title: const Text('Registrasi'),
        backgroundColor: Colors.indigo,
        foregroundColor: Colors.white,
        elevation: 0,
      ),
      body: SafeArea(
        child: LayoutBuilder(
          builder: (context, constraints) {
            return SingleChildScrollView(
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 24),
              child: Center(
                child: ConstrainedBox(
                  constraints: const BoxConstraints(maxWidth: 480), // Responsif Desktop
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      const SizedBox(height: 8),

                      // --- Header Logo / Ilustrasi ---
                      Center(
                        child: Container(
                          width: 84,
                          height: 84,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: Colors.indigo.shade50,
                            border: Border.all(
                              color: Colors.indigo.shade100,
                              width: 2,
                            ),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.indigo.withValues(alpha: 0.1),
                                blurRadius: 16,
                                offset: const Offset(0, 6),
                              ),
                            ],
                          ),
                          child: Icon(
                            Icons.person_add_alt_1_rounded,
                            size: 40,
                            color: Colors.indigo.shade700,
                          ),
                        ),
                      ),
                      const SizedBox(height: 16),

                      // --- Judul & Subjudul ---
                      const Text(
                        'Buat Akun Baru',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFF1A237E),
                        ),
                      ),
                      const SizedBox(height: 8),
                      const Text(
                        'Mulai perjalanan self-improvement kamu bersama kami hari ini',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 14,
                          color: Colors.grey,
                          height: 1.4,
                        ),
                      ),
                      const SizedBox(height: 24),

                      // --- Form Input Container (Card) ---
                      Card(
                        elevation: 2,
                        shadowColor: Colors.black.withValues(alpha: 0.05),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(16),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(20.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              // Field Nama Lengkap
                              const Text(
                                'Nama Lengkap',
                                style: TextStyle(
                                  fontSize: 13,
                                  fontWeight: FontWeight.w600,
                                  color: Colors.black87,
                                ),
                              ),
                              const SizedBox(height: 8),
                              TextField(
                                controller: nameController,
                                decoration: _buildInputDecoration(
                                  hint: 'Masukkan nama lengkap',
                                  icon: Icons.person_outline,
                                ),
                              ),
                              const SizedBox(height: 16),

                              // Field Email
                              const Text(
                                'Alamat Email',
                                style: TextStyle(
                                  fontSize: 13,
                                  fontWeight: FontWeight.w600,
                                  color: Colors.black87,
                                ),
                              ),
                              const SizedBox(height: 8),
                              TextField(
                                controller: emailController,
                                keyboardType: TextInputType.emailAddress,
                                decoration: _buildInputDecoration(
                                  hint: 'nama@email.com',
                                  icon: Icons.email_outlined,
                                ),
                              ),
                              const SizedBox(height: 16),

                              // Field Password (dengan Toggle Mata Coret)
                              const Text(
                                'Password',
                                style: TextStyle(
                                  fontSize: 13,
                                  fontWeight: FontWeight.w600,
                                  color: Colors.black87,
                                ),
                              ),
                              const SizedBox(height: 8),
                              ValueListenableBuilder<bool>(
                                valueListenable: obscurePasswordNotifier,
                                builder: (context, isObscured, child) {
                                  return TextField(
                                    controller: passwordController,
                                    obscureText: isObscured,
                                    decoration: _buildInputDecoration(
                                      hint: 'Minimal 8 karakter',
                                      icon: Icons.lock_outlined,
                                      suffixWidget: IconButton(
                                        icon: Icon(
                                          isObscured
                                              ? Icons.visibility_off_outlined
                                              : Icons.visibility_outlined,
                                          color: Colors.grey,
                                        ),
                                        onPressed: () {
                                          obscurePasswordNotifier.value =
                                              !obscurePasswordNotifier.value;
                                        },
                                      ),
                                    ),
                                  );
                                },
                              ),
                              const SizedBox(height: 16),

                              // Field Konfirmasi Password (dengan Toggle Mata Coret)
                              const Text(
                                'Konfirmasi Password',
                                style: TextStyle(
                                  fontSize: 13,
                                  fontWeight: FontWeight.w600,
                                  color: Colors.black87,
                                ),
                              ),
                              const SizedBox(height: 8),
                              ValueListenableBuilder<bool>(
                                valueListenable: obscureConfirmNotifier,
                                builder: (context, isObscured, child) {
                                  return TextField(
                                    controller: confirmPasswordController,
                                    obscureText: isObscured,
                                    decoration: _buildInputDecoration(
                                      hint: 'Ulangi password',
                                      icon: Icons.lock_reset_outlined,
                                      suffixWidget: IconButton(
                                        icon: Icon(
                                          isObscured
                                              ? Icons.visibility_off_outlined
                                              : Icons.visibility_outlined,
                                          color: Colors.grey,
                                        ),
                                        onPressed: () {
                                          obscureConfirmNotifier.value =
                                              !obscureConfirmNotifier.value;
                                        },
                                      ),
                                    ),
                                  );
                                },
                              ),
                              const SizedBox(height: 16),

                              // Checkbox Syarat & Ketentuan Interaktif
                              ValueListenableBuilder<bool>(
                                valueListenable: agreeTermsNotifier,
                                builder: (context, isAgreed, child) {
                                  return InkWell(
                                    onTap: () {
                                      agreeTermsNotifier.value = !isAgreed;
                                    },
                                    borderRadius: BorderRadius.circular(6),
                                    child: Row(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        SizedBox(
                                          height: 24,
                                          width: 24,
                                          child: Checkbox(
                                            value: isAgreed,
                                            onChanged: (val) {
                                              agreeTermsNotifier.value =
                                                  val ?? false;
                                            },
                                            activeColor: Colors.indigo,
                                          ),
                                        ),
                                        const SizedBox(width: 8),
                                        const Expanded(
                                          child: Text(
                                            'Saya menyetujui Syarat & Ketentuan serta Kebijakan Privasi aplikasi.',
                                            style: TextStyle(
                                              fontSize: 12,
                                              color: Colors.black87,
                                              height: 1.4,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  );
                                },
                              ),
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(height: 24),

                      // --- Tombol Daftar Utama (Dengan Validasi & Simpan User) ---
                      SizedBox(
                        height: 52,
                        child: FilledButton(
                          onPressed: () {
                            final name = nameController.text.trim();
                            final email = emailController.text.trim();
                            final password = passwordController.text;
                            final confirmPassword =
                                confirmPasswordController.text;

                            // 1. Validasi Kolom Kosong
                            if (name.isEmpty ||
                                email.isEmpty ||
                                password.isEmpty ||
                                confirmPassword.isEmpty) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                  content: Text('Harap isi semua kolom formulir!'),
                                  backgroundColor: Colors.orange,
                                ),
                              );
                              return;
                            }

                            // 2. Validasi Password Match
                            if (password != confirmPassword) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                  content: Text(
                                      'Password dan konfirmasi password tidak cocok!'),
                                  backgroundColor: Colors.redAccent,
                                ),
                              );
                              return;
                            }

                            // 3. Validasi Checkbox
                            if (!agreeTermsNotifier.value) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                  content: Text(
                                      'Anda harus menyetujui Syarat & Ketentuan.'),
                                  backgroundColor: Colors.orange,
                                ),
                              );
                              return;
                            }

                            // 4. Simpan ke UserData
                            UserData.registerUser(
                              name: name,
                              email: email,
                              password: password,
                            );

                            // 5. Pesan Sukses & Pindah ke Login dengan Auto-fill
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: Text(
                                    'Pendaftaran berhasil! Akun $email siap digunakan.'),
                                backgroundColor: Colors.green,
                              ),
                            );

                            Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                builder: (context) => LoginScreen(
                                  initialEmail: email,
                                  initialPassword: password,
                                ),
                              ),
                            );
                          },
                          style: FilledButton.styleFrom(
                            backgroundColor: Colors.indigo,
                            foregroundColor: Colors.white,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(14),
                            ),
                            elevation: 2,
                          ),
                          child: const Text(
                            'Daftar Akun',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 24),

                      // --- Link Login Bawah ---
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text(
                            'Sudah punya akun? ',
                            style: TextStyle(fontSize: 14, color: Colors.grey),
                          ),
                          GestureDetector(
                            onTap: () {
                              Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => LoginScreen(),
                                ),
                              );
                            },
                            child: const Text(
                              'Masuk di sini',
                              style: TextStyle(
                                fontSize: 14,
                                color: Colors.indigo,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 16),
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }

  // Helper method decoration input field
  InputDecoration _buildInputDecoration({
    required String hint,
    required IconData icon,
    Widget? suffixWidget,
  }) {
    return InputDecoration(
      hintText: hint,
      prefixIcon: Icon(icon, color: Colors.indigo),
      suffixIcon: suffixWidget,
      filled: true,
      fillColor: Colors.grey.shade50,
      contentPadding: const EdgeInsets.symmetric(vertical: 14, horizontal: 16),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: BorderSide(color: Colors.grey.shade300),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: BorderSide(color: Colors.grey.shade300),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: const BorderSide(color: Colors.indigo, width: 2),
      ),
    );
  }
}
