import 'package:flutter/material.dart';
import '../services/api_service.dart';
import '../models/bus_models.dart';

class BusListPage extends StatelessWidget {
  const BusListPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Available Buses"),
        centerTitle: true,
        backgroundColor: Colors.orangeAccent,
      ),

      body: FutureBuilder<List<Bus>>(
        future: ApiService.getBuses(),
        builder: (context, snapshot) {
          // ⏳ Loading state
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }

          // ❌ Error state
          if (snapshot.hasError) {
            return Center(child: Text("Error: ${snapshot.error}"));
          }

          // 🚫 No data
          if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return const Center(child: Text("No buses available"));
          }

          // ✅ Data loaded
          final buses = snapshot.data!;

          return ListView.builder(
            padding: const EdgeInsets.all(12),
            itemCount: buses.length,
            itemBuilder: (context, index) {
              final bus = buses[index];

              return Card(
                margin: const EdgeInsets.only(bottom: 12),
                elevation: 5,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16),
                ),
                child: ListTile(
                  contentPadding: const EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 10,
                  ),
                  leading: const Icon(
                    Icons.directions_bus,
                    size: 30,
                    color: Colors.orange,
                  ),
                  title: Text(
                    bus.name,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                    ),
                  ),
                  subtitle: Text("${bus.from} → ${bus.to}"),
                  trailing: Text(
                    "Rs ${bus.price}",
                    style: const TextStyle(
                      color: Colors.green,
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                  onTap: () {
                    // Next step: go to bus details or booking
                  },
                ),
              );
            },
          );
        },
      ),
    );
  }
}
