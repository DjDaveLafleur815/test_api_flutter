import 'dart:convert';

class Parking {
  String name;
  int placeHolder;
  String city;
  String neighborHood;

  Parking({
    required this.name,
    required this.placeHolder,
    required this.city,
    required this.neighborHood,
  });

  factory Parking.fromRawJson(String str) => Parking.fromJson(json.decode(str));

  factory Parking.fromJson(Map<String, dynamic> json) => Parking(
        name: json['nom'],
        placeHolder: json['nb_places'],
        city: json['codcomm'],
        neighborHood: json['quartier'],
      );
}
