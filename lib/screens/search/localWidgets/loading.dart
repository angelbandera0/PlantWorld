import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:myapp/Controllers/search_controller.dart';
import 'package:progress_hud/progress_hud.dart';

class LoadingModal extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<SearchController>(
        id: 'loading',
        builder: (_) {
          ProgressHUD _progressHUD = new ProgressHUD(
            backgroundColor: Colors.black12,
            color: Colors.white,
            containerColor: Colors.green,
            borderRadius: 5.0,
            text: 'Loading...',
            loading: true,
          );
          // print(_.isLoading.toString());
          return (_.isLoading) ? _progressHUD : Container();
        });
  }
}
