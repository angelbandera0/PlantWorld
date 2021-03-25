import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:myapp/Controllers/splash_controller.dart';
//import 'package:wave/config.dart';
//import 'package:wave/wave.dart';

class SplashPage extends StatelessWidget{
  const SplashPage({Key key}):super(key:key);
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container()/*GetBuilder(
      init: SplashController(),
        builder: (_)=>Scaffold(
      body: Stack(
        children: [
          Center(
            child: WaveWidget(
              config: CustomConfig(
                gradients: [
                  [Colors.green, Color(0xEEF44336)],
                  [Colors.green[800], Color(0x77E57373)],
                  [Colors.teal, Color(0x66FF9800)],
                  [Colors.lightGreen, Color(0x55FFEB3B)]
                ],
                durations: [35000, 19440, 10800, 6000],
                heightPercentages: [0.60, 0.63, 0.65, 0.70],
                blur: MaskFilter.blur(BlurStyle.solid, 10),
                gradientBegin: Alignment.bottomLeft,
                gradientEnd: Alignment.topRight,
              ),
              backgroundColor: Colors.white,
              waveAmplitude: 0,

              size: Size(
                double.infinity,
                double.infinity,
              ),
            ),
            //child: CircularProgressIndicator(valueColor: AlwaysStoppedAnimation<Color>(Colors.green),),
          ),

          Positioned(
            child:Center(
              child: Transform.rotate(angle: 180*0.0174,child: WaveWidget(
                config: CustomConfig(
                  gradients: [
                    [Colors.green, Color(0xEEF44336)],
                    [Colors.green[800], Color(0x77E57373)],
                    [Colors.teal, Color(0x66FF9800)],
                    [Colors.lightGreen, Color(0x55FFEB3B)]
                  ],
                  durations: [35000, 19440, 10800, 6000],
                  heightPercentages: [0.60, 0.63, 0.65, 0.70],
                  blur: MaskFilter.blur(BlurStyle.solid, 10),
                  gradientBegin: Alignment.bottomLeft,
                  gradientEnd: Alignment.topRight,
                ),
                backgroundColor: Colors.white,
                waveAmplitude: 0,

                size: Size(Get.width, 400),
              )),
              //child: CircularProgressIndicator(valueColor: AlwaysStoppedAnimation<Color>(Colors.green),),
            ),
            top: -20,
          ),
          Center(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Welcome",
                    style: TextStyle(
                        fontFamily: "OpenSans",
                        fontWeight: FontWeight.bold,
                        fontSize: 40,
                        color: Colors.green),
                    //color: Color(0xFF8DC63F)),
                  ),
                  Text(
                    "Plant World",
                    style: TextStyle(
                        fontFamily: "EarthHeart",

                        fontSize: 55,
                        fontWeight: FontWeight.bold,
                        color: Colors.green),
                    //color: Color(0xFF8DC63F)),
                  ),
                ],
              )
          ),
        ],
      )
    ))*/;
  }
}