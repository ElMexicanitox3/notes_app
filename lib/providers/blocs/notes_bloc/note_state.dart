import 'package:equatable/equatable.dart';
import 'package:notes_app/models/note_model.dart';

class NoteState extends Equatable {
  final List<Note> notes;
  final List<Note> selectedNotes;

  const NoteState(this.notes, [this.selectedNotes = const []]);

  @override
  List<Object> get props => [notes, selectedNotes];
}
