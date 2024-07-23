import 'package:flutter/material.dart';

class DefectSolutions extends StatefulWidget {
  final String defectType;

  const DefectSolutions({super.key, required this.defectType});

  @override
  _DefectSolutionsState createState() => _DefectSolutionsState();
}

class _DefectSolutionsState extends State<DefectSolutions> {
  late List<PaintRecommendation> recommendations;

  @override
  void initState() {
    super.initState();
    recommendations = _getRecommendations(widget.defectType);
  }

  List<PaintRecommendation> _getRecommendations(String defectType) {
    List<PaintRecommendation> allRecommendations = [
      PaintRecommendation(
        title: 'Primer Paint',
        description: 'Apply primer to prepare the wall.',
        imagePath: 'assets/ar.jpg',
      ),
      PaintRecommendation(
        title: 'Waterproof Paint',
        description: 'Use waterproof paint to prevent moisture damage.',
        imagePath: 'assets/ar.jpg',
      ),
      PaintRecommendation(
        title: 'Crack Filler',
        description: 'Fill cracks with this filler.',
        imagePath: 'assets/ar.jpg',
      ),
      PaintRecommendation(
        title: 'Anti-Mold Treatment',
        description: 'Apply anti-mold treatment to prevent mold growth.',
        imagePath: 'assets/ar.jpg',
      ),
    ];

    switch (defectType) {
      case 'Peeling':
        return allRecommendations.where((rec) => rec.title != 'Crack Filler').toList();
      case 'Hole':
        return allRecommendations.where((rec) => rec.title != 'Anti-Mold Treatment').toList();
      case 'Normal':
        return allRecommendations;
      default:
        return [];
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('DEFECT SOLUTIONS'),
        centerTitle: true,
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(8),
        itemCount: recommendations.length,
        itemBuilder: (context, index) {
          return Card(
            child: ListTile(
              leading: Image.asset(recommendations[index].imagePath),
              title: Text(recommendations[index].title),
              subtitle: Text(recommendations[index].description),
              onTap: () {
                // Handle card tap if needed
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text('Tapped on ${recommendations[index].title}')),
                );
              },
            ),
          );
        },
      ),
    );
  }
}

class PaintRecommendation {
  final String title;
  final String description;
  final String imagePath;

  PaintRecommendation({
    required this.title,
    required this.description,
    required this.imagePath,
  });
}
