import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

//var reference 
Color menuBackground = Color(0XFF272D34);
Color selectedColorBG = Color(0xFF4AC8EA);
TextStyle textStyleparDefault = 
GoogleFonts.libreBaskerville(textStyle: TextStyle(color: Colors.white70, fontSize: 15, fontWeight: FontWeight.w500));
TextStyle textStyleSelected = 
GoogleFonts.libreBaskerville(textStyle: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.w600)); 
//CollapseListTile
class CollapseMenuModel {
  String title; 
  IconData theicon;
  int indexRecognition; 

  CollapseMenuModel({
    @required this.title, 
    @required this.theicon, 
    this.indexRecognition, 
  });
}

//passer cette liste en parametre de CollapseListTile
List<CollapseMenuModel> navigationModelItems = [
  CollapseMenuModel(title: "Mode CLock", theicon: Icons.lock_clock, indexRecognition: 0),
  CollapseMenuModel(title: "Noter l'application", theicon: Icons.question_answer, indexRecognition: 1),
  CollapseMenuModel(title: "Liker l'application",  theicon: Icons.favorite, indexRecognition: 2),
  CollapseMenuModel(title: "Page des param", theicon: Icons.settings,indexRecognition: 3),
]; 


class CollapseListTile extends StatefulWidget {
  //constructeur
  final String title; 
  final IconData theicon; 
  final AnimationController animationcontroller; 
  final bool isSelectedListTile; 
  final Function onTapFunction; 

  CollapseListTile({
    @required this.title, 
    @required this.theicon,
    @required this.animationcontroller,
    this.isSelectedListTile = false, 
    this.onTapFunction,
  });
  @override
  _CollapseListTileState createState() => _CollapseListTileState();
}

class _CollapseListTileState extends State<CollapseListTile> {
  //variables
  Animation<double> widthReferenceAnimation, sizedboxReferenceAnimation;
  double maxWidthAnimation = 270; 
  double minWidthAnimation = 80; 

  double maxWidthSizedBox  = 10; 
  double minWidthSizedBox = 0;

  @override 
  void initState() {
     widthReferenceAnimation = Tween<double>(
        begin: maxWidthAnimation, 
        end: minWidthAnimation)
        .animate(widget.animationcontroller);

      sizedboxReferenceAnimation = Tween<double>(
        begin: maxWidthSizedBox, 
        end: minWidthSizedBox,)
        .animate(widget.animationcontroller); 
    super.initState();
  }
  @override 
  Widget build(BuildContext context) {
    return InkWell(
      onTap: widget.onTapFunction,
      child: Container(
        width: widthReferenceAnimation.value,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15), 
          color: widget.isSelectedListTile ? 
          Colors.transparent.withOpacity(0.5)
          : Colors.transparent,),
          margin: EdgeInsets.symmetric(horizontal: 8, vertical: 8),
          child: Row(
            children: <Widget> [
              Icon(
                widget.theicon, 
                color: widget.isSelectedListTile ? selectedColorBG: Colors.white38, 
                size: 35),
              //pour éviter les renderflex 
              SizedBox(width: sizedboxReferenceAnimation.value), 
              (widthReferenceAnimation.value >= 235) 
              ? Text(widget.title, 
                style: widget.isSelectedListTile ? 
                textStyleSelected
                : textStyleparDefault) 
              : Container()
            ],
          ),
        ),
    );
    }
  }