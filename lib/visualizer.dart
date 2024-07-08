import 'package:flutter/material.dart';
import 'ar_visualizer_screen.dart';
import 'wood_colors_screen.dart';

class Visualizer extends StatefulWidget {
  @override
  _VisualizerState createState() => _VisualizerState();
}

class _VisualizerState extends State<Visualizer> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Background image
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/background.jpg'), // Your background image
                fit: BoxFit.cover,
                colorFilter: ColorFilter.mode(
                  Colors.black.withOpacity(0.2), // Dark overlay
                  BlendMode.darken,
                ),
              ),
            ),
          ),
          // Content
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                buildVisualizerButton(
                  context,
                  'assets/ar.jpg',
                  'Apply & visualize our whole line of paints directly on your wall with AR',
                  'START',
                      () => Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ARVisualizerScreen(),
                    ),
                  ),
                ),
                SizedBox(height: 20),
                buildVisualizerButton(
                  context,
                  'assets/woodcolors.jpg',
                  'Take a picture of a wooden object like a chair and then\nchange its color',
                  'START',
                      () => Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => WoodColorsScreen(),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget buildVisualizerButton(BuildContext context, String imagePath, String description, String buttonText, VoidCallback onPressed) {
    return Card(
      elevation: 6,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      child: GestureDetector(
        onTap: onPressed,
        child: Container(
          height: 150,
          width: MediaQuery.of(context).size.width * 0.8,
          child: Row(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.horizontal(left: Radius.circular(15)),
                child: Image.asset(
                  imagePath,
                  width: 100,
                  height: double.infinity,
                  fit: BoxFit.cover,
                ),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        description,
                        style: TextStyle(
                          fontSize: 13,
                          // fontWeight: FontWeight.bold,
                          color: Colors.black,
                          // backgroundColor: Colors.black,
                        ),
                      ),
                      // SizedBox(height: 5),
                      Align(
                        alignment: Alignment.centerRight,
                        child: ElevatedButton(
                          onPressed: onPressed,
                          child: Text(buttonText),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.blue,
                            foregroundColor: Colors.white,
                            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 0),
                            textStyle: TextStyle(
                              fontSize: 10,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
