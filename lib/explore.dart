import 'package:flutter/material.dart';
import 'package:space_app/planetDescription.dart';
import 'buttons.dart';
import 'planetsData.dart';

class Explore extends StatefulWidget {
  const Explore({super.key});

  @override
  State<Explore> createState() => ExploreState();
}

class ExploreState extends State<Explore> {
  final PageController pageController = PageController();
  int currentPage = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Column(
        children: [
          SizedBox(
            height: 240,
            width: double.infinity,
            child: Stack(
              children: [
                Positioned.fill(
                  child: Image.asset(
                    "assets/Rectangle 4.png",
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

                const Align(
                  alignment: Alignment.topCenter,
                  child: Padding(
                    padding: EdgeInsets.only(top: 50),
                    child: Text(
                      "Explore",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),

                const Align(
                  alignment: Alignment.bottomLeft,
                  child: Padding(
                    padding: EdgeInsets.only(left: 20, bottom: 20),
                    child: Text(
                      "Which planet\nwould you like to explore?",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),

          const SizedBox(height: 10),
          Expanded(
            child: SizedBox(
              height: 400,
              child: PageView.builder(
                controller: pageController,
                itemCount: planets.length,
                onPageChanged: (index) {
                  setState(() {
                    currentPage = index;
                  });
                },
                itemBuilder: (context, index) {
                  final planet = planets[index];

                  return Column(
                    children: [
                      Image.asset(
                        planet["image"]!,
                        height: 350,
                        width: 350,
                        fit: BoxFit.fill,
                      ),
                      const SizedBox(height: 64),
                      Row(
                        children: [
                          RedCircularIconButton(
                            icon: Icons.arrow_back,
                            onPressed: () {
                              if (currentPage > 0) {
                                pageController.animateToPage(
                                  currentPage - 1,
                                  duration: const Duration(milliseconds: 200),
                                  curve: Curves.easeInOut,
                                );
                              }
                            },
                          ),
                          Expanded(
                            child: Text(
                              planet["name"]!,
                              textAlign: TextAlign.center,
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          RedCircularIconButton(
                            icon: Icons.arrow_forward,
                            onPressed: () {
                              if (currentPage < planets.length - 1) {
                                pageController.animateToPage(
                                  currentPage + 1,
                                  duration: const Duration(milliseconds: 200),
                                  curve: Curves.easeInOut,
                                );
                              }
                            },
                          ),
                        ],
                      ),
                      const Spacer(),
                      ExploreActionButton(
                        text: "Explore ${planets[currentPage]['name']!}",
                        onPressed: () {
                          final name = planets[currentPage]['name']!;
                          final shortDescription = planetDescriptions[name] ?? '';
                          final imagePath = planets[currentPage]['image']!;
                          final detailedDescription = planetDetails[name] ?? '';

                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => PlanetDescription(
                                planetName: name,
                                shortDescription: shortDescription,
                                imagePath: imagePath,
                                detailedDescription: detailedDescription,
                              ),
                            ),
                          );
                        },
                      ),
                    ],
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}