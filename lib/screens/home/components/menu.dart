import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes_app/providers/blocs/theme_bloc.dart';
import 'package:notes_app/providers/blocs/theme_event.dart';

class MenuWidget extends StatelessWidget {
  const MenuWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Drawer(
      
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
    );
  }
}