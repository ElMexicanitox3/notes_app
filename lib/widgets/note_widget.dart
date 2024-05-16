import 'package:flutter/material.dart';

class NoteWidget extends StatelessWidget {
  const NoteWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity, // Ancho infinito
      child: const Card(
        color: Colors.amber,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 4),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 15.0),
              Text(
                'Note Title',
              ),
              SizedBox(height: 8.0),
              Text(
                'Note Content',
              ),
              const SizedBox(height: 15.0),

            ],
          ),
        ),
      ),
    );
  }
}