import 'dart:convert';
import '../Clients/absences_client.dart';
import '../Models/absence.dart';

class AbsencesRepo {
  AbsencesClient client = AbsencesClient();

  Future<List<Absence>> getAbsences(String token, int sonId) async {
    var response = await client.getAbsences(token, sonId);
    if (response != "") {
      final data = json.decode(response).cast<Map<String, dynamic>>();
      return data.map<Absence>((json) => Absence.fromMap(json)).toList();
    }
    return [];
  }

  Future<bool> justifyAbsence(int absenceId, String token, String justification) async {
    var response = await client.justifyAbsence(absenceId, token, justification);
    if (response['statusCode'] == 200) {
      return true;
    } else {
      return false;
    }
  }



}
