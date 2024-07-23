// defect_solutions.dart
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image/image.dart' as img;

class Defect {
  final String title;
  final String description;
  final String imagePath;

  Defect(this.title, this.description, this.imagePath);
}

class DefectSolutions extends StatefulWidget {
  final Defect defect;

  const DefectSolutions({super.key, required this.defect});

  @override
  _DefectSolutionsState createState() => _DefectSolutionsState();
}

class _DefectSolutionsState extends State<DefectSolutions> {
  img.Image? _originalImage;
  img.Image? _filteredImage;
  late File _imageFile;

  @override
  void initState() {
    super.initState();
    _loadImage();
  }

  Future<void> _loadImage() async {
    _imageFile = File(widget.defect.imagePath);
    final bytes = await _imageFile.readAsBytes();
    setState(() {
      _originalImage = img.decodeImage(bytes);
      _filteredImage = _originalImage;
    });
  }

  void _applyFilter(img.Image Function(img.Image) filter) {
    setState(() {
      _filteredImage = filter(_originalImage!);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Defect Solutions'),
      ),
      body: Column(
        children: [
          if (_filteredImage != null)
            Expanded(
              child: Image.memory(Uint8List.fromList(img.encodePng(_filteredImage!))),
            ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ElevatedButton(
                onPressed: () => _applyFilter((image) => img.grayscale(image)),
                child: const Text('Grayscale'),
              ),
              ElevatedButton(
                onPressed: () => _applyFilter((image) => img.invert(image)),
                child: const Text('Invert'),
              ),
              ElevatedButton(
                onPressed: () => _applyFilter((image) => img.sepia(image)),
                child: const Text('Sepia'),
              ),
            ],
          ),
          Expanded(
            child: ListView(
              padding: const EdgeInsets.all(8),
              children: const [
                ListTile(
                  leading: Icon(Icons.recommend),
                  title: Text('Recommendation 1'),
                  subtitle: Text('This is the recommendation for defect 1.'),
                ),
                ListTile(
                  leading: Icon(Icons.recommend),
                  title: Text('Recommendation 2'),
                  subtitle: Text('This is the recommendation for defect 2.'),
                ),
                // Add more recommendations as needed
              ],
            ),
          ),
        ],
      ),
    );
  }
}
