import 'package:flutter/material.dart';
import 'package:NoteHub/themes/app_themes.dart';

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
            decoration: const BoxDecoration(
              color: AppThemes.primary,
            ),
          ),

          //imagen mia centrada
          Center(
            child: Container(
              margin: const EdgeInsets.only(top: 20),
              child: const Column(
                children: [
                  CircleAvatar(
                    backgroundImage: AssetImage('lib/assets/img/me.jpg'),
                    radius: 100,
                  ),
                  SizedBox(height: 10),
                  Text(
                    "Gerardo Matadama Peralta",
                    style: TextStyle(
                      color: AppThemes.w,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    "Developer Full Stack | Flutter ",
                    style: TextStyle(
                      color: AppThemes.w,
                      fontSize: 15,
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.location_pin, color:AppThemes.w),
                      Text("Mexico City, Mexico", style: TextStyle(color: AppThemes.w, fontSize: 15)),
                    ],
                  ),
                  SizedBox(height: 10),
                  
                  Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      
                      children: [
                        Text("Notes App", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                        Text("Version 1.1.1", style: TextStyle( fontSize: 15)),
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