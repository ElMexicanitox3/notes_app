import 'package:NoteHub/providers/blocs/blocs.dart';
import 'package:NoteHub/screens/home/components/components.dart';
import 'package:flutter/material.dart';
import 'package:NoteHub/themes/app_themes.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Homescreen extends StatelessWidget {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  Homescreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Disparar la carga de notas al abrir la pantalla 

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
            child: state.selectedNotes.isEmpty? const Icon(Icons.add, color: AppThemes.secondary,) : const Icon(Icons.delete),
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
                icon: const Icon(Icons.info),
                onPressed: () {
                  Navigator.pushNamed(context, "/about");
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

                BlocBuilder<ThemeBloc, ThemeState>(builder: (context, state) {
                  return Switch(
                    activeThumbImage: const AssetImage("lib/assets/img/moon.png"),
                    activeColor: AppThemes.secondary,
                    activeTrackColor: AppThemes.secondary,
                    inactiveThumbImage: const AssetImage("lib/assets/img/sun.png"),
                    inactiveThumbColor: AppThemes.secondary,
                    value: state.isDark,
                    onChanged: (value) {
                      context.read<ThemeBloc>().add(ToggleThemeEvent());
                    },
                  );
                }),

              ],
            ),
            const SearchBarCustom(),
          ],
        ),
      ),
      body: const Body(),
    );
  }
}
