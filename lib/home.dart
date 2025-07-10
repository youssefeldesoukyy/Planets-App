import 'package:flutter/material.dart';
import 'buttons.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff0E0E0E),
      body: Stack(
        children: [
          Image.asset("assets/Images/home_image.png"),
          Container(
            alignment: Alignment.centerLeft,
            child: const Text(" Explore \n The \n Universe", style: TextStyle(
              fontSize: 48,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
                child: ExploreActionButton(text: "Explore", onPressed: (){
                  Navigator.pushNamed(context, "explore");
                }
                )
              ),
        ],
      ),
    );
  }
}