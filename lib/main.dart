import 'package:flutter/material.dart';
import 'visualizer.dart'; // Ensure this path is correct
import 'defect_solutions.dart'; // Ensure this path is correct
import 'package:ar_flutter_plugin/ar_flutter_plugin.dart';
import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';

void main() => runApp(MaterialApp(
  home: BottomNavBar(),
  debugShowCheckedModeBanner: false,
));

class BottomNavBar extends StatefulWidget {
  @override
  _BottomNavBarState createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  int _currentIndex = 0;

  final List<Widget> _pages = [
    PlaceholderWidget(Colors.pink), // Placeholder for the first page
    PlaceholderWidget(Colors.blue), // Placeholder for the second page
    Visualizer(),
    DefectSolutions(defect: Defect('Placeholder', 'Placeholder description', 'assets/placeholder.png')),
    PlaceholderWidget(Colors.green), // Placeholder for the fifth page
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      bottomNavigationBar: SalomonBottomBar(
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        items: [
          SalomonBottomBarItem(
            icon: Icon(Icons.home, color: Colors.red,),
            title: Text('Home'),
            selectedColor: Colors.red,
          ),
          SalomonBottomBarItem(
            icon: Icon(Icons.color_lens, color: Colors.deepPurple,),
            title: Text('Colors'),
            selectedColor: Colors.deepPurple,
          ),
          SalomonBottomBarItem(
            icon: Icon(Icons.camera_alt_rounded, color: Colors.indigo,),
            title: Text('Visualizer'),
            selectedColor: Colors.indigo,
          ),
          SalomonBottomBarItem(
            icon: Icon(Icons.format_paint, color: Colors.green,),
            title: Text('Defect Solutions'),
            selectedColor: Colors.green,
          ),
          SalomonBottomBarItem(
            icon: Icon(Icons.shopping_cart, color: Colors.orange,),
            title: Text('Cart'),
            selectedColor: Colors.orange,
          ),
        ],
      ),
      body: _pages[_currentIndex],
    );
  }
}

class PlaceholderWidget extends StatelessWidget {
  final Color color;

  PlaceholderWidget(this.color);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: color,
    );
  }
}
