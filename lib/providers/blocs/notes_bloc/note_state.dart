import 'package:equatable/equatable.dart';
import 'package:NoteHub/models/note_model.dart';

class NoteState extends Equatable {

  final List<Note> notes;
  final List<Note> selectedNotes;
  final String searchQuery;

  //Content of the note
  final List<NoteContent> contents;

  const NoteState(this.notes, [this.selectedNotes = const [], this.searchQuery = '', this.contents = const []]);

  @override
  List<Object> get props => [notes, selectedNotes];
}
