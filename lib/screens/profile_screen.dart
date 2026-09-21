import 'package:flutter/material.dart';

import '../data/user_data.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  late String _userName;
  String _interests = 'Olahraga, Membaca, Belajar';
  String _bio = 'Saya sedang membangun kebiasaan yang lebih baik.';
  IconData _profileIcon = Icons.person;

  @override
  void initState() {
    super.initState();
    _userName = UserData.activeUserName;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profil'),
        backgroundColor: Colors.indigo,
        foregroundColor: Colors.white,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16),
          child: Column(
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
                          _profileIcon,
                          size: 48,
                          color: Colors.indigo.shade700,
                        ),
                      ),
                      const SizedBox(height: 12),
                      Text(
                        _userName,
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
                      Text(_interests),
                      const SizedBox(height: 16),
                      const Text(
                        'Bio',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(height: 4),
                      Text(_bio),
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
                      onTap: _openEditProfile,
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
          ),
        ),
      ),
    );
  }

  void _openEditProfile() {
    final nameController = TextEditingController(text: _userName);
    final interestsController = TextEditingController(text: _interests);
    final bioController = TextEditingController(text: _bio);
    var selectedIcon = _profileIcon;

    showDialog<void>(
      context: context,
      builder: (dialogContext) => StatefulBuilder(
        builder: (context, setDialogState) => AlertDialog(
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
                      (icon) => setDialogState(() => selectedIcon = icon),
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
                      (icon) => setDialogState(() => selectedIcon = icon),
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
                setState(() {
                  _userName = newName.isEmpty ? 'Pengguna' : newName;
                  _interests = interestsController.text.trim().isEmpty
                      ? 'Belum diisi'
                      : interestsController.text.trim();
                  _bio = bioController.text.trim().isEmpty
                      ? 'Belum diisi'
                      : bioController.text.trim();
                  _profileIcon = selectedIcon;
                });
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
