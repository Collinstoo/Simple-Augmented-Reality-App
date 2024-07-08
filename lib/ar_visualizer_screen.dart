import 'package:flutter/material.dart';
import 'ar_visualizer_body.dart';

class ARVisualizerScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('AR Visualizer'),
      ),
      body: ARVisualizerBody(),
    );
  }
}
