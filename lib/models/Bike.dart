import 'dart:convert';

class Bike {
  String name;
  int placeHolder;
  String city;
  String neighborHood;

  Bike({
    required this.name,
    required this.placeHolder,
    required this.city,
    required this.neighborHood,
  });

  factory Bike.fromRawJson(String str) => Bike.fromJson(json.decode(str));

  factory Bike.fromJson(Map<String, dynamic> json) => Bike(
        name: json['nom'],
        placeHolder: json['nb_places'],
        city: json['codcomm'],
        neighborHood: json['quartier'],
      );
}
