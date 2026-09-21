import 'package:flutter/material.dart';

import 'login_screen.dart';

class OnboardingColors {
  static const Color background = Color(0xFFF5F7FF); // indigo sangat muda
  static const Color primary = Color(0xFF3F51B5); // sama dengan Colors.indigo
  static const Color primaryLight = Color(0xFFE8EAF6); // indigo 50
  static const Color primaryMedium = Color(0xFFC5CAE9); // indigo 100
  static const Color titleText = Color(0xFF1A237E); // indigo 900
  static const Color bodyText = Color(0xFF5F6580); // abu kebiruan
  static const Color dotInactive = Color(0xFFC5CAE9);
  static const Color accent = Color(0xFFF4B942); // kuning hangat (motivasi)
}

// HALAMAN ONBOARDING 1
class OnboardingPage1 extends StatelessWidget {
  const OnboardingPage1({super.key});

  @override
  Widget build(BuildContext context) {
    return OnboardingLayout(
      mainIcon: Icons.self_improvement,
      accentIconTop: Icons.wb_sunny_rounded,
      accentIconBottom: Icons.favorite_rounded,
      title: 'Bangun kebiasaan baik setiap hari',
      description:
          'Buat kebiasaan positif sedikit demi sedikit dan jadikan perubahan '
          'kecil sebagai langkah menuju versi terbaik dirimu.',
      pageIndex: 0,
      buttonText: 'Lanjut',
      onButtonPressed: () {
        // Pindah ke halaman onboarding kedua
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const OnboardingPage2()),
        );
      },
    );
  }
}

// HALAMAN ONBOARDING 2
class OnboardingPage2 extends StatelessWidget {
  const OnboardingPage2({super.key});

  @override
  Widget build(BuildContext context) {
    return OnboardingLayout(
      mainIcon: Icons.insights_rounded,
      accentIconTop: Icons.emoji_events_rounded,
      accentIconBottom: Icons.local_fire_department_rounded,
      title: 'Pantau progress dirimu',
      description:
          'Lihat perkembangan kebiasaanmu dan tetap termotivasi untuk '
          'mencapai tujuan setiap hari.',
      pageIndex: 1,
      buttonText: 'Mulai Sekarang',
      onButtonPressed: () {
        // Sementara diarahkan ke PlaceholderScreen (Login dibuat anggota lain).
        // Setelah LoginPage asli jadi, ganti builder menjadi:
        //   builder: (context) => const LoginPage(),
        // dan gunakan Navigator.pushReplacement agar Back tidak kembali ke onboarding.
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => LoginScreen(),
          ),
        );
      },
    );
  }
}

// ============================================================
// LAYOUT BERSAMA
// Dipakai oleh kedua halaman supaya desainnya konsisten.
// Isinya: ilustrasi, judul, deskripsi, indikator, dan tombol.
// ============================================================
class OnboardingLayout extends StatelessWidget {
  final IconData mainIcon;
  final IconData accentIconTop;
  final IconData accentIconBottom;
  final String title;
  final String description;
  final int pageIndex; // 0 = halaman pertama, 1 = halaman kedua
  final String buttonText;
  final VoidCallback onButtonPressed;

