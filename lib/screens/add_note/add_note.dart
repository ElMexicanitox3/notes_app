import 'package:NoteHub/app_localizations.dart';
import 'package:NoteHub/helpers/helpers.dart';
import 'package:NoteHub/blocs/blocs.dart';
import 'package:NoteHub/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:NoteHub/models/note_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


class AddNote extends StatefulWidget {
  final Note? updateNote;

  const AddNote({super.key, this.updateNote});

  @override
  _AddNoteState createState() => _AddNoteState();
}

class _AddNoteState extends State<AddNote> {

  final TextEditingController _titleController = TextEditingController();
  final List<NoteContent> _contents = [];

  @override
  void initState() {
    super.initState();

    if (widget.updateNote != null) {
      _titleController.text = widget.updateNote!.title;
      for (var content in widget.updateNote!.content) {
        _contents.add(content);
      }
    } else {
      _contents.add(TextContent(""));
    }

  }

  void _save(BuildContext context) {

    if (_titleController.text.isEmpty) {
      return;
    }

    final Note note = Note(
      id: widget.updateNote?.id,
      title: _titleController.text,
      content: _contents,
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
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              
              Text(
                widget.updateNote == null? AppLocalizations.of(context).translate('add_note'): AppLocalizations.of(context).translate('update_note'),
              ),

              if (widget.updateNote != null)
                Text(
                  DateFormatter(context: context).formatDate(DateTime.parse(widget.updateNote!.updatedAt)),
                  style: TextStyle(
                    fontSize: 12,
                  ),
                ),
            ],
          ),
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
                    hintText: AppLocalizations.of(context)
                        .translate('title_note'),
                    border: InputBorder.none,
                  ),
                ),

                ...List.generate(_contents.length, (index) {
                  final content = _contents[index];
                  if (content is TextContent) {
                    return Row(
                      children: [
                        Expanded(
                          child: TextFormField(
                            // controller: _textControllers[index],
                            maxLines: null,
                            initialValue: content.text,
                            decoration: InputDecoration(
                              hintText: AppLocalizations.of(context).translate('content_note'),
                              border: InputBorder.none,
                            ),
                            keyboardType: TextInputType.multiline,
                            onChanged: (value) {
                              _contents[index] = TextContent(value);
                            },
                          ),
                        ),
                        IconButton(
                          icon: Icon(Icons.close),
                          onPressed: () {
                            setState(() {
                              _contents.removeAt(index);
                            });
                          },
                        ),
                      ],
                    );
                  } else if (content is TaskContent) {
                    return TaskWidget(
                      task: content.description,
                      isDone: content.isDone,
                      onUpdate: (value) {
                        setState(() {
                          _contents[index] = TaskContent(description: value, isDone: content.isDone);
                        });
                      },
                      onDelete: () {
                        setState(() {
                          _contents.removeAt(index);
                        });
                      },
                      onCheck: (isDone) {
                        setState(() {
                          _contents[index] = TaskContent(description: content.description, isDone: isDone);
                        });
                      },
                    );
                  } else {
                    return Text("Unknown content type");
                  }
                }).toList(),

              ],
            ),
          ),
        ),
        bottomSheet: Row(
          children: [
            IconButton(
              icon: Icon(Icons.text_fields),
              onPressed: () {

                if (_contents.isNotEmpty && _contents.last is TextContent) {
                  return;
                }

                setState(() {
                  _contents.add(TextContent(""));
                });

              },
            ),
            IconButton(
              icon: Icon(Icons.check_box_outlined),
              onPressed: () {
                setState(() {
                  _contents.add(TaskContent(description: "", isDone: false));
                });
              },
            ),
          ],
        ),
      ),
    );
  }
}
