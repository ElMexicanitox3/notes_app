import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes_app/screens/screens.dart';
import 'providers/blocs/theme_bloc/theme_bloc.dart';
import 'providers/blocs/theme_bloc/theme_state.dart';
import 'providers/blocs/notes_bloc/note_bloc.dart'; // Asegúrate de importar correctamente tu NotesBloc

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<ThemeBloc>(
          create: (context) => ThemeBloc(),
        ),
        BlocProvider<NotesBloc>(
          create: (context) => NotesBloc(),
        ),
      ],
      child: BlocBuilder<ThemeBloc, ThemeState>(
        builder: (context, state) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'Flutter Demo',
            theme: state.themeData,
            routes: {
              "/home": (context) => Homescreen(),
              "/add_note": (context) => AddNote(),
            },
            home: Homescreen(),
          );
        },
      ),
    );
  }
}
