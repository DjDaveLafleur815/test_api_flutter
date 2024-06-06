import 'package:flutter/material.dart';

class BusView extends StatefulWidget {
  const BusView({super.key});

  @override
  State<BusView> createState() => _BusViewState();
}

class _BusViewState extends State<BusView> {
  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text(
        "Page 4",
      ),
    );
  }
}
