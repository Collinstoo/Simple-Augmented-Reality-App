import 'package:flutter/material.dart';
import 'ar_visualizer_body.dart';

class ARVisualizerScreen extends StatelessWidget {
  const ARVisualizerScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        centerTitle: true,
        title: const Text('AR VISUALIZER'),
        titleTextStyle: const TextStyle(
          fontSize: 17,
          fontWeight: FontWeight.bold,
          color: Colors.black,
        ),
        iconTheme: const IconThemeData(color: Colors.blue),
      ),
      body: const ARVisualizerBody(),
    );
  }
}
