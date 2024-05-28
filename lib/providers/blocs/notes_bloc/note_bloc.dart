import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes_app/models/note_model.dart';
import 'package:notes_app/providers/blocs/notes_bloc/note_event.dart';
import 'package:notes_app/providers/blocs/notes_bloc/note_state.dart';
import 'package:notes_app/providers/sqflite/connection.dart';

class NotesBloc extends Bloc<NoteEvent, NoteState>{
  
  NotesBloc() : super(const NoteState([])) { // Asumiendo que el estado inicial es una lista vacía
    on<GetNotesEvent>(_onGetNotes);
    on<AddNoteEvent>(_onAddNote);
  }

  // Handler para obtener notas de la base de datos
  Future<void> _onGetNotes(GetNotesEvent event, Emitter<NoteState> emit) async {
    try {
      List<Note>? notes = await DBProvider.instance.getNotes();
      // print(notes);
      // convertirmos la lista de notas en un estado de notas
      
      emit(NoteState(notes));
      
    } catch (error) {
      // Aquí puedes manejar errores, por ejemplo, enviando un estado de error
      emit(const NoteState([]));
    }
  }

  // Handler para añadir una nota a la base de datos
  Future<void> _onAddNote(AddNoteEvent event, Emitter<NoteState> emit) async {
    try {
      await DBProvider.instance.insertNote(event.note);
      List<Note> updatedNotes = await DBProvider.instance.getNotes();
      emit(NoteState(updatedNotes));
    } catch (error) {
      // Aquí también puedes manejar errores
      emit(state); // Reemitir el estado actual para manejar un posible error
    }
  }


}