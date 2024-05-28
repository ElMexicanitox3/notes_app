import 'package:equatable/equatable.dart';
import 'package:notes_app/models/note_model.dart';

class NoteState extends Equatable {
  
  final List<Note> notes;

  const NoteState(this.notes);

  @override
  List<Object> get props => [notes];
}