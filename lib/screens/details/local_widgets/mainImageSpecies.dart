import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:myapp/Controllers/details_controller.dart';
import 'package:shimmer/shimmer.dart';

class MainImageSpecies extends StatelessWidget {
  String imageUrl;
  int cont;
  MainImageSpecies({this.imageUrl,this.cont});
  @override
  Widget build(BuildContext context) {
    return GetBuilder<DetailsController>(
        init: DetailsController(),
    builder: (_) => (imageUrl != null)
        ? GestureDetector(
      onTap: () => _showImage(
          context,
          imageUrl,
          (cont).toString()),
      child: Hero(
          tag: ++cont,
          child:
          CachedNetworkImage(
            placeholder:
                (context, url) =>
                SizedBox(
                  height:
                  Get.width * 0.5,
                  width:
                  Get.width * 0.9,
                  child: Container(
                    width: double
                        .infinity,
                    padding: const EdgeInsets
                        .symmetric(
                        horizontal:
                        16.0,
                        vertical:
                        16.0),
                    child: Column(
                      mainAxisSize:
                      MainAxisSize
                          .max,
                      children: <
                          Widget>[
                        Expanded(
                          child: Shimmer
                              .fromColors(
                            baseColor:
                            Colors
                                .grey[300],
                            highlightColor:
                            Colors
                                .grey[100],
                            child:
                            Row(
                              crossAxisAlignment:
                              CrossAxisAlignment.start,
                              children: [
                                Container(
                                  width:
                                  100.0,
                                  height:
                                  100.0,
                                  color:
                                  Colors.white,
                                ),
                                const Padding(
                                  padding:
                                  EdgeInsets.symmetric(horizontal: 8.0),
                                ),
                                Expanded(
                                  child:
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: <Widget>[
                                      Container(
                                        width: double.infinity,
                                        height: 8.0,
                                        color: Colors.white,
                                      ),
                                      const Padding(
                                        padding: EdgeInsets.symmetric(vertical: 2.0),
                                      ),
                                      Container(
                                        width: double.infinity,
                                        height: 8.0,
                                        color: Colors.white,
                                      ),
                                      const Padding(
                                        padding: EdgeInsets.symmetric(vertical: 2.0),
                                      ),
                                      Container(
                                        width: double.infinity,
                                        height: 8.0,
                                        color: Colors.white,
                                      ),
                                      const Padding(
                                        padding: EdgeInsets.symmetric(vertical: 2.0),
                                      ),
                                      Container(
                                        width: double.infinity,
                                        height: 8.0,
                                        color: Colors.white,
                                      ),
                                      const Padding(
                                        padding: EdgeInsets.symmetric(vertical: 2.0),
                                      ),
                                      Container(
                                        width: double.infinity,
                                        height: 8.0,
                                        color: Colors.white,
                                      ),
                                      const Padding(
                                        padding: EdgeInsets.symmetric(vertical: 2.0),
                                      ),
                                      Container(
                                        width: double.infinity,
                                        height: 8.0,
                                        color: Colors.white,
                                      ),
                                      const Padding(
                                        padding: EdgeInsets.symmetric(vertical: 2.0),
                                      ),
                                      Container(
                                        width: 40,
                                        height: 8.0,
                                        color: Colors.white,
                                      ),
                                    ],
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
            fit: BoxFit.cover,
            imageUrl: imageUrl,
            height:
            Get.width * 0.5,
            width: Get.width,
          )),
    )
        : Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
            colors: [
              Colors.teal[400],
              Colors.green[400],
            ]),
      ),
      child: Column(
        crossAxisAlignment:
        CrossAxisAlignment
            .center,
        mainAxisAlignment:
        MainAxisAlignment
            .center,
        children: [
          Icon(
            Icons.insert_photo,
            size: 100,
            color: Colors.white54,
          ),
          Text(
            "Photo not available",
            style: TextStyle(
                color: Colors
                    .white54,
                fontSize: 25),
          )
        ],
      ),
      height: Get.width * 0.5,
      width: Get.width * 1,
    ),);
  }

  void _showImage(BuildContext context, String url, String tag) {
    Navigator.of(context).push(MaterialPageRoute(
        builder: (ctx) => Scaffold(
          body: Center(
            child: Hero(
                tag: tag,
                child: CachedNetworkImage(
                  placeholder: (context, url) => SizedBox(
                    height: Get.width * 0.5,
                    width: Get.width * 0.9,
                    child: Container(
                      width: double.infinity,
                      padding: const EdgeInsets.symmetric(
                          horizontal: 16.0, vertical: 16.0),
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        children: <Widget>[
                          Expanded(
                            child: Shimmer.fromColors(
                              baseColor: Colors.grey[300],
                              highlightColor: Colors.grey[100],
                              child: Row(
                                crossAxisAlignment:
                                CrossAxisAlignment.start,
                                children: [
                                  Container(
                                    width: 100.0,
                                    height: 100.0,
                                    color: Colors.white,
                                  ),
                                  const Padding(
                                    padding: EdgeInsets.symmetric(
                                        horizontal: 8.0),
                                  ),
                                  Expanded(
                                    child: Column(
                                      crossAxisAlignment:
                                      CrossAxisAlignment.start,
                                      children: <Widget>[
                                        Container(
                                          width: double.infinity,
                                          height: 8.0,
                                          color: Colors.white,
                                        ),
                                        const Padding(
                                          padding: EdgeInsets.symmetric(
                                              vertical: 2.0),
                                        ),
                                        Container(
                                          width: double.infinity,
                                          height: 8.0,
                                          color: Colors.white,
                                        ),
                                        const Padding(
                                          padding: EdgeInsets.symmetric(
                                              vertical: 2.0),
                                        ),
                                        Container(
                                          width: double.infinity,
                                          height: 8.0,
                                          color: Colors.white,
                                        ),
                                        const Padding(
                                          padding: EdgeInsets.symmetric(
                                              vertical: 2.0),
                                        ),
                                        Container(
                                          width: double.infinity,
                                          height: 8.0,
                                          color: Colors.white,
                                        ),
                                        const Padding(
                                          padding: EdgeInsets.symmetric(
                                              vertical: 2.0),
                                        ),
                                        Container(
                                          width: double.infinity,
                                          height: 8.0,
                                          color: Colors.white,
                                        ),
                                        const Padding(
                                          padding: EdgeInsets.symmetric(
                                              vertical: 2.0),
                                        ),
                                        Container(
                                          width: double.infinity,
                                          height: 8.0,
                                          color: Colors.white,
                                        ),
                                        const Padding(
                                          padding: EdgeInsets.symmetric(
                                              vertical: 2.0),
                                        ),
                                        Container(
                                          width: 40,
                                          height: 8.0,
                                          color: Colors.white,
                                        ),
                                      ],
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  fit: BoxFit.cover,
                  imageUrl: url,
                  height: double.infinity,
                )),
          ),
        )));
  }

}
