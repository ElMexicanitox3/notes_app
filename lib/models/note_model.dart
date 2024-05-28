class Note {
  final int? id;
  final String? title;
  final String? content;
  final String? createdAt;
  final String? updatedAt;

  Note({
    this.id,
    this.title,
    this.content,
    this.createdAt,
    this.updatedAt,
  });

  // Convert Note to JSON
  Map<String, dynamic> toJson() => {
    'id': id,
    'title': title,
    'content': content,
    'created_at': createdAt,
    'updated_at': updatedAt,
  };

  // Create Note from JSON
  factory Note.fromJson(Map<String, dynamic> json) => Note(
    id: json['id'] as int?,
    title: json['title'] as String?,
    content: json['content'] as String?,
    createdAt: json['created_at'] as String?,
    updatedAt: json['updated_at'] as String?,
  );

  static List<Note> get notes => [
    Note(
      title: 'Note 1',
      content: 'Content 1',
    ),
    Note(
      title: 'Note 2',
      content: 'Content 2',
    ),
    Note(
      title: 'Note 3',
      content: 'Content 3',
    ),
    Note(
      title: 'Note 3',
      content: 'Content 3',
    ),
    Note(
      title: 'Note 3',
      content: 'Content 3',
    ),
    Note(
      title: 'Note 3',
      content: 'Content 3',
    ),
    Note(
      title: 'Note 3',
      content: 'Content 3',
    ),
    Note(
      title: 'Note 3',
      content: 'Content 3',
    ),
    Note(
      title: 'Note 3',
      content: 'Content 3',
    ),
    Note(
      title: 'Note 3',
      content: 'Content 3',
    ),
    Note(
      title: 'Note 3',
      content: 'Content 3',
    ),
    Note(
      title: 'Note 3',
      content: 'Content 3',
    ),
    Note(
      title: 'Note 3',
      content: 'Content 3',
    ),
    Note(
      title: 'Note 3',
      content: 'Content 3',
    ),
    Note(
      title: 'Note 3',
      content: 'Content 3',
    ),
    Note(
      title: 'Note 3',
      content: 'Content 3',
    ),
    Note(
      title: 'Note 3',
      content: 'Content 3',
    ),
    Note(
      title: 'Note 3',
      content: 'Content 3',
    ),
    Note(
      title: 'Note 3',
      content: 'Content 3',
    ),
  ];

}