import 'package:flutter/material.dart';
import '../data/habit_data.dart';
import 'detail_habit_screen.dart';
import 'placeholder_screen.dart';

// ============================================================
// Layar 6: Home (Dashboard) — StatelessWidget
// ============================================================
class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Dashboard Habit'),
        backgroundColor: Colors.indigo,
        foregroundColor: Colors.white,
      ),

      // --- Drawer (Menu Samping) untuk navigasi ke semua layar ---
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            // Header Drawer
            const DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.indigo,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  CircleAvatar(
                    radius: 30,
                    backgroundColor: Colors.white,
                    child: Icon(
                      Icons.person,
                      size: 36,
                      color: Colors.indigo,
                    ),
                  ),
                  SizedBox(height: 10),
                  Text(
                    'Lyz',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    'Self-Improvement App',
                    style: TextStyle(
                      color: Colors.white70,
                      fontSize: 13,
                    ),
                  ),
                ],
              ),
            ),

            // Menu Item: Layar 1 - Splash Screen
            ListTile(
              leading: const Icon(Icons.flash_on, color: Colors.indigo),
              title: const Text('Splash Screen'),
              subtitle: const Text('Layar 1'),
              onTap: () {
                Navigator.pop(context); // tutup drawer
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const PlaceholderScreen(
                      title: 'Splash Screen',
                      description:
                          'Logo + tagline motivasi singkat.\n\n(Layar ini akan dibuat oleh anggota tim lain)',
                      icon: Icons.flash_on,
                    ),
                  ),
                );
              },
            ),

            // Menu Item: Layar 2-3 - Onboarding
            ListTile(
              leading: const Icon(Icons.swipe, color: Colors.indigo),
              title: const Text('Onboarding'),
              subtitle: const Text('Layar 2-3'),
              onTap: () {
                Navigator.pop(context);
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const PlaceholderScreen(
                      title: 'Onboarding',
                      description:
                          'Slide 1: "Bangun kebiasaan baik setiap hari"\nSlide 2: "Pantau progress dirimu"\n\n(Layar ini akan dibuat oleh anggota tim lain)',
                      icon: Icons.swipe,
                    ),
                  ),
                );
              },
            ),

            // Menu Item: Layar 4 - Login
            ListTile(
              leading: const Icon(Icons.login, color: Colors.indigo),
              title: const Text('Login'),
              subtitle: const Text('Layar 4'),
              onTap: () {
                Navigator.pop(context);
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const PlaceholderScreen(
                      title: 'Login',
                      description:
                          'Halaman login pengguna.\n\n(Layar ini akan dibuat oleh anggota tim lain)',
                      icon: Icons.login,
                    ),
                  ),
                );
              },
            ),

            // Menu Item: Layar 5 - Register
            ListTile(
              leading: const Icon(Icons.person_add, color: Colors.indigo),
              title: const Text('Register'),
              subtitle: const Text('Layar 5'),
              onTap: () {
                Navigator.pop(context);
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const PlaceholderScreen(
                      title: 'Register',
                      description:
                          'Halaman registrasi pengguna baru.\n\n(Layar ini akan dibuat oleh anggota tim lain)',
                      icon: Icons.person_add,
                    ),
                  ),
                );
              },
            ),

            const Divider(),

            // Menu Item: Layar 6 - Dashboard (current)
            ListTile(
              leading: const Icon(Icons.home, color: Colors.indigo),
              title: const Text('Dashboard'),
              subtitle: const Text('Layar 6 (Halaman ini)'),
              selected: true,
              selectedTileColor: Colors.indigo.shade50,
              onTap: () {
                Navigator.pop(context); // tutup drawer, sudah di halaman ini
              },
            ),

            // Menu Item: Layar 8 - Statistik/Progress
            ListTile(
              leading: const Icon(Icons.bar_chart, color: Colors.indigo),
              title: const Text('Statistik / Progress'),
              subtitle: const Text('Layar 8'),
              onTap: () {
                Navigator.pop(context);
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const PlaceholderScreen(
                      title: 'Statistik / Progress',
                      description:
                          'Grafik progress mingguan (bar chart sederhana).\n\n(Layar ini akan dibuat oleh anggota tim lain)',
                      icon: Icons.bar_chart,
                    ),
                  ),
                );
              },
            ),

            // Menu Item: Layar 9 - Quote/Artikel
            ListTile(
              leading: const Icon(Icons.format_quote, color: Colors.indigo),
              title: const Text('Quote / Artikel Motivasi'),
              subtitle: const Text('Layar 9'),
              onTap: () {
                Navigator.pop(context);
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const PlaceholderScreen(
                      title: 'Quote / Artikel Motivasi',
                      description:
                          'Kumpulan quote dan artikel motivasi.\nTap → Detail Quote.\n\n(Layar ini akan dibuat oleh anggota tim lain)',
                      icon: Icons.format_quote,
                    ),
                  ),
                );
              },
            ),

            // Menu Item: Layar 10 - Profil
            ListTile(
              leading: const Icon(Icons.person, color: Colors.indigo),
              title: const Text('Profil'),
              subtitle: const Text('Layar 10'),
              onTap: () {
                Navigator.pop(context);
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const PlaceholderScreen(
                      title: 'Profil',
                      description:
                          'Foto, nama, total habit yang diikuti.\nMenu: Pengaturan, Tentang Aplikasi, Logout.\n\n(Layar ini akan dibuat oleh anggota tim lain)',
                      icon: Icons.person,
                    ),
                  ),
                );
              },
            ),
          ],
        ),
      ),

      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // --- Bagian Sambutan (Greeting Header) ---
              const Text(
                'Selamat pagi, Lyz!',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 4),
              const Text(
                'Yuk lanjutkan langkah kecilmu hari ini',
                style: TextStyle(
                  fontSize: 14,
                  color: Colors.grey,
                ),
              ),
              const SizedBox(height: 20),

              // --- Card Quote Motivasi Harian ---
              Card(
                color: Colors.indigo.shade50,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Icon(
                        Icons.lightbulb,
                        color: Colors.amber.shade700,
                        size: 28,
                      ),
                      const SizedBox(width: 12),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: const [
                            Text(
                              'Quote Hari Ini',
                              style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.bold,
                                color: Colors.indigo,
                              ),
                            ),
                            SizedBox(height: 4),
                            Text(
                              '"Kesuksesan adalah hasil dari persiapan, kerja keras, dan belajar dari kegagalan."',
                              style: TextStyle(
                                fontSize: 13,
                                fontStyle: FontStyle.italic,
                                color: Colors.black87,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 20),

              // --- Menu Navigasi Cepat (Quick Access Buttons) ---
              const Text(
                'Menu Fitur',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 12),

              // Grid tombol navigasi ke layar lain
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  // Tombol ke Statistik (Layar 8)
                  _buildMenuButton(
                    context,
                    icon: Icons.bar_chart,
                    label: 'Statistik',
                    color: Colors.orange,
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const PlaceholderScreen(
                            title: 'Statistik / Progress',
                            description:
                                'Grafik progress mingguan (bar chart sederhana).\n\n(Layar ini akan dibuat oleh anggota tim lain)',
                            icon: Icons.bar_chart,
                          ),
                        ),
                      );
                    },
                  ),

                  // Tombol ke Quote/Artikel (Layar 9)
                  _buildMenuButton(
                    context,
                    icon: Icons.format_quote,
                    label: 'Quote',
                    color: Colors.teal,
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const PlaceholderScreen(
                            title: 'Quote / Artikel Motivasi',
                            description:
                                'Kumpulan quote dan artikel motivasi.\nTap → Detail Quote.\n\n(Layar ini akan dibuat oleh anggota tim lain)',
                            icon: Icons.format_quote,
                          ),
                        ),
                      );
                    },
                  ),

                  // Tombol ke Profil (Layar 10)
                  _buildMenuButton(
                    context,
                    icon: Icons.person,
                    label: 'Profil',
                    color: Colors.purple,
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const PlaceholderScreen(
                            title: 'Profil',
                            description:
                                'Foto, nama, total habit yang diikuti.\nMenu: Pengaturan, Tentang Aplikasi, Logout.\n\n(Layar ini akan dibuat oleh anggota tim lain)',
                            icon: Icons.person,
                          ),
                        ),
                      );
                    },
                  ),

                  // Tombol ke Login (Layar 4)
                  _buildMenuButton(
                    context,
                    icon: Icons.login,
                    label: 'Login',
                    color: Colors.blue,
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const PlaceholderScreen(
                            title: 'Login',
                            description:
                                'Halaman login pengguna.\n\n(Layar ini akan dibuat oleh anggota tim lain)',
                            icon: Icons.login,
                          ),
                        ),
                      );
                    },
                  ),
                ],
              ),
              const SizedBox(height: 24),

              // --- Header Section Kebiasaan ---
              const Text(
                'Kebiasaan Hari Ini',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 12),

              // --- Daftar Kebiasaan (ListView.builder) ---
              ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: habitList.length,
                itemBuilder: (context, index) {
                  final habit = habitList[index];
                  return Card(
                    margin: const EdgeInsets.only(bottom: 10),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: ListTile(
                      leading: CircleAvatar(
                        backgroundColor: Colors.indigo.shade100,
                        child: Icon(
                          Icons.check_circle_outline,
                          color: Colors.indigo.shade700,
                        ),
                      ),
                      title: Text(
                        habit['title'] as String,
                        style: const TextStyle(fontWeight: FontWeight.w600),
                      ),
                      subtitle: Text(habit['subtitle'] as String),
                      trailing: Checkbox(
                        value: habit['isDone'] as bool,
                        onChanged: null, // Statis, tidak ada perubahan state
                        activeColor: Colors.indigo,
                      ),
                      onTap: () {
                        // Navigasi ke Detail Habit dengan passing data
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>
                                DetailHabitScreen(habit: habit),
                          ),
                        );
                      },
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  // --- Helper method: Tombol menu navigasi berbentuk kolom ikon + label ---
  Widget _buildMenuButton(
    BuildContext context, {
    required IconData icon,
    required String label,
    required Color color,
    required VoidCallback onTap,
  }) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(12),
      child: Container(
        width: 72,
        padding: const EdgeInsets.symmetric(vertical: 12),
        decoration: BoxDecoration(
          color: color.withValues(alpha: 0.1),
          borderRadius: BorderRadius.circular(12),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(icon, color: color, size: 28),
            const SizedBox(height: 6),
            Text(
              label,
              style: TextStyle(
                fontSize: 11,
                fontWeight: FontWeight.w600,
                color: color,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
