import 'package:flutter/material.dart';

import '../data/user_data.dart';

// ============================================================
// Layar 10: Profil — StatelessWidget (100% Stateless)
// Menggunakan ValueNotifier dan AnimatedBuilder untuk state reaktif
// tanpa menggunakan StatefulWidget
// ============================================================
class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  // State disimpan via ValueNotifier statis agar persisten dan tetap Stateless
  static final ValueNotifier<String> userNameNotifier =
      ValueNotifier<String>(UserData.activeUserName);
  static final ValueNotifier<String> interestsNotifier =
      ValueNotifier<String>('Olahraga, Membaca, Belajar');
  static final ValueNotifier<String> bioNotifier =
      ValueNotifier<String>('Saya sedang membangun kebiasaan yang lebih baik.');
  static final ValueNotifier<IconData> profileIconNotifier =
      ValueNotifier<IconData>(Icons.person);

  @override
  Widget build(BuildContext context) {
    // Sinkronisasi nama jika akun pengguna baru saja login/berubah di UserData
    if (userNameNotifier.value != UserData.activeUserName &&
        UserData.activeUserName.isNotEmpty) {
      userNameNotifier.value = UserData.activeUserName;
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text('Profil'),
        backgroundColor: Colors.indigo,
        foregroundColor: Colors.white,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16),
          child: AnimatedBuilder(
            animation: Listenable.merge([
              userNameNotifier,
              interestsNotifier,
              bioNotifier,
              profileIconNotifier,
            ]),
            builder: (context, _) {
              final userName = userNameNotifier.value;
              final interests = interestsNotifier.value;
              final bio = bioNotifier.value;
              final profileIcon = profileIconNotifier.value;

              return Column(
                children: [
                  Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(24),
                      child: Column(
                        children: [
                          CircleAvatar(
                            radius: 42,
                            backgroundColor: Colors.indigo.shade100,
                            child: Icon(
                              profileIcon,
                              size: 48,
                              color: Colors.indigo.shade700,
                            ),
                          ),
                          const SizedBox(height: 12),
                          Text(
                            userName,
                            style: const TextStyle(
                              fontSize: 22,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(height: 4),
                          const Text(
                            '5 Habit Diikuti',
                            style: TextStyle(color: Colors.grey),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 16),
                  Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(16),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            'Hobi / Minat',
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          const SizedBox(height: 4),
                          Text(interests),
                          const SizedBox(height: 16),
                          const Text(
                            'Bio',
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          const SizedBox(height: 4),
                          Text(bio),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Column(
                      children: [
                        ListTile(
                          leading: const Icon(Icons.edit_outlined),
                          title: const Text('Edit Profil'),
                          trailing: const Icon(Icons.chevron_right),
                          onTap: () => _openEditProfile(context),
                        ),
                        const Divider(height: 1),
                        ListTile(
                          leading: const Icon(Icons.settings_outlined),
                          title: const Text('Pengaturan'),
                          trailing: const Icon(Icons.chevron_right),
                          onTap: () => _showUnavailableMessage(
                            context,
                            'Halaman Pengaturan belum tersedia.',
                          ),
                        ),
                        const Divider(height: 1),
                        ListTile(
                          leading: const Icon(Icons.info_outline),
                          title: const Text('Tentang Aplikasi'),
                          trailing: const Icon(Icons.chevron_right),
                          onTap: () => _showAboutDialog(context),
                        ),
                        const Divider(height: 1),
                        ListTile(
                          leading: const Icon(Icons.logout, color: Colors.red),
                          title: const Text('Logout'),
                          trailing: const Icon(Icons.chevron_right),
                          onTap: () => _confirmLogout(context),
                        ),
                      ],
                    ),
                  ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }

  void _openEditProfile(BuildContext context) {
    final nameController = TextEditingController(text: userNameNotifier.value);
    final interestsController =
        TextEditingController(text: interestsNotifier.value);
    final bioController = TextEditingController(text: bioNotifier.value);
    final ValueNotifier<IconData> selectedIconNotifier =
        ValueNotifier<IconData>(profileIconNotifier.value);

    showDialog<void>(
      context: context,
      builder: (dialogContext) => ValueListenableBuilder<IconData>(
        valueListenable: selectedIconNotifier,
        builder: (context, selectedIcon, _) => AlertDialog(
          title: const Text('Edit Profil'),
          content: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                  child: InkWell(
                    onTap: () => _chooseProfileIcon(
                      context,
                      selectedIcon,
                      (icon) => selectedIconNotifier.value = icon,
                    ),
                    borderRadius: BorderRadius.circular(50),
                    child: CircleAvatar(
                      radius: 36,
                      backgroundColor: Colors.indigo.shade100,
                      child: Icon(
                        selectedIcon,
                        size: 40,
                        color: Colors.indigo.shade700,
                      ),
                    ),
                  ),
                ),
                Center(
                  child: TextButton.icon(
                    onPressed: () => _chooseProfileIcon(
                      context,
                      selectedIcon,
                      (icon) => selectedIconNotifier.value = icon,
                    ),
                    icon: const Icon(Icons.photo_camera_outlined, size: 18),
                    label: const Text('Ganti Foto Profil'),
                  ),
                ),
                TextField(
                  controller: nameController,
                  decoration: const InputDecoration(labelText: 'Nama'),
                  textInputAction: TextInputAction.next,
                ),
                TextField(
                  controller: interestsController,
                  decoration: const InputDecoration(labelText: 'Hobi / Minat'),
                  textInputAction: TextInputAction.next,
                ),
                TextField(
                  controller: bioController,
                  decoration: const InputDecoration(labelText: 'Bio'),
                  maxLines: 2,
                ),
              ],
            ),
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(dialogContext),
              child: const Text('Batal'),
            ),
            FilledButton(
              onPressed: () {
                final newName = nameController.text.trim();
                final savedName = newName.isEmpty ? 'Pengguna' : newName;
                userNameNotifier.value = savedName;
                UserData.activeUserName = savedName;
                interestsNotifier.value =
                    interestsController.text.trim().isEmpty
                        ? 'Belum diisi'
                        : interestsController.text.trim();
                bioNotifier.value = bioController.text.trim().isEmpty
                    ? 'Belum diisi'
                    : bioController.text.trim();
                profileIconNotifier.value = selectedIcon;
                Navigator.pop(dialogContext);
              },
              child: const Text('Simpan'),
            ),
          ],
        ),
      ),
    ).then((_) {
      nameController.dispose();
      interestsController.dispose();
      bioController.dispose();
      selectedIconNotifier.dispose();
    });
  }

  void _chooseProfileIcon(
    BuildContext dialogContext,
    IconData currentIcon,
    ValueChanged<IconData> onSelected,
  ) {
    const availableIcons = [
      Icons.person,
      Icons.self_improvement,
      Icons.sports_soccer,
      Icons.menu_book,
      Icons.lightbulb,
    ];

    showDialog<void>(
      context: dialogContext,
      builder: (context) => AlertDialog(
        title: const Text('Pilih Foto Profil'),
        content: Wrap(
          spacing: 12,
          runSpacing: 12,
          children: availableIcons.map((icon) {
            return InkWell(
              onTap: () {
                onSelected(icon);
                Navigator.pop(context);
              },
              borderRadius: BorderRadius.circular(28),
              child: CircleAvatar(
                backgroundColor: icon == currentIcon
                    ? Colors.indigo.shade200
                    : Colors.indigo.shade50,
                child: Icon(icon, color: Colors.indigo.shade700),
              ),
            );
          }).toList(),
        ),
      ),
    );
  }

  void _showUnavailableMessage(BuildContext context, String message) {
    ScaffoldMessenger.of(context)
        .showSnackBar(SnackBar(content: Text(message)));
  }

  void _showAboutDialog(BuildContext context) {
    showDialog<void>(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Tentang Aplikasi'),
        content: const Text(
          'Habit Tracker membantu kamu membangun kebiasaan baik setiap hari.',
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Tutup'),
          ),
        ],
      ),
    );
  }

  void _confirmLogout(BuildContext context) {
    showDialog<void>(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Logout'),
        content: const Text('Yakin ingin keluar dari halaman ini?'),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Batal'),
          ),
          FilledButton(
            onPressed: () {
              Navigator.pop(context);
              Navigator.pop(context);
            },
            child: const Text('Logout'),
          ),
        ],
      ),
    );
  }
}
