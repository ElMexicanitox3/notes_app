import 'package:NoteHub/blocs/theme_bloc/theme.dart';
import 'package:NoteHub/themes/app_themes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SwitchThemeCustom extends StatelessWidget {
  const SwitchThemeCustom({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ThemeBloc, ThemeState>(builder: (context, state) {
      return Switch(
        activeThumbImage: const AssetImage("lib/assets/img/moon.png"),
        activeThumbColor: AppThemes.secondary,
        activeTrackColor: AppThemes.secondary,
        inactiveThumbImage: const AssetImage("lib/assets/img/sun.png"),
        inactiveThumbColor: AppThemes.secondary,
        value: state.isDark,
        onChanged: (value) {
          context.read<ThemeBloc>().add(ToggleThemeEvent());
        },
      );
    });
  }
}
