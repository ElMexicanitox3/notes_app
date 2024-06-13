import 'package:NoteHub/screens/home/components/search_bar.dart';
import 'package:NoteHub/themes/app_themes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../providers/blocs/theme_bloc/theme.dart';

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
                "Notes App",
                style: TextStyle(
                  color: AppThemes.primary,
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                ),
              ),
    
              BlocBuilder<ThemeBloc, ThemeState>(builder: (context, state) {
                return Switch(
                  activeThumbImage: const AssetImage("lib/assets/img/moon.png"),
                  activeColor: AppThemes.secondary,
                  activeTrackColor: AppThemes.secondary,
                  inactiveThumbImage: const AssetImage("lib/assets/img/sun.png"),
                  inactiveThumbColor: AppThemes.secondary,
                  value: state.isDark,
                  onChanged: (value) {
                    context.read<ThemeBloc>().add(ToggleThemeEvent());
                  },
                );
              }),
    
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