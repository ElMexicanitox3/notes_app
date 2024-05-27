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
  ];

}