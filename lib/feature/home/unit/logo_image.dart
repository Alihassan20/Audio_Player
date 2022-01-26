import 'package:flutter/material.dart';

import '../../../constant/size.dart';
class LogoImage extends StatelessWidget {
  String img;
   LogoImage(this.img);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 20),
        child: Container(
            height: sizeFromHeight(context, 3),
            child: Image.asset(img)),
      ),
    );
  }
}
