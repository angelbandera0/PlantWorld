import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:myapp/models/genus.dart';
import 'package:myapp/providers/global.dart';

class GenusProvider {
  //contiene todas las variables globales
  Global global = Global();
  String dataType = "genus";

  //retorna el genero segun el id
  Future<Genus> getGenus(int id) async {
    final url = Uri.https(
        global.url,
        "${global.urlPart}/$dataType/${id.toString()}",
        {"token": global.token});
    print(url);
    final response = await http.get(url);
    print("Status Code: ${response.statusCode}");
    Genus data = Genus.fromJsonMap(jsonDecode(response.body)['data']);
    return data;
  }

  //returna el listado de genus
  Future<ListGenus> getListGenusByString(String criteria) async {
    final url = Uri.https(global.url, "${global.urlPart}/$dataType",
        {"token": global.token, "filter[slug]": criteria});
    print(url);
    final response = await http.get(url);
    print("Status Code: ${response.statusCode}");
    ListGenus list = ListGenus.fromJsonList(jsonDecode(response.body));
    return list;
  }
}
