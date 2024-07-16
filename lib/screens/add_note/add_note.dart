import 'package:NoteHub/app_localizations.dart';
import 'package:NoteHub/helpers/helpers.dart';
import 'package:NoteHub/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:NoteHub/models/note_model.dart';


class AddNote extends StatefulWidget {
  final Note? updateNote;

  const AddNote({super.key, this.updateNote});

  @override
  _AddNoteState createState() => _AddNoteState();
}

class _AddNoteState extends State<AddNote> {
  final TextEditingController _titleController = TextEditingController();
  final List<TextEditingController> _textControllers = [];
  final List<NoteContent> _contents = [];

  @override
  void initState() {
    super.initState();

    if (widget.updateNote != null) {
      _titleController.text = widget.updateNote!.title ?? "";
      for (var content in widget.updateNote!.contents) {
        _contents.add(content);
        if (content is TextContent) {
          _textControllers.add(TextEditingController(text: content.text));
        }
      }
    } else {
      _contents.add(TextContent(""));
      _textControllers.add(TextEditingController());
    }

  }

  void _save(BuildContext context) {
    // Guardar la nota
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
                  DateFormatter(context: context).formatDate(DateTime.parse(widget.updateNote!.updatedAt ?? "")),
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
                    return TextField(
                      controller: _textControllers[index],
                      maxLines: null,
                      decoration: InputDecoration(
                        hintText: AppLocalizations.of(context)
                            .translate('content_note'),
                        border: InputBorder.none,
                      ),
                      keyboardType: TextInputType.multiline,
                      onChanged: (value) {
                        _contents[index] = TextContent(value);
                      },
                    );
                  } else if (content is TaskContent) {
                    return TaskWidget(
                      task: content.description,
                      isDone: content.isDone,
                      onCheck: (isDone) {
                        setState(() {
                          _contents[index] =
                              TaskContent(description: content.description, isDone: isDone);
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
                setState(() {
                  _contents.add(TextContent(""));
                  _textControllers.add(TextEditingController());
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
