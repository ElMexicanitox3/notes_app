import 'package:flutter/material.dart';
import 'package:notes_app/models/note_model.dart';
import 'package:notes_app/themes/app_themes.dart';

class NoteWidget extends StatelessWidget {

  final Note note;

  const NoteWidget({super.key, required this.note});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity, // Ancho infinito
      child: Card(
        color: AppThemes.secondary,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 15.0),
              Text(
                note.title ?? "",
                style: const TextStyle(
                  color: AppThemes.primary,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                )
              ),
              const SizedBox(height: 8.0),
              Text(
                note.content ?? "",
                style: const TextStyle(
                  color: AppThemes.primary,
                )
              ),
              const SizedBox(height: 15.0),
            ],
          ),
        ),
      ),
    );
  }
}