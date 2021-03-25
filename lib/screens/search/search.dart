
import 'package:flutter/material.dart';
import 'package:flutter_cache_manager/flutter_cache_manager.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import 'package:myapp/Controllers/search_controller.dart';
import 'package:myapp/models/species.dart';
import 'package:myapp/screens/search/localWidgets/floating_action_button.dart';
import 'package:myapp/screens/search/localWidgets/list_species.dart';
import 'package:myapp/screens/search/localWidgets/loading.dart';
import 'package:myapp/widgets/appBar.dart';
import 'package:myapp/widgets/drawer.dart';
import 'package:myapp/widgets/fondo.dart';

class Search extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return SearchState();
  }
}

class SearchState extends State<Search> {
  DefaultCacheManager manager = new DefaultCacheManager();
  TextEditingController _textEditingController = TextEditingController();
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  List<Species> listSpecies = <Species>[];

  @override
  void dispose() {
    // TODO: implement dispose

    super.dispose();
  }



  @override
  Widget build(BuildContext context) {
    return GetBuilder<SearchController>(
        id: "search",
        init: SearchController(),
        builder: (_) {
          _textEditingController.text = _.textSearch;

          return Scaffold(
            key: _scaffoldKey,
            appBar: PreferredSize(
              child: NavBar(
                scaffoldState: _scaffoldKey,
                title: "Search Result",
                startPage: false,
              ),
              preferredSize: Size(Get.width, 100),
            ),
            body: Stack(
              children: [
                FondoApp(),
                Center(
                  child: Container(
                    margin: EdgeInsets.fromLTRB(20, 10, 20, 0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Material(
                            elevation: 8,
                            shadowColor: Colors.black,
                            borderRadius:
                                BorderRadius.all(Radius.circular(50.0)),
                            child: TextField(
                              controller: _textEditingController,
                              textInputAction: TextInputAction.go,
                              //style: TextStyle(color: Colors.black),
                              keyboardType: TextInputType.text,
                              onSubmitted: (value) {
                                _.setTextSearch(value);
                                _.loadSpecies();
                              },
                              style: TextStyle(
                                  color: Theme.of(context)
                                      .textTheme
                                      .headline6
                                      .color),
                              decoration: const InputDecoration(
                                //labelText: 'Seach',
                                labelStyle: TextStyle(color: Colors.green),
                                enabledBorder: OutlineInputBorder(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(50.0)),
                                    borderSide: BorderSide(
                                        color: Colors.transparent, width: 0)),
                                focusedBorder: OutlineInputBorder(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(50.0)),
                                    borderSide: BorderSide(
                                        color: Colors.transparent, width: 0)
                                    // borderSide: BorderSide(color: Color(0xFF8DC63F), width: 2)
                                    ),
                                border: OutlineInputBorder(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(50.0)),
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
                            )),
                        SizedBox(
                          height: 10,
                        ),
                        ListSpeciesBuilder(),
                      ],
                    ),
                  ),
                ),
                LoadingModal()

              ],
            ),
            drawer: Drawer(
              child: DrawerNav(),
            ),
            floatingActionButton: FloatingAction(),
            floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
          );
        });
  }
}
