import 'package:audio_video_progress_bar/audio_video_progress_bar.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:just_audio/just_audio.dart';
import 'package:untitled1/constant/color.dart';
import 'package:untitled1/constant/style.dart';

import '../home/unit/logo_image.dart';
import 'model/view.dart';

class DetailsScreen extends StatefulWidget {
  String img;
  String title;
  String subtitle;
   DetailsScreen(this.img,this.title,this.subtitle);

  @override
  _DetailsScreenState createState() => _DetailsScreenState();
}

class _DetailsScreenState extends State<DetailsScreen> {
  late final PageManager _pageManager;

  @override
  void initState() {
    super.initState();
    _pageManager = PageManager();
  }

  @override
  void dispose() {
    _pageManager.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(color: kblack,size: 30),
        backgroundColor: Colors.white,
        actions: const [
         Center(
           child: Padding(
             padding: EdgeInsets.only(right: 10),
             child: FaIcon(FontAwesomeIcons.music),
           ),
         ),
        ],
        elevation: 0,

      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
             LogoImage(widget.img),
            ListTile(
              title: Text(widget.title,style: kbcstyle(context, 25, kblack),),
              subtitle: Text(widget.subtitle,style: kcstyle(context, 15, kblack),),
            ),
            ValueListenableBuilder<ProgressBarState>(
              valueListenable: _pageManager.progressNotifier,
              builder: (_, value, __) {
                return ProgressBar(
                  thumbColor: kPrimaryColor,
                  progressBarColor: kPrimaryColor.withOpacity(0.8),
                  bufferedBarColor: Colors.black38,
                  baseBarColor: Colors.grey.withOpacity(0.3),
                  progress: value.current,
                  buffered: value.buffered,
                  total: value.total,
                  onSeek: _pageManager.seek,
                );
              },
            ),
            ValueListenableBuilder<ButtonState>(
              valueListenable: _pageManager.buttonNotifier,
              builder: (_, value, __) {
                switch (value) {
                  case ButtonState.loading:
                    return Container(
                      margin: const EdgeInsets.all(8.0),
                      width: 32.0,
                      height: 32.0,
                      child: const CircularProgressIndicator(),
                    );
                  case ButtonState.paused:
                    return IconButton(
                      icon: const FaIcon(FontAwesomeIcons.playCircle,size: 40,),
                      iconSize: 32.0,
                      onPressed: _pageManager.play,
                    );
                  case ButtonState.playing:
                    return IconButton(
                      icon: const  FaIcon(FontAwesomeIcons.pauseCircle,size: 40,),
                      iconSize: 32.0,
                      onPressed: _pageManager.pause,
                    );
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}