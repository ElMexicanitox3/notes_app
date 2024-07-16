import 'dart:convert';

abstract class NoteContent {
  Map<String, dynamic> toJson();
}

class TextContent extends NoteContent {
  final String text;

  TextContent(this.text);

  @override
  Map<String, dynamic> toJson() => {
    'type': 'text',
    'text': text,
  };

  factory TextContent.fromJson(Map<String, dynamic> json) => TextContent(
    json['text'] as String,
  );

}

class TaskContent extends NoteContent {
  // final int id;
  late final String description;
  late final bool isDone;

  TaskContent({
    // required this.id,
    required this.description,
    required this.isDone,
  });

  @override
  Map<String, dynamic> toJson() => {
    'type': 'task',
    // 'id': id,
    'description': description,
    'is_done': isDone,
  };

  factory TaskContent.fromJson(Map<String, dynamic> json) => TaskContent(
    // id: json['id'] as int,
    description: json['description'] as String,
    isDone: json['is_done'] as bool,
  );
}

class Note {
  
  final int? id;
  final String title;
  final String createdAt;
  final String updatedAt;
  final List<NoteContent> content;

  Note({
    this.id,
    required this.title,
    required this.createdAt,
    required this.updatedAt,
    required this.content,
  });

  Map<String, dynamic> toJson() => {
    'id': id,
    'title': title,
    'created_at': createdAt,
    'updated_at': updatedAt,
    'content': jsonEncode(content.map((content) => content.toJson()).toList()),
  };

  factory Note.fromJson(Map<String, dynamic> json) => Note(
    id: json['id'] as int,
    title: json['title'] as String,
    createdAt: json['created_at'],
    updatedAt: json['updated_at'],
    // _TypeError (type 'String' is not a subtype of type 'List<dynamic>' in type cast)
    content: (jsonDecode(json['content']) as List).map((contentJson) {
      if (contentJson['type'] == 'text') {
        return TextContent.fromJson(contentJson as Map<String, dynamic>);
      } else if (contentJson['type'] == 'task') {
        return TaskContent.fromJson(contentJson as Map<String, dynamic>);
      } else {
        throw Exception('Unknown content type');
      }
    }).toList(),
  );

  Note copyWith({
    int? id,
    String? title,
    String? createdAt,
    String? updatedAt,
    List<NoteContent>? content,
  }) {
    return Note(
      id: id ?? this.id,
      title: title ?? this.title,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      content: content ?? this.content,
    );
  }

  static List<Note> get notes => [
    Note(
      id: 1,
      title: 'Note 1',
      createdAt: DateTime.now().toString(),
      updatedAt: DateTime.now().toString(),
      content: [
        TextContent('This is some text.'),
        // TaskContent(id: 1, description: 'Task 1', isDone: false),
        TaskContent(description: 'Task 1', isDone: false),
        TextContent('Some more text.'),
        // TaskContent(id: 2, description: 'Task 2', isDone: true),
        TaskContent(description: 'Task 2', isDone: true),
      ],
    ),
    Note(
      id: 2,
      title: 'Note 2',
      createdAt: DateTime.now().toString(),
      updatedAt: DateTime.now().toString(),
      content: [
        TextContent('Another text content.'),
        // TaskContent(id: 3, description: 'Another task', isDone: false),
        TaskContent(description: 'Another task', isDone: false),
      ],
    ),
  ];
}
