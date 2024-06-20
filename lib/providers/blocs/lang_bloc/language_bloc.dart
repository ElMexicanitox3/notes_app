import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'language_event.dart';
part 'language_state.dart';

class LanguageBloc extends Bloc<LanguageEvent, LanguageState> {
  LanguageBloc() : super(LanguageInitial()) {
    on<ChangeLanguageEvent>((event, emit) async {
      emit(LanguageChanged(event.languageCode));
      _saveLanguage(event.languageCode);
    });
    _loadLanguage();
  }

  void _saveLanguage(String languageCode) async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setString('languageCode', languageCode);
  }

  void _loadLanguage() async {
    final prefs = await SharedPreferences.getInstance();
    final languageCode = prefs.getString('languageCode') ?? 'en';
    add(ChangeLanguageEvent(languageCode));
  }
}
