import 'package:NoteHub/themes/app_themes.dart';
import 'package:flutter/material.dart';

class TaskWidget extends StatefulWidget {

  final String task;
  final bool isDone;
  final Function(bool) onCheck;
  final Function() onDelete;
  final Function(String) onUpdate;
  const TaskWidget({super.key, required this.task, required this.isDone, required this.onCheck, required this.onDelete, required this.onUpdate});

  @override
  State<TaskWidget> createState() => _TaskWidgetState();
}

class _TaskWidgetState extends State<TaskWidget> {

  final TextEditingController _controller = TextEditingController();
  
  @override
  void initState() {
    _controller.text = widget.task;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Checkbox(
          value: widget.isDone, 
          onChanged: (e)=> widget.onCheck(e!),
          activeColor: AppThemes.primary,
        ),
        Expanded(
          child: TextField(
            controller: _controller,
            onChanged: (value) => widget.onUpdate(value),
            decoration: const InputDecoration(
              hintText: "Task",
              border: InputBorder.none,
            ),
          ),
        ),
        IconButton(
          icon: Icon(Icons.close),
          onPressed: () => widget.onDelete(),
        ),
      ],
    );
  }
}