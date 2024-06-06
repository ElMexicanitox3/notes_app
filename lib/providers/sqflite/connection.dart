import 'dart:io';

import 'package:NoteHub/models/note_model.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DBProvider {

  // Singleton instance
  static final DBProvider instance = DBProvider._init();

  // Database instance
  static Database? _database;

  // Private constructor
  DBProvider._init();

  // Database name and version
  static const String dbname = 'note_app.db';
  static const int versiondb = 1;

  // Get the path for saving the database
  Future<String> getPath() async {
    Directory documentsDirectory = await getApplicationDocumentsDirectory();
    return join(documentsDirectory.path, dbname);
  }

  // Get the database (initialize if not already initialized)
  Future<Database> get database async {
    if (_database != null) return _database!;

    _database = await _initDB();
    return _database!;
  }

  // Initialize the database
  Future<Database> _initDB() async {
    String path = await getPath();
    return await openDatabase(
      path,
      version: versiondb,
      onOpen: (db) {},
      onCreate: (Database db, int version) async {
        await db.execute('''
          CREATE TABLE notes (
            id INTEGER PRIMARY KEY,
            title TEXT,
            content TEXT,
            created_at TEXT,
            updated_at TEXT
          )
        ''');
      },
    );
  }

  // Insert a new note
  Future<int> insertNote(Note note) async {
    final db = await instance.database;
    return await db.insert('notes', note.toJson());
  }

  // Update an existing note
  Future<int> updateNote(Note note) async {
    final db = await instance.database;
    return await db.update(
      'notes',
      note.toJson(),
      where: 'id = ?',
      whereArgs: [note.id],
    );
  }

  // Get all notes
  Future<List<Note>> getNotes() async {
    final db = await instance.database;
    final result = await db.query('notes');
    return result.map((json) => Note.fromJson(json)).toList();
  }

  // Close the database
  Future close() async {
    final db = await instance.database;
    db.close();
  }

  // Delete a note
  Future<int> deleteNote(int id) async {
    final db = await instance.database;
    return await db.delete(
      'notes',
      where: 'id = ?',
      whereArgs: [id],
    );
  }

  // search notes where title or content contains the query
  Future<List<Note>> searchNotes(String query) async {
    final db = await instance.database;
    final result = await db.rawQuery('''
      SELECT * FROM notes
      WHERE title LIKE '%$query%' OR content LIKE '%$query%'
    ''');
    return result.map((json) => Note.fromJson(json)).toList();
  }
  
}
