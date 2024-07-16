import 'package:flutter/material.dart';

class TaskWidget extends StatefulWidget {

  final String task;
  final bool isDone;
  final Function(bool) onCheck;
  const TaskWidget({super.key, required this.task, required this.isDone, required this.onCheck});

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
        Checkbox(value: widget.isDone, onChanged: (e){}),
        Expanded(
          child: TextField(
            controller: _controller,
            decoration: const InputDecoration(
              hintText: "Task",
              border: InputBorder.none,
            ),
          ),
        ),
        IconButton(
          icon: Icon(Icons.close),
          onPressed: () => {},
        ),
      ],
    );
  }
}