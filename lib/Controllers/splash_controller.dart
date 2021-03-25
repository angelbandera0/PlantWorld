
import 'package:get/get.dart';
import 'package:myapp/config/hive.dart';
import 'package:myapp/screens/home/home.dart';

class SplashController extends GetxController{

  @override
  void onReady() {
    // TODO: implement onReady
    super.onReady();
    Future.delayed(Duration(seconds: 6),(){
      Get.offAll(Home(),transition: Transition.fadeIn);
    });
  }
}