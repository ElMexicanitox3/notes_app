import 'package:NoteHub/screens/home/components/searchBar.dart';
import 'package:NoteHub/themes/app_themes.dart';
import 'package:NoteHub/widgets/switch_theme.dart';
import 'package:flutter/material.dart';

class AppBarCustom extends StatelessWidget implements PreferredSizeWidget {
  const AppBarCustom({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: false,
      toolbarHeight: 120,
      title: Column(
        children: [
    
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                "NoteHub",
                style: TextStyle(
                  color: AppThemes.primary,
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                ),
              ),
    
              SwitchThemeCustom(),
    
            ],
          ),
    
          const SearchBarCustom(),
        ],
      ),
    );
  }
  
  @override
  Size get preferredSize => const Size.fromHeight(120);
}