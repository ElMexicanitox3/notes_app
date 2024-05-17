import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes_app/constants/words.dart';
import 'package:notes_app/providers/blocs/theme_bloc.dart';
import 'package:notes_app/providers/blocs/theme_event.dart';

import '../../widgets/widgets.dart';

class Homescreen extends StatelessWidget {
  
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  Homescreen({super.key});

  @override
  Widget build(BuildContext context) {


    return Scaffold(
      key: _scaffoldKey,
      drawer: Drawer(

        semanticLabel: "Menu",
        child: Column(
          children: [
            
            const UserAccountsDrawerHeader(
              accountName: Text('User Name'),
              accountEmail: Text('Email Address'),
              currentAccountPicture: CircleAvatar(
                child: FlutterLogo(size: 42.0),
              ),
            ),

            // List tile selected
            ListTile(
              leading: const Icon(Icons.home),
              title: const Text('Notes'),
              onTap: () {
                Navigator.pop(context);
              },
              selected: true,
            ),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.grey[300],
                  borderRadius: BorderRadius.circular(20),
                ),
                child: ListTile(
                  leading: const Icon(Icons.add),
                  title: const Text('Add Note'),
                  onTap: () {
                    Navigator.pop(context);
                  },
                ),
              ),
            ),

            // divider
            const Divider(),

            // config
            ListTile(
              leading: const Icon(Icons.settings),
              title: const Text('Settings'),
              onTap: () {
                Navigator.pop(context);
              },
            ),


            


            // icon on bottom
            Expanded(
              child: Align(
                alignment: Alignment.bottomCenter,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: IconButton(
                    icon: const Icon(Icons.brightness_4),
                    onPressed: () {
                      BlocProvider.of<ThemeBloc>(context).add(ToggleThemeEvent());
                    },
                  ),
                ),
              ),
            ),


          ],
        ),
      ),
      body: Column(
        children: [
          SingleChildScrollView(
            child: Column(
              children: [
                const SizedBox(height: 45.0), // Espacio en blanco (16.0 es el tamaño del espacio en blanco
                
                Padding(
                  padding: const EdgeInsets.all(10),
                  child: SizedBox(
                    width: double.infinity,
                    child: Card(
                      color: Colors.grey[200],
                      child: Row(
                        children: [
                          
                          IconButton(
                            icon: const Icon(Icons.menu),
                            onPressed: () {
                              _scaffoldKey.currentState?.openDrawer();  // Abre el Drawer usando la GlobalKey
                            },
                          ),
      
                          const Expanded(
                            child: TextField(
                              decoration: InputDecoration(
                                hintText: Words.searchEn,
                                border: InputBorder.none,
                                contentPadding: EdgeInsets.symmetric(horizontal: 15),
                              ),
                            ),
                          ),
      
                          IconButton(
                            icon: const Icon(Icons.sort),
                            onPressed: () {},
                          ),
      
                        ],
                      ),
                    ),
                  ),
                ),
      
                // un buscador
                const SizedBox(height: 16.0), // Espacio en blanco (16.0 es el tamaño del espacio en blanco
            
                const SizedBox(height: 16.0),
      
                const NoteWidget(),
                
              ],
            ),
          )
        ],
      ),
    );
  }
}