import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:myapp/models/division.dart';
import 'package:myapp/providers/global.dart';
import 'package:myapp/support_class/uriAux.dart';

class DivisionProvider {
  //contiene todas las variables globales
  Global global = Global();
  String dataType="divisions";

  //retorna la division segun el id
  Future<Division> getDivision(int id) async {
    final url = Uri.https(global.url,
        "${global.urlPart}/$dataType/${id.toString()}", {"token": global.token});

    final response = await http.get(url);
    print("Status Code: ${response.statusCode}");

    Division data = Division.fromJsonMap(jsonDecode(response.body)['data']);

    return data;
  }

  //returna el listado de division
  Future<ListDivision> getListDivisionByString() async {
    int page = 1; //inicializa las paginas

    final url = Uri.https(global.url, "${global.urlPart}/$dataType",
        {"token": global.token, "page": page.toString()}); //construye la ruta
    print(url);

    final response = await http.get(url); //realiza la peticion a la api
    print("Status Code: ${response.statusCode}");

    ListDivision list = ListDivision.fromJsonList(
        jsonDecode(response.body)); //mapeo el resultado

    int lastPage = int.parse(UriAux().parametersUrl(
        list.links.last)['page']); //guardo el numero de la ultima pagina

    for (int i = 2; i <= lastPage; i++) {
      //itero las paginas
      page++; //incremento page

      final url = Uri.https(global.url, "${global.urlPart}/$dataType",
          {"token": global.token, "page": page.toString()});
      print(url);

      final response = await http.get(url);
      print("Status Code: ${response.statusCode}");

      ListDivision aux =
      ListDivision.fromJsonList(jsonDecode(response.body));

      list.items = [list.items, aux.items]
          .expand((element) => element)
          .toList(); //agrego una lista dentro de otra
    }
    return list;
  }
}
