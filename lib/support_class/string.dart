import 'package:myapp/enums/options.dart';

class StringAuxMethods{
  String enumToString(Options o)=>o.toString().split('.')[1];
}