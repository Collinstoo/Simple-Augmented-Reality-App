import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:fluttertoast/fluttertoast.dart';
import 'defect_solutions.dart'; // Ensure this import is correct

class ARVisualizerBody extends StatefulWidget {
  const ARVisualizerBody({super.key});

  @override
  _ARVisualizerBodyState createState() => _ARVisualizerBodyState();
}

class _ARVisualizerBodyState extends State<ARVisualizerBody> {
  final ImagePicker _picker = ImagePicker();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ElevatedButton(
          onPressed: () => captureImage(),
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.blue,
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 0),
          ),
          child: const Text(
            'CAPTURE IMAGE',
            style: TextStyle(
              fontSize: 13,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }

  Future<void> captureImage() async {
    try {
      final XFile? image = await _picker.pickImage(source: ImageSource.camera);
      if (image == null) return;

      final Uint8List imageBytes = await image.readAsBytes();
      String base64Image = base64Encode(imageBytes);

      // Send POST request to the endpoint
      final response = await http.post(
        Uri.parse('https://6ec8-102-219-210-106.ngrok-free.app/predict/'),
        headers: {'Content-Type': 'application/json'},
        body: json.encode({'image': base64Image}),
      );

      // Handle response
      String responseString = response.body;
      String defectMessage;
      if (responseString == '1') {
        defectMessage = 'Peeling';
      } else if (responseString == '0') {
        defectMessage = 'Hole';
      } else if (responseString == '2') {
        defectMessage = 'Normal';
      } else {
        throw Exception('Invalid response from server');
      }

      // Show toast message
      Fluttertoast.showToast(
        msg: defectMessage,
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.black54,
        textColor: Colors.white,
        fontSize: 16.0,
      );

      // Navigate to defect_solutions.dart
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => DefectSolutions(
            defectType: defectMessage,
          ),
        ),
      );
    } catch (e) {
      print(e);
      Fluttertoast.showToast(
        msg: 'An error occurred',
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.black54,
        textColor: Colors.white,
        fontSize: 16.0,
      );
    }
  }
}





// import 'dart:io';
// import 'dart:typed_data';
// import 'dart:ui' as ui;
// import 'package:ar_flutter_plugin/managers/ar_anchor_manager.dart';
// import 'package:ar_flutter_plugin/managers/ar_location_manager.dart';
// import 'package:ar_flutter_plugin/managers/ar_object_manager.dart';
// import 'package:ar_flutter_plugin/managers/ar_session_manager.dart';
// import 'package:ar_flutter_plugin/models/ar_hittest_result.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/rendering.dart';
// import 'package:path_provider/path_provider.dart';
// import 'package:ar_flutter_plugin/ar_flutter_plugin.dart'; // Ensure correct import for your AR plugin
// import 'package:augmented_reality_application/defect_solutions.dart';
//
// class ARVisualizerBody extends StatefulWidget {
//   @override
//   _ARVisualizerBodyState createState() => _ARVisualizerBodyState();
// }
//
// class _ARVisualizerBodyState extends State<ARVisualizerBody> {
//   ARSessionManager? arSessionManager;
//   ARObjectManager? arObjectManager;
//   ARAnchorManager? arAnchorManager;
//   ARLocationManager? arLocationManager;
//   GlobalKey _globalKey = GlobalKey();
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Stack(
//         children: [
//           ARView(
//             onARViewCreated: onARViewCreated,
//           ),
//           Positioned(
//             bottom: 20,
//             left: 0,
//             right: 0,
//             child: Center(
//               child: ElevatedButton(
//                 onPressed: () => captureImage(),
//                 child: Text(
//                   'CAPTURE IMAGE',
//                   style: TextStyle(
//                     fontSize: 13,
//                     fontWeight: FontWeight.bold,
//                     color: Colors.white,
//                   ),
//                 ),
//                 style: ElevatedButton.styleFrom(
//                   backgroundColor: Colors.blue,
//                   padding: EdgeInsets.symmetric(horizontal: 20, vertical: 0),
//                 ),
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
//
//   void onARViewCreated(
//       ARSessionManager arSessionManager,
//       ARObjectManager arObjectManager,
//       ARAnchorManager arAnchorManager,
//       ARLocationManager arLocationManager,
//       ) {
//     this.arSessionManager = arSessionManager;
//     this.arObjectManager = arObjectManager;
//     this.arAnchorManager = arAnchorManager;
//     this.arLocationManager = arLocationManager;
//
//     arSessionManager.onInitialize(
//       showFeaturePoints: false,
//       showPlanes: true, // Enable plane detection
//       customPlaneTexturePath: "Images/triangle.png",
//       showWorldOrigin: true,
//     );
//
//     // Example of handling plane detection using onPlaneDetected callback
//     arSessionManager.onPlaneOrPointTap = (List<ARHitTestResult> planeHits) {
//       // Handle detected plane hits here
//       // You can iterate through planeHits and perform actions based on detected planes
//       // For example, draw UI overlays, place objects on planes, etc.
//     };
//   }
//
//   Future<void> captureImage() async {
//     try {
//       RenderRepaintBoundary boundary =
//       _globalKey.currentContext!.findRenderObject() as RenderRepaintBoundary;
//       ui.Image image = await boundary.toImage(pixelRatio: 3.0);
//       ByteData? byteData = await image.toByteData(format: ui.ImageByteFormat.png);
//       Uint8List pngBytes = byteData!.buffer.asUint8List();
//
//       final directory = await getApplicationDocumentsDirectory();
//       final imagePath = '${directory.path}/scanned_wall.png';
//       File imgFile = File(imagePath);
//       await imgFile.writeAsBytes(pngBytes);
//
//       // Navigate to defect solutions screen with captured image
//       Navigator.push(
//         context,
//         MaterialPageRoute(
//           builder: (context) => DefectSolutions(
//             defect: Defect('Scanned Wall', 'Wall with defect', imagePath),
//           ),
//         ),
//       );
//     } catch (e) {
//       print(e);
//     }
//   }
// }
