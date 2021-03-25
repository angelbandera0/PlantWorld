import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:myapp/models/species.dart';
import 'package:myapp/providers/global.dart';

class SpeciesProvider {
  //contiene todas las variables globales
  Global global = Global();
  String dataType = "species";

  //retorna la especie segun el id
  Future<Species> getSpeciest(int id) async {
    final url = Uri.https(
        global.url,
        "${global.urlPart}/$dataType/${id.toString()}",
        {"token": global.token});
    print(url);
    final response = await http.get(url);
    print("Status Code: ${response.statusCode}");
    Species data = Species.fromJsonMap(jsonDecode(response.body)['data']);
    return data;
  }

  //returna el listado de species
  Future<ListSpecies> getListSpeciesByString(String criteria,[int page]) async {
    final url = Uri.https(global.url, "${global.urlPart}/$dataType/search",
        {"token": global.token, "q": criteria,"page":(page==null)?null:page.toString()});
    print(url);
    final response = await http.get(url);
    print("Status Code: ${response.statusCode}");
    ListSpecies list = ListSpecies.fromJsonList(jsonDecode(response.body));
    return list;
  }
}
