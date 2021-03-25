import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart' as path_provider;

class HiveGlobal{
  List<Box> boxList = [];
  HiveGlobal(){

  }
  Future<List<Box>> _openBox() async {
    final appDocumentDirectory =  await path_provider.getApplicationDocumentsDirectory();
    Hive.init(appDocumentDirectory.path);
    var box_session = await Hive.openBox("images_urls");
    var box_comment = await Hive.openBox("species");
    boxList.add(box_session);
    boxList.add(box_comment);
    return boxList;
  }

}