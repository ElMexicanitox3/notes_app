import 'package:NoteHub/providers/blocs/lang_bloc/language_bloc.dart';
import 'package:NoteHub/providers/blocs/notes_bloc/note.dart';
import 'package:NoteHub/providers/blocs/theme_bloc/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:NoteHub/screens/about/about.dart';
import 'package:NoteHub/screens/screens.dart';
import 'package:NoteHub/models/note_model.dart';
import 'app_localizations.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

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
          create: (context) {
            return NotesBloc();
          },
        ),
        BlocProvider<LanguageBloc>(
          create: (context) => LanguageBloc(),
        ),
      ],
      child: BlocBuilder<ThemeBloc, ThemeState>(
        builder: (context, state) {
          return BlocBuilder<LanguageBloc, LanguageState>(
            builder: (context, langState) {
              return MaterialApp(
                debugShowCheckedModeBanner: false,
                title: 'Flutter Demo',
                theme: state.themeData,
                locale: langState.locale,
                supportedLocales: [
                  Locale('en', 'US'),
                  Locale('es', 'ES'),
                ],
                localizationsDelegates: [
                  AppLocalizations.delegate,
                  GlobalMaterialLocalizations.delegate,
                  GlobalWidgetsLocalizations.delegate,
                ],
                routes: {
                  "/home": (context) => Homescreen(),
                  "/about": (context) => AboutScreen(),
                  "/config": (context) => ConfigScreen(),
                },
                onGenerateRoute: (settings) {
                  if (settings.name == '/add_note') {
                    final Note? note = settings.arguments as Note?;
                    return MaterialPageRoute(
                      builder: (context) {
                        return AddNote(
                          updateNote: note,
                        );
                      },
                    );
                  }
                  return null;
                },
                home: Homescreen(),
              );
            },
          );
        },
      ),
    );
  }
}
