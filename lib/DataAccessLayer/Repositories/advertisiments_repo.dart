import 'dart:convert';
import 'package:http/http.dart' as http;

import '../Clients/advertisiments_client.dart';
import '../Models/advert.dart';



class AdvertsRepo {
  AdvertsClient client = AdvertsClient();

  Future<List<Advert>> getAdverts() async {
    var response = await client.getAdverts();
    if (response != "") {
      final jsonResponse = json.decode(response);
      if (jsonResponse['status'] == "true") {
        final data = jsonResponse['ads'].cast<Map<String, dynamic>>();
        return data.map<Advert>((json) => Advert.fromMap(json)).toList();
      } else {
        print('Error: Invalid response status');
      }
    } else {
      print('Error: Empty response');
    }
    return [];
  }
}