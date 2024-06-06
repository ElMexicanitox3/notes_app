import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:NoteHub/providers/blocs/notes_bloc/note_bloc.dart';
import 'package:NoteHub/providers/blocs/notes_bloc/note_event.dart';
import 'package:NoteHub/providers/blocs/notes_bloc/note_state.dart';
import 'package:NoteHub/themes/app_themes.dart';

class SearchBarCustom extends StatelessWidget {
  const SearchBarCustom({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NotesBloc, NoteState>(
      builder: (context, state) {
        return Padding(
          padding: const EdgeInsets.all(10),
          child: SizedBox(
            width: double.infinity,
            child: Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30),
              ),
              color: const Color.fromARGB(255, 40, 40, 40),
              child: Row(
                children: [
                  const SizedBox(width: 10),
                  IconButton(
                    icon: const Icon(Icons.search),
                    iconSize: 30,
                    color: AppThemes.w,
                    onPressed: () {},
                  ),
                  Expanded(
                    child: TextField(
                      onChanged: (value) {
                        context.read<NotesBloc>().add(SearchNotesEvent(value));
                      },
                      style: const TextStyle(color: AppThemes.primary),
                      decoration: const InputDecoration(
                        border: InputBorder.none,
                        contentPadding: EdgeInsets.symmetric(horizontal: 15),
                      ),
                    ),
                  ),
                  // IconButton(
                  //   icon: const Icon(Icons.filter_list),
                  //   color: AppThemes.w,
                  //   iconSize: 30,
                  //   onPressed: () {},
                  // ),
                  const SizedBox(width: 10),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
