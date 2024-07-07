import 'package:flutter/material.dart';
import 'visualizer.dart'; // Ensure this path is correct
import 'defect_solutions.dart';// Ensure this path is correct
import 'package:ar_flutter_plugin/ar_flutter_plugin.dart';

void main() => runApp(MaterialApp(
  home: BottomNavBar(),
  debugShowCheckedModeBanner: false,
));

class BottomNavBar extends StatefulWidget {
  @override
  _BottomNavBarState createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  int _page = 0;

  final List<Widget> _pages = [
    PlaceholderWidget(Colors.pink), // Placeholder for the first page
    PlaceholderWidget(Colors.blue),  // Placeholder for the second page
    Visualizer(),
    DefectSolutions(defect: Defect('Placeholder', 'Placeholder description', 'assets/placeholder.png')),
    PlaceholderWidget(Colors.green), // Placeholder for the fifth page
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _page,
        onTap: (index) {
          setState(() {
            _page = index;
          });
        },
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home',backgroundColor: Colors.black),
          BottomNavigationBarItem(icon: Icon(Icons.color_lens), label: 'Colors',backgroundColor: Colors.black),
          BottomNavigationBarItem(icon: Icon(Icons.camera_alt_rounded), label: 'Visualizer', backgroundColor: Colors.black),
          BottomNavigationBarItem(icon: Icon(Icons.format_paint), label: 'Defect Solutions', backgroundColor: Colors.black),
          BottomNavigationBarItem(icon: Icon(Icons.shopping_cart), label: 'Cart',backgroundColor: Colors.black),
        ],
      ),
      body: _pages[_page],
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


















// import 'package:flutter/material.dart';
// // import 'package:curved_navigation_bar/curved_navigation_bar.dart';
//
// import 'Main Screens/curved_navigation_bar.dart';
//
// void main() => runApp(MaterialApp(home: BottomNavBar()));
//
// class BottomNavBar extends StatefulWidget {
//   @override
//   _BottomNavBarState createState() => _BottomNavBarState();
// }
//
// class _BottomNavBarState extends State<BottomNavBar> {
//   int _page = 0;
//   GlobalKey<CurvedNavigationBarState> _bottomNavigationKey = GlobalKey();
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         bottomNavigationBar: CurvedNavigationBar(
//           key: _bottomNavigationKey,
//           index: 0,
//           items: <Widget>[
//             Icon(Icons.home, size: 30),
//             Icon(Icons.color_lens, size: 30),
//             Icon(Icons.camera_alt_rounded, size: 30),
//             Icon(Icons.format_paint, size: 30),
//             Icon(Icons.shopping_cart, size: 30),
//           ],
//           color: Colors.white,
//           buttonBackgroundColor: Colors.white,
//           backgroundColor: Colors.pink,
//           animationCurve: Curves.easeInOut,
//           animationDuration: Duration(milliseconds: 600),
//           onTap: (index) {
//             setState(() {
//               _page = index;
//             });
//           },
//           letIndexChange: (index) => true,
//         ),
//         body: Container(
//
//           color: Colors.pink,
//           child: Center(
//             child: Column(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: <Widget>[
//                 Text(_page.toString(), style: TextStyle(fontSize: 160)),
//                 ElevatedButton(
//                   child: Text('Go To Page of index 1'),
//                   onPressed: () {
//                     final CurvedNavigationBarState? navBarState =
//                         _bottomNavigationKey.currentState;
//                     navBarState?.setPage(1);
//                   },
//                 )
//               ],
//             ),
//           ),
//         ));
//   }
// }