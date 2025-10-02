import 'package:flutter/material.dart';

class AppThemes {
  // Static colors scheme
  static const primary = Color(0xFFF3B641);
  static const secondary = Color(0xFF252328);
  static const tertiary = Color(0xFF0A000B);
  static const w = Color(0xFFFFFFFF);
  static const delete = Color(0xFFE53935); // Color rojo para eliminar

  static ThemeData lightTheme = ThemeData(
    colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
    // cardTheme: const CardTheme(color: Colors.white),
    // useMaterial3: true,
  );

  static ThemeData darkTheme = ThemeData(
    colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
    // cardTheme: const CardTheme(color: Colors.black),
    // useMaterial3: true,
  );
}
