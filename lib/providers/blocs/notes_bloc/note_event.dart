import 'package:equatable/equatable.dart';
import 'package:notes_app/models/note_model.dart';

abstract class NoteEvent extends Equatable {
  const NoteEvent();

  @override
  List<Object> get props => [];
}

class GetNotesEvent extends NoteEvent {}

class AddNoteEvent extends NoteEvent {
  final Note note;

  const AddNoteEvent(this.note);

  @override
  List<Object> get props => [note];
}
