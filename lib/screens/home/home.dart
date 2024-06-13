import 'package:NoteHub/screens/home/components/components.dart';
import 'package:flutter/material.dart';

class Homescreen extends StatelessWidget {
  Homescreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.endDocked,
      floatingActionButton: FloatingActionButtonCustom(),
      bottomNavigationBar: BottomNavigatorBarCustom(),
      appBar: AppBarCustom(),
      body: Body(),
    );
  }
}