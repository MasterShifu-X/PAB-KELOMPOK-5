import 'package:flutter/material.dart';

import '../data/habit_data.dart';

// ============================================================
// Layar 8: Statistik / Progress — StatelessWidget
// ============================================================
class ProgressScreen extends StatelessWidget {
  const ProgressScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Statistik Progress'),
        backgroundColor: Colors.indigo,
        foregroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Progress Mingguan',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 4),
            const Text(
              'Ringkasan pencapaian kebiasaanmu',
              style: TextStyle(fontSize: 13, color: Colors.grey),
            ),
            const SizedBox(height: 20),

            // --- List progress bar per habit (data dari habit_data.dart) ---
            ...habitList.map((habit) {
              return Card(
                margin: const EdgeInsets.only(bottom: 12),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(14.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            habit['title'] as String,
                            style: const TextStyle(fontWeight: FontWeight.w600),
                          ),
                          Text(
                            '${((habit['progress'] as double) * 100).toInt()}%',
                            style: TextStyle(
                              color: Colors.indigo.shade700,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 8),
                      ClipRRect(
                        borderRadius: BorderRadius.circular(8),
                        child: LinearProgressIndicator(
                          value: habit['progress'] as double,
                          minHeight: 10,
                          backgroundColor: Colors.indigo.shade50,
                          valueColor: AlwaysStoppedAnimation<Color>(
                            Colors.indigo.shade400,
                          ),
                        ),
                      ),
                      const SizedBox(height: 6),
                      Text(
                        habit['streak'] as String,
                        style: const TextStyle(
                          fontSize: 12,
                          color: Colors.grey,
                        ),
                      ),
                    ],
                  ),
                ),
              );
            }),

            const SizedBox(height: 12),
            const Text(
              'Grafik Aktivitas 7 Hari Terakhir',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),

            // --- Bar chart sederhana pakai Container (tanpa package chart) ---
            SizedBox(
              height: 140,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: const [
                  _BarItem(label: 'Sen', height: 60),
                  _BarItem(label: 'Sel', height: 90),
                  _BarItem(label: 'Rab', height: 40),
                  _BarItem(label: 'Kam', height: 110),
                  _BarItem(label: 'Jum', height: 70),
                  _BarItem(label: 'Sab', height: 100),
                  _BarItem(label: 'Min', height: 50),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// --- Helper widget: satu batang bar chart statis ---
class _BarItem extends StatelessWidget {
  final String label;
  final double height;

  const _BarItem({required this.label, required this.height});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Container(
          width: 24,
          height: height,
          decoration: BoxDecoration(
            color: Colors.indigo.shade300,
            borderRadius: BorderRadius.circular(6),
          ),
        ),
        const SizedBox(height: 6),
        Text(label, style: const TextStyle(fontSize: 11, color: Colors.grey)),
      ],
    );
  }
}
