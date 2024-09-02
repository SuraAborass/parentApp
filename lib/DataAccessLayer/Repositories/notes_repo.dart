import 'dart:convert';
import '../Clients/notes_client.dart';
import '../Models/note.dart';


class NotesRepo {
  NotesClient client = NotesClient();

  Future<List<Note>> getNotes(String token, int sonId) async {
    var response = await client.getNotes(token, sonId);
    if (response != "") {
      final data = json.decode(response).cast<Map<String, dynamic>>();
      return data.map<Note>((json) => Note.fromMap(json)).toList();
    }
    return [];
  }
}
