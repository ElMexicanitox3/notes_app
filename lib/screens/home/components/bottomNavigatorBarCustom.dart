import 'package:NoteHub/app_localizations.dart';
import 'package:NoteHub/blocs/notes_bloc/note.dart';
import 'package:NoteHub/themes/app_themes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BottomNavigatorBarCustom extends StatelessWidget {
  const BottomNavigatorBarCustom({super.key});

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      color: AppThemes.secondary,
      height: 60,
      child: BlocBuilder<NotesBloc, NoteState>(builder: (context, state) {
        if (state.selectedNotes.isEmpty) {
          return Row(children: [
            IconButton(
              icon: const Icon(Icons.settings),
              onPressed: () {
                Navigator.pushNamed(context, "/config");
              }, // Navigation code here
              color: AppThemes.primary,
            ),
          ]);
        }
        return Row(
          children: [
            IconButton(
              icon: const Icon(Icons.close),
              onPressed: () {
                context.read<NotesBloc>().add(DeselectAllNotesEvent());
              },
              color: AppThemes.primary,
            ),
            Text(
              "${state.selectedNotes.length} ${AppLocalizations.of(context).translate('selected_note')}",
              style: const TextStyle(fontSize: 20, color: AppThemes.primary),
            )
          ],
        );
      }),
    );
  }


}