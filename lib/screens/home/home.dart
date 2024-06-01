import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes_app/providers/blocs/notes_bloc/note_bloc.dart';
import 'package:notes_app/providers/blocs/notes_bloc/note_event.dart';
import 'package:notes_app/providers/blocs/notes_bloc/note_state.dart';
import 'package:notes_app/screens/home/components/search_bar.dart';
import 'package:notes_app/themes/app_themes.dart';
import '../../widgets/widgets.dart';

class Homescreen extends StatelessWidget {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  Homescreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Disparar la carga de notas al abrir la pantalla
    context.read<NotesBloc>().add(GetNotesEvent());

    return Scaffold(
      key: _scaffoldKey,
      floatingActionButtonLocation: FloatingActionButtonLocation.endDocked,
      floatingActionButton: BlocBuilder<NotesBloc, NoteState>(
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
            child: state.selectedNotes.isEmpty? const Icon(Icons.add) : const Icon(Icons.delete),
          );
        },
      ),
      bottomNavigationBar: BottomAppBar(
        color: AppThemes.secondary,
        height: 60,
        child: BlocBuilder<NotesBloc, NoteState>(builder: (context, state) {
          if (state.selectedNotes.isEmpty) {
            return Row(children: [
              IconButton(
                icon: const Icon(Icons.settings),
                onPressed: () {}, // Navigation code here
                color: AppThemes.primary,
              ),
              IconButton(
                icon: const Icon(Icons.camera_alt),
                onPressed: () {}, // Navigation code here
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
                "${state.selectedNotes.length} Selected",
                style: const TextStyle(fontSize: 20, color: AppThemes.primary),
              )
            ],
          );
        }),
      ),
      appBar: AppBar(
        automaticallyImplyLeading: false,
        toolbarHeight: 120,
        title: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  "Notes App",
                  style: TextStyle(
                    color: AppThemes.primary,
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                // Switch for theme change, implement functionality based on ThemeBloc
                Switch(
                  activeThumbImage: const AssetImage("lib/assets/img/moon.png"),
                  inactiveThumbImage:
                      const AssetImage("lib/assets/img/sun.png"),
                  inactiveThumbColor: AppThemes.secondary,
                  value: false,
                  onChanged: (value) {
                    // BlocProvider.of<ThemeBloc>(context).add(
                    //   value ? DarkThemeEvent() : LightThemeEvent()
                    // );
                  },
                ),
              ],
            ),
            const SearchBarCustom(),
          ],
        ),
      ),
      body: SingleChildScrollView(
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
      ),
    );
  }
}
