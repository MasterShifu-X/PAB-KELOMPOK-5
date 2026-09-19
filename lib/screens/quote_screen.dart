import 'package:flutter/material.dart';

import '../data/quote_data.dart';
import 'quote_detail_screen.dart';

// ============================================================
// Layar 9: Quote / Artikel Motivasi — StatelessWidget
// ============================================================
class QuoteScreen extends StatelessWidget {
  const QuoteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Quote Motivasi'),
        backgroundColor: Colors.indigo,
        foregroundColor: Colors.white,
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(16.0),
        itemCount: quoteList.length,
        itemBuilder: (context, index) {
          final quote = quoteList[index];
          return Card(
            margin: const EdgeInsets.only(bottom: 12),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            child: ListTile(
              contentPadding: const EdgeInsets.all(12),
              leading: CircleAvatar(
                backgroundColor: Colors.indigo.shade100,
                child: Icon(
                  quote['icon'] as IconData,
                  color: Colors.indigo.shade700,
                ),
              ),
              title: Text(
                quote['quote'] as String,
                style: const TextStyle(
                  fontStyle: FontStyle.italic,
                  fontWeight: FontWeight.w600,
                ),
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
              subtitle: Padding(
                padding: const EdgeInsets.only(top: 6),
                child: Text('- ${quote['author']} • ${quote['category']}'),
              ),
              trailing: const Icon(Icons.chevron_right),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => QuoteDetailScreen(quote: quote),
                  ),
                );
              },
            ),
          );
        },
      ),
    );
  }
}
