import 'package:get/get.dart';
import 'package:hive/hive.dart';

class HiveGlobalController extends GetxController {
  final Map<String,Box> mapBoxes=Map<String,Box>();

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
   openBox();
  }

  Future<Map<String,Box>> openBox() async {
    var box_images = await Hive.openBox("images_urls");
    var box_species = await Hive.openBox("species");
    mapBoxes["imagesUrls"]=(box_images);
    mapBoxes["species"]=(box_species);
    return mapBoxes;
    }
}