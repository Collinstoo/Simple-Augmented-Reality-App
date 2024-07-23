import 'package:flutter/material.dart';
import 'visualizer.dart'; // Ensure this path is correct
import 'defect_solutions.dart'; // Ensure this path is correct
import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';

void main() => runApp(const MaterialApp(
  home: BottomNavBar(),
  debugShowCheckedModeBanner: false,
));

class BottomNavBar extends StatefulWidget {
  const BottomNavBar({super.key});

  @override
  _BottomNavBarState createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  int _currentIndex = 0;

  final List<Widget> _pages = [
    const PlaceholderWidget(Colors.pink), // Placeholder for the first page
    const PlaceholderWidget(Colors.blue), // Placeholder for the second page
    const Visualizer(),
    const DefectSolutions(defectType: 'Placeholder'),
    const PlaceholderWidget(Colors.green), // Placeholder for the fifth page
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
            icon: const Icon(Icons.home, color: Colors.red,),
            title: const Text('Home'),
            selectedColor: Colors.red,
          ),
          SalomonBottomBarItem(
            icon: const Icon(Icons.color_lens, color: Colors.deepPurple,),
            title: const Text('Colors'),
            selectedColor: Colors.deepPurple,
          ),
          SalomonBottomBarItem(
            icon: const Icon(Icons.camera_alt_rounded, color: Colors.indigo,),
            title: const Text('Visualizer'),
            selectedColor: Colors.indigo,
          ),
          SalomonBottomBarItem(
            icon: const Icon(Icons.format_paint, color: Colors.green,),
            title: const Text('Defect Solutions'),
            selectedColor: Colors.green,
          ),
          SalomonBottomBarItem(
            icon: const Icon(Icons.shopping_cart, color: Colors.orange,),
            title: const Text('Cart'),
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

  const PlaceholderWidget(this.color, {super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: color,
    );
  }
}
