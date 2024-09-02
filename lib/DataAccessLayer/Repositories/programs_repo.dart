import 'dart:convert';
import '../Clients/programs_client.dart';
import '../Models/program.dart';

class ProgramsRepo {
  ProgramsClient client = ProgramsClient();

  Future<List<Program>> getPrograms(String token, int sonId) async {
    var response = await client.getPrograms(token, sonId);
    if (response != "") {
      final data = json.decode(response).cast<Map<String, dynamic>>();
      return data.map<Program>((json) => Program.fromMap(json)).toList();
    }
    return [];
  }
}
