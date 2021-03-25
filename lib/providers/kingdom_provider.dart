import 'dart:convert';

import 'package:myapp/models/kingdom.dart';
import 'package:http/http.dart' as http;
import 'package:myapp/providers/global.dart';

class KingdomProvider {
  //contiene todas las variables globales
  Global global = Global();

  //retorna el reino segun el id
  Future<Kingdom> getKingdom(int id) async {
    final url = Uri.https(global.url,
        "${global.urlPart}/kingdoms/${id.toString()}", {"token": global.token});

    final response = await http.get(url);
    print("Status Code: ${response.statusCode}");

    Kingdom kingdom = Kingdom.fromJsonMap(jsonDecode(response.body)['data']);
    kingdom.links =
        KingdomLinks.fromJsonMap(jsonDecode(response.body)['data']['links']);

    return kingdom;
  }

  //returna el listado de reinos
  Future<List<Kingdom>> getListKingdoms() async {
    final url = Uri.https(
        global.url, "${global.urlPart}/kingdoms", {"token": global.token});

    final response = await http.get(url);
    print("Status Code: ${response.statusCode}");
    ListKingdom listKingdom =
        ListKingdom.fromJsonList(jsonDecode(response.body)['data']);

    return listKingdom.items;
  }
}
