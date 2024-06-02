import 'package:equatable/equatable.dart';
import 'package:notes_app/models/note_model.dart';

class NoteState extends Equatable {
  final List<Note> notes;
  final List<Note> selectedNotes;
  final String searchQuery;

  const NoteState(this.notes, [this.selectedNotes = const [], this.searchQuery = '']);

  @override
  List<Object> get props => [notes, selectedNotes];
}
