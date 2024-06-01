import 'package:flutter/material.dart';
import 'package:notes_app/themes/app_themes.dart';

class AboutScreen  extends StatelessWidget {
  const AboutScreen ({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppThemes.primary,
        title: const Text("About"),
      ),
      body: Stack(
        children: [
          Container(
            height: 320,
            decoration: BoxDecoration(
              color: AppThemes.primary,
            ),
          ),

          //imagen mia centrada
          Center(
            child: Container(
              margin: const EdgeInsets.only(top: 20),
              child: Column(
                children: [
                  // Image.asset(
                  //   'lib/assets/img/me.jpg',
                  //   width: 150,
                  //   height: 150,
                  // ),
                  const CircleAvatar(
                    backgroundImage: AssetImage('lib/assets/img/me.jpg'),
                    radius: 100,
                  ),
                  const SizedBox(height: 10),
                  const Text(
                    "Gerardo Matadama Peralta",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const Text(
                    "Developer Full Stack | Flutter ",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 15,
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Icon(Icons.location_pin),
                      const Text("Mexico City, Mexico", style: TextStyle(color: Colors.white, fontSize: 15)),
                    ],
                  ),
                  const SizedBox(height: 10),
                  
                  Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      
                      children: [
                        const Text("Notes App", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                        const Text("Version 1.0.0", style: TextStyle( fontSize: 15)),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),

        ],
      ),
    );
  }
}