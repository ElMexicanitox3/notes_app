import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes_app/models/note_model.dart';
import 'package:notes_app/providers/blocs/notes_bloc/note_event.dart';
import 'package:notes_app/providers/blocs/notes_bloc/note_state.dart';
import 'package:notes_app/providers/sqflite/connection.dart';

class NotesBloc extends Bloc<NoteEvent, NoteState>{
  
  NotesBloc() : super(const NoteState([])) {
    on<GetNotesEvent>(_onGetNotes);
    on<AddNoteEvent>(_onAddNote);
    on<UpdateNoteEvent>(_onUpdateNote);
    on<SelectNoteEvent>(_onSelectNote);
    on<DeselectNoteEvent>(_onDeselectNote);
    on<DeselectAllNotesEvent>(_onDeselectAllNotes);
  }

  Future<void> _onGetNotes(GetNotesEvent event, Emitter<NoteState> emit) async {
    try {
      List<Note>? notes = await DBProvider.instance.getNotes();
      emit(NoteState(notes));
    } catch (error) {
      emit(const NoteState([]));
    }
  }

  Future<void> _onAddNote(AddNoteEvent event, Emitter<NoteState> emit) async {
    try {
      await DBProvider.instance.insertNote(event.note);
      List<Note> updatedNotes = await DBProvider.instance.getNotes();
      emit(NoteState(updatedNotes));
    } catch (error) {
      emit(state);
    }
  }

  Future<void> _onUpdateNote(UpdateNoteEvent event, Emitter<NoteState> emit) async {
    try {
      await DBProvider.instance.updateNote(event.note);
      List<Note> updatedNotes = await DBProvider.instance.getNotes();
      emit(NoteState(updatedNotes));
    } catch (error) {
      emit(state);
    }
  }

  void _onSelectNote(SelectNoteEvent event, Emitter<NoteState> emit) {
    final updatedSelectedNotes = List<Note>.from(state.selectedNotes)..add(event.note);
    emit(NoteState(state.notes, updatedSelectedNotes));
  }

  void _onDeselectNote(DeselectNoteEvent event, Emitter<NoteState> emit) {
    final updatedSelectedNotes = List<Note>.from(state.selectedNotes)..remove(event.note);
    emit(NoteState(state.notes, updatedSelectedNotes));
  }

  void _onDeselectAllNotes(DeselectAllNotesEvent event, Emitter<NoteState> emit) {
    emit(NoteState(state.notes, []));
  }
}
