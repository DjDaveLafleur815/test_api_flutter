import 'dart:convert';

import 'package:test_api_flutter/globals/apiURL.dart';
import 'package:test_api_flutter/models/Bike.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class BikeView extends StatefulWidget {
  const BikeView({super.key});

  @override
  State<BikeView> createState() => _BikeViewState();
}

class _BikeViewState extends State<BikeView> {
  Future<List<Bike>> fetchBikeStops() async {
    try {
      final response =
          await http.get(Uri.parse('$apiURL/divia_park_velo/records?limit=20'));

      if (response.statusCode == 200) {
        final json = jsonDecode(response.body);
        final results = json['results'] as List<dynamic>;

        return results.map((json) => Bike.fromJson(json)).toList();
      } else {
        throw Exception('Failed to load bike stops');
      }
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: fetchBikeStops(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (snapshot.hasData) {
            List<Bike> bikesArea = snapshot.data!;

            return ListView.builder(
                itemCount: bikesArea.length,
                itemBuilder: (context, index) {
                  Bike bike = bikesArea[index];

                  return ListTile(
                    leading: Text(bike.placeHolder.toString()),
                    title: Text(bike.name),
                    subtitle: Text(bike.neighborHood),
                    trailing: Text(bike.city),
                  );
                });
          } else {
            return const Text("Impossible de récupérer les données");
          }
        });
  }
}
