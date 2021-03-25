import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:myapp/models/division_class.dart';
import 'package:myapp/providers/global.dart';

class DivisionClassProvider {
  //contiene todas las variables globales
  Global global = Global();
  String dataType="division_classes";

  //retorna la division segun el id
  Future<DivisionClass> getDivisionClass(int id) async {
    final url = Uri.https(global.url,
        "${global.urlPart}/$dataType/${id.toString()}", {"token": global.token});

    final response = await http.get(url);
    print("Status Code: ${response.statusCode}");

    DivisionClass data = DivisionClass.fromJsonMap(jsonDecode(response.body)['data']);

    return data;
  }

  //returna el listado de reinos
  Future<List<DivisionClass>> getListDivisionClass() async {
    final url = Uri.https(
        global.url, "${global.urlPart}/$dataType", {"token": global.token});

    final response = await http.get(url);
    print("Status Code: ${response.statusCode}");
    ListDivisionClass list =
    ListDivisionClass.fromJsonList(jsonDecode(response.body)['data']);

    return list.items;
  }
}
