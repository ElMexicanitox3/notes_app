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
    Note(
      title: 'Note 4',
      content: 'Content 4',
    ),
    Note(
      title: 'Note 5',
      content: 'Content 5',
    ),
    Note(
      title: 'Note 6',
      content: 'Content 6',
    ),
    Note(
      title: 'Note 7',
      content: 'Content 7',
    ),
    Note(
      title: 'Note 8',
      content: 'Content 8',
    ),
    Note(
      title: 'Note 9',
      content: 'Content 9',
    ),
    Note(
      title: 'Note 10',
      content: 'Content 10',
    ),
  ];

}