import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes_app/providers/blocs/notes_bloc/note_bloc.dart';
import 'package:notes_app/providers/blocs/notes_bloc/note_event.dart';
import 'package:notes_app/providers/blocs/notes_bloc/note_state.dart';
import 'package:notes_app/screens/home/components/menu.dart';
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
      drawer: const MenuWidget(),
      floatingActionButtonLocation: FloatingActionButtonLocation.endDocked,
      floatingActionButton: FloatingActionButton(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(40),
        ),
        onPressed: () {
          Navigator.pushNamed(context, "/add_note");
        },
        backgroundColor: AppThemes.primary,
        child: const Icon(Icons.add),
      ),
      bottomNavigationBar: BottomAppBar(
        color: AppThemes.secondary,
        height: 60,
        child: Row(
          children: [
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
          ],
        ),
      ),
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Row(
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
              inactiveThumbImage: const AssetImage("lib/assets/img/sun.png"),
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
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          children: [
            const SearchBarCustom(),
            BlocBuilder<NotesBloc, NoteState>(
              builder: (context, state) {
                if (state.notes.isEmpty) {
                  return const Text("No notes found.");
                }
                return Column(
                  children: state.notes.map(
                    (note) => InkWell(
                      onTap: () {
                        Navigator.pushNamed(context, "/add_note", arguments: note);
                      },
                      child: NoteWidget(note: note)
                    )
                  ).toList(),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
