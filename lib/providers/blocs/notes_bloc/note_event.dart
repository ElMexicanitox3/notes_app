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

class UpdateNoteEvent extends NoteEvent {
  final Note note;

  const UpdateNoteEvent(this.note);

  @override
  List<Object> get props => [note];
}

class SelectNoteEvent extends NoteEvent {
  final Note note;

  const SelectNoteEvent(this.note);

  @override
  List<Object> get props => [note];
}

class DeselectNoteEvent extends NoteEvent {
  final Note note;

  const DeselectNoteEvent(this.note);

  @override
  List<Object> get props => [note];
}

class DeselectAllNotesEvent extends NoteEvent {}

