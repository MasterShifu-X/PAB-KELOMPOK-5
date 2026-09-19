import 'package:flutter/material.dart';

// ============================================================
// Detail Quote — StatelessWidget, menerima data lewat constructor
// ============================================================
class QuoteDetailScreen extends StatelessWidget {
  final Map<String, dynamic> quote;

  const QuoteDetailScreen({super.key, required this.quote});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Detail Quote'),
        backgroundColor: Colors.indigo,
        foregroundColor: Colors.white,
      ),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              quote['icon'] as IconData,
              size: 64,
              color: Colors.indigo.shade200,
            ),
            const SizedBox(height: 24),
            Text(
              '"${quote['quote']}"',
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontSize: 20,
                fontStyle: FontStyle.italic,
                fontWeight: FontWeight.w600,
                height: 1.5,
              ),
            ),
            const SizedBox(height: 16),
            Text(
              '- ${quote['author']}',
              style: const TextStyle(fontSize: 15, color: Colors.grey),
            ),
            const SizedBox(height: 8),
            Chip(
              label: Text(quote['category'] as String),
              backgroundColor: Colors.indigo.shade50,
            ),
          ],
        ),
      ),
    );
  }
}
