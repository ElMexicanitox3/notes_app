import 'package:NoteHub/app_localizations.dart';
import 'package:NoteHub/helpers/helpers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:NoteHub/models/note_model.dart';
import 'package:NoteHub/providers/blocs/notes_bloc/note.dart';


class AddNote extends StatefulWidget {
  final Note? updateNote;

  const AddNote({super.key, this.updateNote});

  @override
  _AddNoteState createState() => _AddNoteState();
}

class _AddNoteState extends State<AddNote> {
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _contentController = TextEditingController();

  @override
  void initState() {
    super.initState();
    if (widget.updateNote != null) {
      _titleController.text = widget.updateNote!.title ?? "";
      _contentController.text = widget.updateNote!.content ?? "";
    }
  }

  void _save(BuildContext context) {

    final String title = _titleController.text.trim();
    final String content = _contentController.text.trim();

    if (title.isEmpty && content.isEmpty) {
      return;
    }

    final Note note = Note(
      id: widget.updateNote?.id,
      title: title,
      content: content,
      createdAt: widget.updateNote?.createdAt ?? DateTime.now().toString(),
      updatedAt: DateTime.now().toString(),
    );

    if (widget.updateNote == null) {
      context.read<NotesBloc>().add(AddNoteEvent(note));
    } else {
      context.read<NotesBloc>().add(UpdateNoteEvent(note));
    }

  }

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: true,
      onPopInvoked: (didPop) => _save(context),
      child: Scaffold(
        appBar: AppBar(
          title: Column(
            children: [
              Text(
                widget.updateNote == null ? AppLocalizations.of(context).translate('add_note') : AppLocalizations.of(context).translate('update_note'),
              ),
              if (widget.updateNote != null)...[
                Text(
                  DateFormatter.formatDate(DateTime.parse(widget.updateNote!.updatedAt ?? "")),
                  style: TextStyle(
                    fontSize: 12,
                    color: Colors.white,
                  ),                 
                ),
              ]
            ],
          )
        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: SingleChildScrollView(
            child: Column(
              children: [
            
            
                TextField(
                  controller: _titleController,
                  maxLines: 1,
                  keyboardType: TextInputType.multiline,
                  decoration: InputDecoration(
                    hintText: AppLocalizations.of(context).translate('title_note'),
                    border: InputBorder.none,
                  ),
                ),
            
                TextField(
                  controller: _contentController,
                  maxLines: null,
                  decoration: InputDecoration(
                    hintText: AppLocalizations.of(context).translate('content_note'),
                    border: InputBorder.none,
                  ),
                  keyboardType: TextInputType.multiline,
                ),
            
            
              ],
            ),
          ),
        ),
      ),
    );
  }
}
