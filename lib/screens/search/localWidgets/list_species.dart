import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:myapp/Controllers/search_controller.dart';
import 'package:myapp/screens/search/localWidgets/element_not_found.dart';
import 'package:myapp/screens/search/localWidgets/no_internet_connection.dart';
import 'package:myapp/shared_preferences/settings.dart';

import 'card_search.dart';

class ListSpeciesBuilder extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<SearchController>(
        id: "listSpecies",
        builder: (_) {
          return Expanded(child: buildList(_));
        });
  }

  Widget buildList(SearchController _) {
    if (_.connectionStatus == "none") {
      return NoInternetConnection();
    } else {
      return (_.listSpecies.length == 0)
          ? ElementNotFound()
          : ListView.builder(
              itemCount: _.listSpecies.length + 2,
              controller: _.scrollController,
              itemBuilder: (BuildContext context, int i) {
                //permite saber si se puede bajar automaticamente el recurso
                bool connection =
                    PreferenceUtils.getBool(_.connectionStatus, true);

                if (i == 0) {
                  return Container(
                    padding: EdgeInsets.fromLTRB(5, 10, 5, 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Plants Found:",
                          style: TextStyle(
                              color: Colors.white, fontWeight: FontWeight.bold),
                        ),
                        Text(
                          _.itemsFounds.toString(),
                          style: TextStyle(
                              color: Colors.white, fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  );
                }
                else if (i != 0 && i == (_.listSpecies.length + 1)) {
                  if (_.listSpeciesObj.links.next != null) {
                    return SizedBox(
                      width: Get.width * 0.9,
                      height: 50,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          primary: Colors.green,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20)),
                        ),
                        onPressed: () {
                          _.loadMoreSpecies();
                        },
                        child: Text(
                          "Load More",
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    );
                  }
                  return Container();
                }
                //_.mapDownloads[_.listSpecies[i - 1].id.toString()] = false;
                if(_.connectionStatus!='none') {
                  return Center(
                    child: CardSearch(
                      _.listSpecies[i - 1],
                    ),
                  );
                }
                return Container();

              });
    }
  }
}
