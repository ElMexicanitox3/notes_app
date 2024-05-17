import 'package:flutter/material.dart';

class NoteWidget extends StatelessWidget {
  const NoteWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const SizedBox(
      width: double.infinity, // Ancho infinito
      child: Card(
        color: Colors.amber,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 4),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 15.0),
              Text(
                'Note Title',
              ),
              SizedBox(height: 8.0),
              Text(
                'Note Content',
              ),
              SizedBox(height: 15.0),

            ],
          ),
        ),
      ),
    );
  }
}