  const OnboardingLayout({
    super.key,
    required this.mainIcon,
    required this.accentIconTop,
    required this.accentIconBottom,
    required this.title,
    required this.description,
    required this.pageIndex,
    required this.buttonText,
    required this.onButtonPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: OnboardingColors.background,
      body: SafeArea(
        // LayoutBuilder memberi tahu ukuran area yang tersedia
        child: LayoutBuilder(
          builder: (context, constraints) {
            // Ukuran ilustrasi mengikuti lebar & tinggi layar (dibatasi 140-320)
            final double byHeight = constraints.maxHeight * 0.36;
            final double byWidth = constraints.maxWidth * 0.7;
            final double illustrationSize =
                (byHeight < byWidth ? byHeight : byWidth)
                    .clamp(140.0, 320.0)
                    .toDouble();

            // Ukuran teks sedikit dikecilkan di layar sempit
            final bool isSmall = constraints.maxWidth < 360;
            final double titleSize = isSmall ? 24 : 28;
            final double bodySize = isSmall ? 14 : 16;

            return SingleChildScrollView(
              child: Center(
                // Batasi lebar konten agar tidak terlalu melebar di desktop
                child: ConstrainedBox(
                  constraints: BoxConstraints(
                    maxWidth: 480,
                    minHeight: constraints.maxHeight,
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 24,
                      vertical: 24,
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        // 1. Ilustrasi
                        OnboardingIllustration(
                          size: illustrationSize,
                          mainIcon: mainIcon,
                          accentIconTop: accentIconTop,
                          accentIconBottom: accentIconBottom,
                        ),

                        // 2. Judul & deskripsi
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 24),
                          child: Column(
                            children: [
                              Text(
                                title,
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontSize: titleSize,
                                  fontWeight: FontWeight.w800,
                                  height: 1.25,
                                  color: OnboardingColors.titleText,
                                ),
                              ),
                              const SizedBox(height: 16),
                              Text(
                                description,
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontSize: bodySize,
                                  height: 1.5,
                                  color: OnboardingColors.bodyText,
                                ),
                              ),
                            ],
                          ),
                        ),

                        // 3. Indikator halaman & tombol
                        Column(
                          children: [
                            PageIndicator(currentIndex: pageIndex, total: 2),
                            const SizedBox(height: 28),
                            SizedBox(
                              width: double.infinity,
                              height: 54,
                              child: FilledButton(
                                onPressed: onButtonPressed,
                                style: FilledButton.styleFrom(
                                  backgroundColor: OnboardingColors.primary,
                                  foregroundColor: Colors.white,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(16),
                                  ),
                                  textStyle: const TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                                child: Text(buttonText),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}

// ============================================================
// ILUSTRASI
// Lingkaran gradasi + ikon besar + 2 badge ikon kecil.
// Tanpa file gambar, jadi langsung bisa dijalankan.
// ============================================================
class OnboardingIllustration extends StatelessWidget {
  final double size;
  final IconData mainIcon;
  final IconData accentIconTop;
  final IconData accentIconBottom;

  const OnboardingIllustration({
    super.key,
    required this.size,
    required this.mainIcon,
    required this.accentIconTop,
    required this.accentIconBottom,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: size,
      height: size,
      child: Stack(
        alignment: Alignment.center,
        children: [
          // Lingkaran luar (gradasi)
          Container(
            width: size,
            height: size,
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [
                  OnboardingColors.primaryLight,
                  OnboardingColors.primaryMedium,
                ],
              ),
            ),
          ),
          // Lingkaran dalam (putih)
          Container(
            width: size * 0.68,
            height: size * 0.68,
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  color: Color(0x1A000000),
                  blurRadius: 16,
                  offset: Offset(0, 6),
                ),
              ],
            ),
            child: Icon(
              mainIcon,
              size: size * 0.36,
              color: OnboardingColors.primary,
            ),
          ),
          // Badge kanan atas
          Positioned(
            top: size * 0.06,
            right: size * 0.02,
            child: AccentBadge(
              icon: accentIconTop,
              size: size * 0.2,
              color: OnboardingColors.accent,
            ),
          ),
          // Badge kiri bawah
          Positioned(
            bottom: size * 0.08,
            left: size * 0.02,
            child: AccentBadge(
              icon: accentIconBottom,
              size: size * 0.2,
              color: OnboardingColors.primary,
            ),
          ),
        ],
      ),
    );
  }
}

// Badge bulat kecil berisi ikon
class AccentBadge extends StatelessWidget {
  final IconData icon;
  final double size;
  final Color color;

  const AccentBadge({
    super.key,
    required this.icon,
    required this.size,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size,
      height: size,
      decoration: const BoxDecoration(
        shape: BoxShape.circle,
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Color(0x1A000000),
            blurRadius: 10,
            offset: Offset(0, 4),
          ),
        ],
      ),
      child: Icon(icon, size: size * 0.55, color: color),
    );
  }
}

// ============================================================
// INDIKATOR HALAMAN (DOT)
// Dot aktif lebih panjang dan berwarna utama.
// ============================================================
class PageIndicator extends StatelessWidget {
  final int currentIndex;
  final int total;

  const PageIndicator({
    super.key,
    required this.currentIndex,
    required this.total,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(total, (index) {
        final bool isActive = index == currentIndex;
        return Container(
          margin: const EdgeInsets.symmetric(horizontal: 4),
          width: isActive ? 28 : 10,
          height: 10,
          decoration: BoxDecoration(
            color: isActive
                ? OnboardingColors.primary
                : OnboardingColors.dotInactive,
            borderRadius: BorderRadius.circular(5),
          ),
        );
      }),
    );
  }
}
