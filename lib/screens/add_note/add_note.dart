import 'package:flutter/material.dart';
import 'package:notes_app/constants/words.dart';
import 'package:notes_app/models/note_model.dart';
import 'package:notes_app/providers/sqflite/connection.dart';

class AddNote extends StatelessWidget {
  
  AddNote({super.key});

  String? _title;
  String? _content;
  Note? _note;

  void _save(){
    print("Save note");
    print("Title: $_title");
    print("Content: $_content");

    if(_title == null && _content == null){
      return;
    }
    
    _note = Note(
      title: _title ?? "",
      content: _content,
      createdAt: DateTime.now().toString(),
    );

    // Save note to database
    DBProvider.instance.insertNote(_note!);
    
  }

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: true,
      onPopInvoked: (didPop) => _save(),
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