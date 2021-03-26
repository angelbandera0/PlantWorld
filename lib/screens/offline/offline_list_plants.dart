import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:hive/hive.dart';
import 'package:myapp/Controllers/offline_list_plant_controller.dart';
import 'package:myapp/models/hive/speciesOfflineHive.dart';
import 'package:myapp/screens/offline/localWidgets/card_offline.dart';
import 'package:myapp/widgets/appBar.dart';
import 'package:myapp/widgets/drawer.dart';
import 'package:myapp/widgets/fondo.dart';

class OfflineListPlants extends StatelessWidget {
  //DefaultCacheManager manager = new DefaultCacheManager();
  TextEditingController _textEditingController = TextEditingController();
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  //List<Species> listSpecies = <Species>[];
  @override
  Widget build(BuildContext context) {
    return GetBuilder<OfflineListPlantController>(
      init: OfflineListPlantController(),
      builder: (_) => Scaffold(
        key: _scaffoldKey,
        appBar: PreferredSize(
          child: NavBar(
            scaffoldState: _scaffoldKey,
            title: "Saved Plants",
            startPage: false,
          ),
          preferredSize: Size(Get.width, 100),
        ),
        body: Stack(
          children: [
            FondoApp(),
            Align(
              alignment: Alignment.topCenter,
              child: Center(
                child: Container(
                  margin: EdgeInsets.fromLTRB(20, 10, 20, 0),
                  child: Column(
                    //mainAxisAlignment: MainAxisAlignment.spaceAround,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Material(
                          elevation: 8,
                          shadowColor: Colors.black,
                          borderRadius: BorderRadius.all(Radius.circular(50.0)),
                          child: TextField(
                            controller: _textEditingController,
                            textInputAction: TextInputAction.go,
                            //style: TextStyle(color: Colors.black),
                            keyboardType: TextInputType.text,onChanged:(value)=>_.search(value),
                            onSubmitted: (value) =>_.search(value),
                            style: TextStyle(
                                color:
                                Theme.of(context).textTheme.headline6.color),
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
                  Expanded(
                    child: ListView.builder(itemCount: _.list.length,
                      itemBuilder: (BuildContext context, int index) {
                        return CardOffline(_.list[index]);
                      },),
                  )
                      //ListSpeciesBuilder(),
                    ],
                  ),
                ),
              ),
            ),
            //LoadingModal()
          ],
        ),
        drawer: Drawer(
          child: DrawerNav(),
        ),
        //floatingActionButton: FloatingAction(),
        //floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      ),
    );
  }
}
