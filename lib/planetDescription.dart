import 'package:flutter/material.dart';
import 'buttons.dart';
import 'package:model_viewer_plus/model_viewer_plus.dart';

class PlanetDescription extends StatefulWidget {
  final String planetName;
  final String shortDescription;
  final String detailedDescription;
  final String imagePath;
  final String modelPath;

  const PlanetDescription({super.key, required this.planetName, required this.shortDescription, required this.imagePath, required this.detailedDescription, required this.modelPath});

  @override
  State<PlanetDescription> createState() => _PlanetDescriptionState();
}

class _PlanetDescriptionState extends State<PlanetDescription> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Column(
        children: [
        SizedBox(
        height: 150,
        width: double.infinity,
        child: Stack(
          children: [
        Positioned.fill(
        child: Image.asset(
          "assets/Images/Rectangle 4.png",
          fit: BoxFit.cover,
        ),
      ),

            Positioned.fill(
              child: Container(
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      Colors.transparent,
                      Colors.black,
                    ],
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                  ),
                ),
              ),
            ),

      Padding(
        padding: const EdgeInsets.only(top: 50,right: 43),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            RedCircularIconButton(
              icon: Icons.arrow_back,
              onPressed: () {
                Navigator.pop(context, "planetDescription");
              },
            ),

            Expanded(
              child: Text(
                widget.planetName,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
      ),

      Align(
        alignment: Alignment.bottomLeft,
        child: Padding(
          padding: const EdgeInsets.only(left: 18),
          child: Text(
            widget.shortDescription,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 24,
            ),
          ),
        ),
      ),
          ],
        ),
        ),
          const SizedBox(height: 16,),

          Expanded(
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                    height: 350,
                    width: 350,
                    child: ModelViewer(
                      src: widget.modelPath,
                      alt: "3D model of ${widget.planetName}",
                      autoRotate: true,
                      cameraControls: true,
                    ),
                  ),
                  const SizedBox(height: 20),
                  const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        "About",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 10),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      widget.detailedDescription,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          )
        ]
      ),
    );
  }
}