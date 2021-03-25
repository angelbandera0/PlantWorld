import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:myapp/Controllers/search_controller.dart';

class NoInternetConnection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<SearchController>(
        id:"noInternetConnection",
        builder: (_){
         return Align(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  "No Internet Connection",
                  style: TextStyle(fontSize: 25),
                ),
                Icon(
                  Icons.signal_wifi_off,
                  size: 96,
                ),
                SizedBox(
                    width: Get.width * 0.5,
                    height: 50,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        primary: Colors.green,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20)),
                      ),
                      onPressed: () {
                        _.loadSpecies();
                      },
                      child: Text(
                        "Retry",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                            fontWeight: FontWeight.bold),
                      ),
                    )),
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 10.0),
                ),
              ],
            ),
            alignment: Alignment.center,
          );
    });
  }
}
