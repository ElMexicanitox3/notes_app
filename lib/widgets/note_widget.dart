import 'package:flutter/material.dart';
import 'package:notes_app/models/note_model.dart';

class NoteWidget extends StatelessWidget {

  final Note note;

  const NoteWidget({super.key, required this.note});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity, // Ancho infinito
      child: Card(
        color: Colors.amber,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 4),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 15.0),
              Text(
                note.title,
              ),
              const SizedBox(height: 8.0),
              Text(
                note.content,
              ),
              const SizedBox(height: 15.0),
            ],
          ),
        ),
      ),
    );
  }
}