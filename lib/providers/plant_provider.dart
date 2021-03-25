import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:myapp/models/plant.dart';
import 'package:myapp/providers/global.dart';

class PlantProvider {
  //contiene todas las variables globales
  Global global = Global();
  String dataType="plants";

  //retorna la division segun el id
  Future<PlantProvider> getPlant(int id) async {
    final url = Uri.https(global.url,
        "${global.urlPart}/$dataType/${id.toString()}", {"token": global.token});
    print(url);
    final response = await http.get(url);
    print("Status Code: ${response.statusCode}");

   //Plant data = Plant.fromJsonMap(jsonDecode(response.body)['data']);

    return null;
  }

  //returna el listado de reinos
  Future<ListPlant> getListPlantByString(String criteria) async {

    final url = Uri.https(
        global.url, "${global.urlPart}/$dataType/search", {"token": global.token,"q":criteria});
    print(url);
    final response = await http.get(url);
    print("Status Code: ${response.statusCode}");
    ListPlant list = ListPlant.fromJsonList(jsonDecode(response.body));

    print(list.meta.total);
    return list;
  }
}
