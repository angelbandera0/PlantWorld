import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:myapp/Controllers/home_controller.dart';
import 'package:myapp/Controllers/photo_file_controller.dart';

class SearchInput extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(
        builder: (_){
          return Material(
            elevation: 8,
            shadowColor: Colors.black,
            borderRadius:
            BorderRadius.all(Radius.circular(50.0)),
            child: TextField(
              textInputAction: TextInputAction.go,
              style: TextStyle(
                  color: Theme.of(context)
                      .textTheme
                      .headline6
                      .color),
              keyboardType: TextInputType.text,
              decoration: const InputDecoration(
                //labelText: 'Seach',
                labelStyle: TextStyle(color: Colors.green),
                enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(
                        Radius.circular(50.0)),
                    borderSide: BorderSide(
                        color: Colors.transparent, width: 0)),
                focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(
                        Radius.circular(50.0)),
                    borderSide: BorderSide(
                        color: Colors.transparent, width: 0)
                  // borderSide: BorderSide(color: Color(0xFF8DC63F), width: 2)
                ),
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(
                        Radius.circular(50.0)),
                    borderSide: BorderSide(
                        color: Colors.transparent, width: 0)
                  // borderSide: BorderSide(color: Colors.green)
                ),
                prefixIcon: Icon(
                  Icons.search,
                  color: Colors.green,
                ),
                filled: true,
                //fillColor: (c)?Colors.white:Colors.black45,

              ),
              onSubmitted: (value) {
                _.navigateToSeachSpecies(value);

              },
            ),
          );
        });
  }
}
