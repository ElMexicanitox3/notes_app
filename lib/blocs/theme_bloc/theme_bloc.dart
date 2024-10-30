import 'package:bloc/bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'theme_event.dart';
import 'theme_state.dart';

class ThemeBloc extends Bloc<ThemeEvent, ThemeState> {
  ThemeBloc() : super(LightThemeState()) {
    on<ToggleThemeEvent>((event, emit) async {
      if (state is LightThemeState) {
        emit(DarkThemeState());
      } else {
        emit(LightThemeState());
      }
      // Guardar el estado del tema en SharedPreferences
      final prefs = await SharedPreferences.getInstance();
      await prefs.setBool('isDark', state is DarkThemeState);
    });
    _loadTheme();
  }

  void _loadTheme() async {
    final prefs = await SharedPreferences.getInstance();
    final isDark = prefs.getBool('isDark') ?? false;
    if (isDark) {
      add(ToggleThemeEvent());  // Añadir el evento para cambiar el tema
    }
  }
}
