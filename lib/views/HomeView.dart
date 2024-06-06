// ignore_for_file: file_names

import 'package:test_api_flutter/globals/destinationList.dart';
import 'package:test_api_flutter/views/tabs/BikeView.dart';
import 'package:test_api_flutter/views/tabs/BusView.dart';
import 'package:test_api_flutter/views/tabs/ParkingView.dart';
import 'package:test_api_flutter/views/tabs/TramWayView.dart';
import 'package:flutter/material.dart';

class HomeView extends StatefulWidget {
  const HomeView({
    super.key,
  });

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  int currentIndex = 0;

  List<Widget> views = const [
    BikeView(),
    ParkingView(),
    TramWayView(),
    BusView(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: views[currentIndex],
      bottomNavigationBar: NavigationBar(
        selectedIndex: currentIndex,
        onDestinationSelected: (index) {
          currentIndex = index;
          setState(() {});
        },
        destinations: destinations,
      ),
    );
  }
}
