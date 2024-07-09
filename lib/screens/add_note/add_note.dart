import 'package:NoteHub/app_localizations.dart';
import 'package:NoteHub/helpers/helpers.dart';
import 'package:NoteHub/widgets/widgets.dart';
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
  final List<TextEditingController> _textControllers = [];
  final List<NoteContent> _contents = [
    TextContent(""),
    TaskContent(description: "xd", isDone: true),
  ];

  @override
  void initState() {
    super.initState();
    context.read<NotesBloc>().add(LoadContentsEvent(_contents));
    if (widget.updateNote != null) {
      _titleController.text = widget.updateNote!.title ?? "";
      // _contentController.text = "";
    }
  }

  void _save(BuildContext context) {

    final String title = _titleController.text.trim();
    // final String content = _contentController.text.trim();

    // if (title.isEmpty && content.isEmpty) {
    //   return;
    // }

    // final Note note = Note(
    //   id: widget.updateNote?.id,
    //   title: title,
    //   content: content,
    //   createdAt: widget.updateNote?.createdAt ?? DateTime.now().toString(),
    //   updatedAt: DateTime.now().toString(),
    // );

    // if (widget.updateNote == null) {
    //   context.read<NotesBloc>().add(AddNoteEvent(note));
    // } else {
    //   context.read<NotesBloc>().add(UpdateNoteEvent(note));
    // }

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
                widget.updateNote == null ? AppLocalizations.of(context).translate('add_note') : AppLocalizations.of(context).translate('update_note'),
              ),
              if (widget.updateNote != null)...[
                Text(
                  DateFormatter(context: context).formatDate(DateTime.parse(widget.updateNote!.updatedAt ?? "")),
                  style: TextStyle(
                    fontSize: 12,
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

                // BlocBuilder<NotesBloc, NoteState>(
                //   builder: (context, state) {
                //     print(state.contents);
                //     return Column(
                //       children: state.contents.map((e) {
                //         if (e is TextContent) {
                //           final index = state.contents.indexOf(e);
                //           _textControllers.add(TextEditingController());
                //           _textControllers[index].text = e.text;
                //           return TextField(
                //             controller: _textControllers[index],
                //             maxLines: null,
                //             decoration: InputDecoration(
                //               hintText: AppLocalizations.of(context).translate('content_note'),
                //               border: InputBorder.none,
                //             ),
                //             keyboardType: TextInputType.multiline,
                //           );
                //         } else if (e is TaskContent) {
                //           return TaskWidget(task: e.description, isDone: e.isDone, onCheck: (x){}, );
                //         } else {
                //           return Text("Unknown content type");
                //         }
                //       }).toList(),
                //     );
                //   }
                // ),

                ..._contents.map((e) {
                  if (e is TextContent) {
                    final index = _contents.indexOf(e);
                    _textControllers.add(TextEditingController());
                    _textControllers[index].text = e.text;
                    return TextField(
                      
                      controller: _textControllers[index],
                      maxLines: null,
                      decoration: InputDecoration(
                        hintText: AppLocalizations.of(context).translate('content_note'),
                        border: InputBorder.none,
                      ),
                      keyboardType: TextInputType.multiline,
                    );
                  } else if (e is TaskContent) {
                    return TaskWidget(task: e.description, isDone: e.isDone, onCheck: (x){},);
                  } else {
                    return Text("Unknown content type");
                  }
                }).toList(),
            
                // TextField(
                //   controller: _contentController,
                //   maxLines: null,
                //   decoration: InputDecoration(
                //     hintText: AppLocalizations.of(context).translate('content_note'),
                //     border: InputBorder.none,
                //   ),
                //   keyboardType: TextInputType.multiline,
                // ),

                
            
            
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
