import 'package:flutter/material.dart';
import 'package:notes_app/models/note_model.dart';
import 'package:notes_app/screens/home/components/menu.dart';
import 'package:notes_app/screens/home/components/search_bar.dart';
import 'package:notes_app/themes/app_themes.dart';

import '../../widgets/widgets.dart';

class Homescreen extends StatelessWidget {
  
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  Homescreen({super.key});

  @override
  Widget build(BuildContext context) {


    return Scaffold(
      key: _scaffoldKey,
      drawer: const MenuWidget(),
      floatingActionButtonLocation: FloatingActionButtonLocation.endDocked,
      floatingActionButton: FloatingActionButton(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(40),
        ),
        onPressed: () {
          // TODO - Add note

          Navigator.pushNamed(context, "/add_note");



        },
        backgroundColor: AppThemes.primary,
        child: const Icon(Icons.add),
      ),
      bottomNavigationBar: BottomAppBar(
        color: AppThemes.secondary,
        // notchMargin: 10,
        // shape: const CircularNotchedRectangle(),
        height: 60,
        child: Row(
          // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            // config
            IconButton(
              icon: const Icon(Icons.settings),
              onPressed: () {
                // Navigator.pushNamed(context, "/config");
              },
              color: AppThemes.primary,
            ),

            // camera
            IconButton(
              icon: const Icon(Icons.camera_alt),
              onPressed: () {
                // Navigator.pushNamed(context, "/camera");
              },
              color: AppThemes.primary,
            ),
                        
          ],
        ),
      ),
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text(
              "Notes App",
              style: TextStyle(
                color: AppThemes.primary,
                fontSize: 30,
                fontWeight: FontWeight.bold,
              ),
            ),

            Switch(
              activeThumbImage: const AssetImage("lib/assets/img/moon.png"),
              inactiveThumbImage: const AssetImage("lib/assets/img/sun.png"),
              inactiveThumbColor: AppThemes.secondary,
              value: false,
              onChanged: (value) {
                // BlocProvider.of<ThemeBloc>(context).add(
                //   value ? DarkThemeEvent() : LightThemeEvent()
                // );
              },
            ),
          ],
        ),
        
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          children: [
            
            const SearchBarCustom(),

            ...Note.notes.map(
              (e) => NoteWidget(note: e)
            ),
          ],
        ),
      ),
    );
  }
}

