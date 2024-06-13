import 'package:NoteHub/providers/blocs/notes_bloc/note.dart';
import 'package:NoteHub/themes/app_themes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FloatingActionButtonCustom extends StatelessWidget {
  const FloatingActionButtonCustom({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NotesBloc, NoteState>(
      builder: (context, state) {
        return FloatingActionButton(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(40),
          ),
          onPressed: () {
            if (state.selectedNotes.isNotEmpty) {
              context.read<NotesBloc>().add(DeleteNotesEvent(state.selectedNotes));
              context.read<NotesBloc>().add(DeselectAllNotesEvent());
            }else{
              Navigator.pushNamed(context, "/add_note");
            }
          },
          backgroundColor: state.selectedNotes.isEmpty? AppThemes.primary : AppThemes.delete,
          child: state.selectedNotes.isEmpty? const Icon(Icons.add, color: AppThemes.secondary,) : const Icon(Icons.delete),
        );
      },
    );
  }
}