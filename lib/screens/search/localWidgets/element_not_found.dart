import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:myapp/Controllers/search_controller.dart';

class ElementNotFound extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<SearchController>(
        id: "noInternetConnection",
        builder: (_) {
          return Align(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  "Element Not Found",
                  style: TextStyle(fontSize: 25),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 10.0),
                ),
                Icon(
                  Icons.delete_outline,
                  size: 96,
                )
              ],
            ),
            alignment: Alignment.center,
          );
        });
  }
}
