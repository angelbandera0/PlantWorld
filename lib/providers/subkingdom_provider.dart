import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:myapp/models/subkingdom.dart';
import 'package:myapp/providers/global.dart';

class SubkingdomProvider {
  //contiene todas las variables globales
  Global global = Global();

  //retorna el sub-reino segun el id
  Future<SubKingdom> getSubKingdom(int id) async {
    final url = Uri.https(
        global.url,
        "${global.urlPart}/subkingdoms/${id.toString()}",
        {"token": global.token});
    print(url);
    final response = await http.get(url);
    print("Status Code: ${response.statusCode}");

    SubKingdom subkingdom =
        SubKingdom.fromJsonMap(jsonDecode(response.body)['data']);
    subkingdom.links =
        SubKingdomLinks.fromJsonMap(jsonDecode(response.body)['data']['links']);

    return subkingdom;
  }

  //returna el listado de sub-reinos
  Future<List<SubKingdom>> getListSubKingdoms() async {
    final url = Uri.https(
        global.url, "${global.urlPart}/subkingdoms", {"token": global.token});
    print(url);

    final response = await http.get(url);
    print("Status Code: ${response.statusCode}");
    ListSubKingdom listsubKingdom =
        ListSubKingdom.fromJsonList(jsonDecode(response.body)['data']);

    return listsubKingdom.items;
  }
}
