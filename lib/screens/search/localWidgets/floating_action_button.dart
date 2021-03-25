import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:myapp/Controllers/search_controller.dart';

class FloatingAction extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<SearchController>(
        id: "floatingActionButton",
        builder: (_) {
          return Visibility(
            visible: _.onTop&&(_.connectionStatus=="wifi" || _.connectionStatus=="dataMobile"),
            child: FloatingActionButton(
                child: Icon(
                  Icons.arrow_upward,
                  color: Colors.white,
                ),
                backgroundColor: Colors.teal,
                mini: false,
                onPressed: () {
                  _.srollToTop();
                }),
          );
        });
  }
}
