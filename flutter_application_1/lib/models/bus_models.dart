class Bus {
  final String id;
  final String name;
  final String from;
  final String to;
  final String departureTime;
  final int seatsAvailable;
  final int price;

  Bus({
    required this.id,
    required this.name,
    required this.from,
    required this.to,
    required this.departureTime,
    required this.seatsAvailable,
    required this.price,
  });

  factory Bus.fromJson(Map<String, dynamic> json) {
    return Bus(
      id: json['_id'],
      name: json['name'],
      from: json['from'],
      to: json['to'],
      departureTime: json['departureTime'],
      seatsAvailable: json['seatsAvailable'],
      price: json['price'],
    );
  }
}
