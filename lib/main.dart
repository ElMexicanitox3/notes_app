import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:NoteHub/blocs/lang_bloc/language_bloc.dart';
import 'package:NoteHub/blocs/notes_bloc/note.dart';
import 'package:NoteHub/blocs/theme_bloc/theme.dart';
import 'package:NoteHub/screens/about/about.dart';
import 'package:NoteHub/screens/screens.dart';
import 'package:NoteHub/models/note_model.dart';
import 'app_localizations.dart';

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
        builder: (context, themeState) {
          return BlocBuilder<LanguageBloc, LanguageState>(
            builder: (context, languageState) {
              return MaterialApp(
                debugShowCheckedModeBanner: false,
                title: 'NoteHub',
                theme: themeState.themeData,
                locale: languageState is LanguageChanged
                    ? Locale(languageState.languageCode)
                    : Locale('en'),
                supportedLocales: [
                  Locale('en', 'US'),
                  Locale('es', 'ES'),
                ],
                localizationsDelegates: [
                  AppLocalizations.delegate,
                  GlobalMaterialLocalizations.delegate,
                  GlobalWidgetsLocalizations.delegate,
                  GlobalCupertinoLocalizations.delegate, // Añadir este delegado
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
