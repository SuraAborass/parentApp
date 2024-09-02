import 'dart:convert';
import '../Clients/subjects_client.dart';
import '../Models/homework.dart';
import '../Models/subject.dart';


class SubjectsRepo {
  SubjectsClient client = SubjectsClient();

  Future<List<Subject>> getSubjects(String token, int sonId) async {
    var response = await client.getSubjects(token, sonId);
    if (response != "") {
      final List<dynamic> data = json.decode(response);
      return data.map<Subject>((json) => Subject.fromMap(json)).toList();
    }
    return [];
  }

  Future<List<Homework>> getHomeworks(int subjectId, int sonId, String token) async {
    var response = await client.getHomeworks(subjectId, sonId, token);
    if (response != "") {
      final List<dynamic> data = json.decode(response);
      return data.map<Homework>((json) => Homework.fromMap(json)).toList();
    }
    return [];
  }
}

