import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:untitled1/constant/color.dart';

import '../../../constant/size.dart';
import '../../details/view.dart';

class MediaFeature extends StatefulWidget {
  String img;
  String title;
  String subtitle;

  MediaFeature(this.img,this.title,this.subtitle);

  @override
  State<MediaFeature> createState() => _MediaFeatureState();
}

bool click = false;

class _MediaFeatureState extends State<MediaFeature> {
  @override
  Widget build(BuildContext context) {
    return  Padding(
      padding: const EdgeInsets.symmetric(vertical: 13, horizontal: 10),
      child: Stack(
        children: [
          GestureDetector(
            onTap: (){
              Navigator.of(context).push(MaterialPageRoute(builder: (_)=> DetailsScreen(
                widget.img,widget.title,widget.subtitle
              )));
            },
            child: Padding(
              padding: EdgeInsets.only(
                top: sizeFromHeight(context, 12),
              ),
              child: Container(
                height: sizeFromHeight(context, 6),
                decoration: BoxDecoration(
                    color: click==true?Colors.black:Colors.grey.withOpacity(0.2),
                    borderRadius: BorderRadius.circular(30)),
                child: Center(
                  child: ListTile(
                    title: Padding(
                      padding:  EdgeInsets.only(left: sizeFromWidth(context, 3)),
                      child:  Text(widget.title,style: TextStyle(color: click==true?kwhite:kblack,fontSize: 20,fontWeight: FontWeight.bold),),
                    ),
                    subtitle: Padding(
                      padding:  EdgeInsets.only(left: sizeFromWidth(context, 3)),
                      child:  Text(widget.subtitle,style: TextStyle(color: click==true?kwhite:kblack,fontSize: 15)),
                    ),
                    trailing:GestureDetector(
                      onTap: () {
                        setState(() {
                          click = !click;
                        });
                      },
                      child: Container(
                        child:  click == true
                            ?  FaIcon(FontAwesomeIcons.pauseCircle,size: 35,color: click==true?kwhite:kblack)
                            :  FaIcon(FontAwesomeIcons.playCircle,size: 35,color: click==true?kwhite:kblack),
                      ),
                    )
                  ),
                ),
              ),
            ),
          ),
          GestureDetector(
            onTap: (){
              Navigator.of(context).push(MaterialPageRoute(builder: (_)=> DetailsScreen(
                  widget.img,widget.title,widget.subtitle
              )));
            },
            child: Padding(
              padding: const EdgeInsets.only(left: 30),
              child: Container(
                decoration: BoxDecoration(
                    image: DecorationImage(
                        fit: BoxFit.cover, image: AssetImage(widget.img)),
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(30)),
                height: sizeFromHeight(context, 6),
                width: sizeFromWidth(context, 4),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
