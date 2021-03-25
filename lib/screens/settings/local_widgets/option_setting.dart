import 'package:flutter/material.dart';
import 'package:get/state_manager.dart';
import 'package:meta/meta.dart' show required;
import 'package:myapp/Controllers/settings_controller.dart';
import 'package:myapp/enums/options.dart';
import 'package:myapp/screens/home/localWidgets/option.dart';
import 'package:myapp/themes/app_theme.dart';

class OptionSetting extends StatelessWidget {
  final String id;
  final String nameOption;
  final Options optionEnum;
  final Function function;
  final bool defaultValue;
  OptionSetting(
      {@required this.id,
      @required this.nameOption,
      @required this.optionEnum,
      @required this.defaultValue,
      this.function});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<SettingsController>(
        id: id,
        builder: (_) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    nameOption,
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  Switch(
                      value: _.getBoolByOption(optionEnum,defaultValue),
                      activeColor: Colors.green,
                      onChanged: (bool value) {
                        _.setBoolByOption(value, optionEnum);
                        if (function != null) {
                          (value)
                              ? function(AppTheme.darkTheme)
                              : function(AppTheme.lightTheme);
                        }
                      })
                ],
              ),
              Text(
                (_.getBoolByOption(optionEnum,defaultValue)) ? "Activated" : "Desactivated",
                style: TextStyle(),
              ),
            ],
          );
        });
  }
}
