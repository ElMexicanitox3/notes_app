import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes_app/constants/words.dart';
import 'package:notes_app/models/note_model.dart';
import 'package:notes_app/providers/blocs/notes_bloc/note_bloc.dart';
import 'package:notes_app/providers/blocs/notes_bloc/note_event.dart';
import 'package:notes_app/providers/sqflite/connection.dart';

class AddNote extends StatelessWidget {
  
  AddNote({super.key});

  String? _title;
  String? _content;
  Note? _note;

  void _save(BuildContext context){
  
    if(_title == null && _content == null){
      return;
    }

    _note = Note(
      title: _title ?? "",
      content: _content,
      createdAt: DateTime.now().toString(),
    );

    // Save note to database
    context.read<NotesBloc>().add(AddNoteEvent(_note!));
    
  }

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: true,
      onPopInvoked: (didPop) => _save(context),
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Add Note"),
        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              
              TextField(
                onChanged: (value){
                  _title = value;
                },
                decoration: const InputDecoration(
                  hintText: Words.titleEn,
                  border: InputBorder.none,
                ),
              ),
              
              TextField(
                onChanged: (value) {
                  _content = value;
                },
                decoration: const InputDecoration(
                  hintText: Words.noteEn,
                  border: InputBorder.none,
                ),
              ),

            ],
          ),
        )
      ),
    );
  }
}