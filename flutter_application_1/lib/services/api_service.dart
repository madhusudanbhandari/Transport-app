import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/bus_models.dart';

class ApiService {
  static const baseUrl = "http://localhost:5000/api";

  static Future<List<Bus>> getBuses() async {
    final response = await http.get(Uri.parse('$baseUrl/buses'));

    if (response.statusCode == 200) {
      List data = jsonDecode(response.body);
      return data.map((bus) => Bus.fromJson(bus)).toList();
    } else {
      throw Exception("Failed to load buses");
    }
  }
}
