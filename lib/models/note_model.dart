class Note {
  final String title;
  final String content;

  Note({
    required this.title,
    required this.content,
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