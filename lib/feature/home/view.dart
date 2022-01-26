import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:untitled1/constant/size.dart';
import 'package:untitled1/constant/style.dart';
import 'package:untitled1/feature/home/unit/logo_image.dart';
import 'package:untitled1/feature/home/unit/media_feature.dart';

import '../../constant/color.dart';

class HomeView extends StatefulWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  _HomeViewState createState() => _HomeViewState();
}
ScrollController scollBarController = ScrollController();

class _HomeViewState extends State<HomeView> {
  @override
  Widget build(BuildContext context) {
    // SystemChrome.setEnabledSystemUIOverlays([]);
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: const SystemUiOverlayStyle(
          statusBarColor:  Colors.white12,
          statusBarIconBrightness: Brightness.dark

      ),
      child: Scaffold(
          body: SafeArea(
            child: Scrollbar(
              controller: scollBarController,
              thickness: 5,
              trackVisibility:true,
              showTrackOnHover:true,
              interactive:true,
              radius: const Radius.circular(15),
              isAlwaysShown: true,
              child: SingleChildScrollView(
                controller:scollBarController ,
                child: Column(
                  children: [
                     LogoImage('assets/image/elefant.png'),
                    Text('Media Player',style: kbcstyle(context, 25, kPrimaryColor),),
                    SizedBox(height: 10),
                    MediaFeature('assets/image/paplo.jpg','Marwan Pablo','Control'),
                    MediaFeature('assets/image/maraka.jpg','Aziz Marka','Bent Nas'),
                    MediaFeature('assets/image/nor.jpg','Abo AlAnwar','Khalsana')


                  ],
                ),
              ),
            ),
          ),
      ),
    );
  }
}

//
// return AnnotatedRegion<SystemUiOverlayStyle>(
// value: const SystemUiOverlayStyle(
// statusBarColor:  Colors.white12,
// statusBarIconBrightness: Brightness.dark
//
// ),