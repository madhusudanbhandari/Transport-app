import 'package:flutter/material.dart';

class HistoryPage extends StatelessWidget {
  const HistoryPage({super.key});

  @override
  Widget build(BuildContext context) {
    // Placeholder booking history
    final history = [
      {"bus": "Bus 101", "route": "Thamel → Patan", "date": "2026-01-28"},
      {
        "bus": "Bus 102",
        "route": "Bhaktapur → Ratnapark",
        "date": "2026-01-25",
      },
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text("Booking History"),
        backgroundColor: Colors.purpleAccent,
      ),
      body: ListView.builder(
        itemCount: history.length,
        itemBuilder: (context, index) {
          final booking = history[index];
          return Card(
            margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: ListTile(
              leading: const Icon(Icons.history, color: Colors.purple),
              title: Text(booking['bus']!),
              subtitle: Text("${booking['route']} • ${booking['date']}"),
            ),
          );
        },
      ),
    );
  }
}
