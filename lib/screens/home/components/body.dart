import 'package:NoteHub/providers/blocs/notes_bloc/note.dart';
import 'package:NoteHub/themes/app_themes.dart';
import 'package:NoteHub/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


class Body extends StatelessWidget {
  const Body({super.key});

  @override
  Widget build(BuildContext context) {
    
    context.read<NotesBloc>().add(GetNotesEvent());

    return SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: Column(
        children: [
          BlocBuilder<NotesBloc, NoteState>(
            builder: (context, state) {
              if (state.notes.isEmpty) {
                return const Center(
                  child: Column(
                    children: [
                      SizedBox(height: 100),
                      Text(
                        "No notes yet",
                        style: TextStyle(
                          color: AppThemes.primary,
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 20),
                      Text(
                        "Press the + button to add a new note",
                        style: TextStyle(
                          color: AppThemes.primary,
                          fontSize: 20,
                        ),
                      ),
                    ],
                  ),
                );
              }
              return Column(
                children: state.notes.map((note) => InkWell(
                  onTap: () {
                    if (state.selectedNotes.isEmpty) {
                      Navigator.pushNamed(context, "/add_note",arguments: note);
                    } else {
                      final isSelected =state.selectedNotes.contains(note);
                      if (isSelected) {
                        context.read<NotesBloc>().add(DeselectNoteEvent(note));
                      } else {
                        context.read<NotesBloc>().add(SelectNoteEvent(note));
                      }
                    }
                  },
                  onLongPress: () {
                    final isSelected = state.selectedNotes.contains(note);
                    if (isSelected) {
                      context.read<NotesBloc>().add(DeselectNoteEvent(note));
                    } else {
                      context.read<NotesBloc>().add(SelectNoteEvent(note));
                    }
                  },
                  child:NoteWidget(
                    note: note,
                    isSelected: state.selectedNotes.contains(note)? true : false,
                  ),
                  
                )).toList(),
              );
            },
          ),
        ],
      ),
    );
  }
  
}