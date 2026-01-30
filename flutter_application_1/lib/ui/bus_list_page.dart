import 'package:flutter/material.dart';

class BusListPage extends StatelessWidget {
  const BusListPage({super.key});

  @override
  Widget build(BuildContext context) {
    // Placeholder bus data
    final buses = [
      {"name": "Bus 101", "route": "Thamel → Patan", "seats": 40},
      {"name": "Bus 102", "route": "Bhaktapur → Ratnapark", "seats": 35},
      {"name": "Bus 103", "route": "Koteshwor → Gongabu", "seats": 30},
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text("Available Buses"),
        backgroundColor: Colors.orangeAccent,
      ),
      body: ListView.builder(
        itemCount: buses.length,
        itemBuilder: (context, index) {
          final bus = buses[index];
          return Card(
            margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            elevation: 4,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16),
            ),
            child: ListTile(
              leading: const Icon(Icons.directions_bus, color: Colors.orange),
              title: Text(bus['name'] as String),
              subtitle: Text(
                "${bus['route'] as String} • Seats: ${bus['seats']}",
              ),
              trailing: IconButton(
                icon: const Icon(
                  Icons.arrow_forward,
                  color: Colors.orangeAccent,
                ),
                onPressed: () {
                  // Navigate to booking page or details
                },
              ),
            ),
          );
        },
      ),
    );
  }
}
