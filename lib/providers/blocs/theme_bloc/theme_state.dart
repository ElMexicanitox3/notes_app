// theme_state.dart
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

abstract class ThemeState extends Equatable {
  final ThemeData themeData;
  final bool isDark;

  const ThemeState(this.themeData, this.isDark);

  @override
  List<Object> get props => [themeData];
}

class LightThemeState extends ThemeState {
  // LightThemeState() : super(AppThemes.lightTheme);
  LightThemeState() : super(ThemeData.light(), false);

}

class DarkThemeState extends ThemeState {
  // DarkThemeState() : super(AppThemes.darkTheme);
  DarkThemeState() : super(ThemeData.dark(), true);
}
