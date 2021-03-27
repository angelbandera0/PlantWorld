import 'dart:io';

import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:meta/meta.dart';
import 'package:myapp/Controllers/search_controller.dart';
import 'package:myapp/support_class/my_http_override.dart';
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';

class PhotoFileController extends GetxController {
  final Dio dio = Dio();
  SearchController instanceSearchController;
  bool isPosibleDown = false;
  bool _loadingDownloadPhoto = false;
  double progress = 0;
  String newPath = "";
  Directory directory;
  Map<String, bool> mapDownloads = Map<String, bool>();

  get loadingDownloadPhoto => _loadingDownloadPhoto;

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
//    print(Get.find<SearchController>().toString()+"hgjgjgjgjgjgj");
    try {
      instanceSearchController = Get.find<SearchController>();
    } catch (e) {}
    _startDirectoryRoute();
  }

  void _startDirectoryRoute() {
    getExternalStorageDirectory().then((value) {
      print(5);
      directory = value;
      List<String> folders = directory.path.split("/");
      for (int x = 1; x < folders.length; x++) {
        String folder = folders[x];
        if (folder != "Android") {
          newPath += "/" + folder;
        } else {
          break;
        }
      }
      newPath = newPath + "/MyPlantWorldApp";
      directory = Directory(newPath);
    });
  }

  Future<bool> savePhoto(
      String url, String filename, String id, bool flag) async {
    try {
      if (await _requestPermission(Permission.storage)) {
      } else {
        return false;
      }
      if (!await directory.exists()) {
        await directory.create(recursive: true);
      }
      else {
        File saveFile = File(directory.path + "/$filename");
        //print(saveFile.path);
        HttpOverrides.global = new MyHttpOverrides();
        //print(url);
        await dio.download(url, saveFile.path,
            onReceiveProgress: (downloaded, totalSize) {
          progress = downloaded / totalSize;
          if (flag) {
            instanceSearchController.update([id]);
          }
        });
        progress = 0;
        return true;
      }
      return true;
    } catch (e) {
      //print(e);
      return false;
    }
  }

  Future<bool> _requestPermission(Permission permission) async {
    if (await permission.isGranted) {
      return true;
    } else {
      var result = await permission.request();
      return result == PermissionStatus.granted;
    }
  }

  Future<bool> downloadPhoto(
      String id, String nombreCientifico, String url, bool flag) async {
    _loadingDownloadPhoto = true;

    if (flag) instanceSearchController.update([id]);

    bool download = await savePhoto(
        url,
        "${nombreCientifico.removeAllWhitespace.toLowerCase() + id}.jpg",
        id,
        flag);
    _loadingDownloadPhoto = false;
    isPosibleDown = true;

    if (flag) instanceSearchController.update([id]);

    return download;
  }

  Future<File> getLocalFile(String filename, [String url]) async {
    String dir = (await getApplicationDocumentsDirectory()).path;
    File f = new File('$newPath/$filename');
    print(f);
    return f;
  }

  bool existPhoto(String filename) {
    File file = new File('$newPath/$filename');
    print(newPath);
    bool a = file.existsSync();
    print(a);
    return a;
  }
}
