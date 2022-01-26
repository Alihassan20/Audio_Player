import 'package:flutter/material.dart';

TextStyle kbcstyle (BuildContext context, double fraction,  Color color) {

  return TextStyle(fontWeight: FontWeight.bold,fontSize:fraction,color: color, );
}

TextStyle kbstyle (BuildContext context, double fraction) {

  return TextStyle(fontWeight: FontWeight.bold,fontSize:fraction, );
}

TextStyle kcstyle (BuildContext context, double fraction,  Color color) {

  return TextStyle(fontSize:fraction,color: color);
}

TextStyle kstyle (BuildContext context, double fraction,  Color color) {

  return TextStyle(fontSize:fraction,color: color);
}