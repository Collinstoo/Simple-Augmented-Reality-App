import 'package:flutter/material.dart';
import 'ar_visualizer_body.dart';

class ARVisualizerScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        centerTitle: true,
        title: Text('AR VISUALIZER'),
        titleTextStyle: TextStyle(
          fontSize: 17,
          fontWeight: FontWeight.bold,
          color: Colors.black,
        ),
        iconTheme: IconThemeData(color: Colors.blue),
      ),
      body: ARVisualizerBody(),
    );
  }
}
