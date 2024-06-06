import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:test_api_flutter/globals/apiURL.dart';
import 'package:test_api_flutter/models/Parking.dart';
import 'package:http/http.dart' as http;

class ParkingView extends StatefulWidget {
  const ParkingView({super.key});

  @override
  State<ParkingView> createState() => _ParkingViewState();
}

class _ParkingViewState extends State<ParkingView> {
  Future<List<Parking>> fetchParkingStops() async {
    try {
      final response =
          await http.get(Uri.parse('$apiURL/dispo-parking/records?limit=20'));

      if (response.statusCode == 200) {
        final json = jsonDecode(response.body);
        final results = json['results'] as List<dynamic>;

        return results.map((json) => Parking.fromJson(json)).toList();
      } else {
        throw Exception('Failed to load parking stops');
      }
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: fetchParkingStops(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (snapshot.hasData) {
            List<Parking> bikesArea = snapshot.data!;

            return ListView.builder(
                itemCount: bikesArea.length,
                itemBuilder: (context, index) {
                  Parking parking = bikesArea[index];

                  return ListTile(
                    leading: Text(parking.placeHolder.toString()),
                    title: Text(parking.name),
                    subtitle: Text(parking.neighborHood),
                    trailing: Text(parking.city),
                  );
                });
          } else {
            return const Text("Impossible de récupérer les données");
          }
        });
  }
}
