import 'package:flutter/material.dart';
import 'package:NoteHub/models/note_model.dart';
import 'package:NoteHub/themes/app_themes.dart';

class NoteWidget extends StatelessWidget {

  final Note note;
  final bool isSelected;
  const NoteWidget({super.key, required this.note, required this.isSelected});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
      child: SizedBox(
        width: double.infinity, // Ancho infinito
        child: Container(
          decoration: BoxDecoration(
            border: isSelected? Border.all(color: AppThemes.primary, width: 4.0) : null,
            borderRadius: BorderRadius.circular(16.0), // Borde redondeado opcional
            color: AppThemes.secondary
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 15.0),
                Text(
                  note.title ,
                  style: const TextStyle(
                    color: AppThemes.primary,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  )
                ),
                const SizedBox(height: 8.0),
                const SizedBox(height: 15.0),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
